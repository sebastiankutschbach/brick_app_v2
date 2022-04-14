import 'dart:developer';
import 'dart:io';
import 'package:brick_app_v2/credentials/api_gateway.dart';
import 'package:brick_app_v2/domain/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';

abstract class MocRepositoryFacade {
  Future<List<String>> areBuildInstructionsAvailable(
      {required String setNum, required List<String> mocNums});

  Future<Either<Failure, File>> getBuildInstruction(
      {required String setNum, required String mocNum});

  Future<Either<Failure, Uri>> getBuildInstructionUrl(
      {required String setNum, required String mocNum});
}

@Injectable(as: MocRepositoryFacade)
class MocRepository implements MocRepositoryFacade {
  final Dio _dio;

  MocRepository(this._dio);

  @override
  Future<List<String>> areBuildInstructionsAvailable(
      {required String setNum, required List<String> mocNums}) async {
    final urlPath = '$apiGwBaseUrl/sets/$setNum';

    try {
      final response = await _dio.get(urlPath,
          options: Options(headers: {'x-api-key': apiGwKey}));

      final List<String> mocNameKeys = response.data['Contents']
          .map((content) => content['Key'])
          .cast<String>()
          .toList();

      final List<String> mocNames = mocNameKeys
          .map((mocNameKey) =>
              mocNameKey.replaceFirst('$setNum/', '').replaceFirst('.pdf', ''))
          .toList();

      return List<String>.from(
          mocNames.where((mocName) => mocNums.contains(mocName)));
    } on DioError catch (e) {
      final errMsg =
          'Could not request moc list for $setNum. Message: ${e.message}';
      log(errMsg);
      return List.empty();
    }
  }

  @override
  Future<Either<Failure, File>> getBuildInstruction(
      {required String setNum, required String mocNum}) async {
    final response =
        await getBuildInstructionUrl(setNum: setNum, mocNum: mocNum);

    return response.fold((failure) {
      return left(failure);
    }, (presignedUrl) async {
      final appDir = await getApplicationDocumentsDirectory();
      final File pdf = File('${appDir.path}/$setNum/$mocNum.pdf')
        ..createSync(recursive: true);

      await _dio
          .getUri<List<int>>(presignedUrl,
              options: Options(responseType: ResponseType.bytes))
          .then((r) {
        pdf.writeAsBytesSync(r.data ?? []);
      });

      return right(pdf);
    });
  }

  @override
  Future<Either<Failure, Uri>> getBuildInstructionUrl(
      {required String setNum, required String mocNum}) async {
    final urlPath = '$apiGwBaseUrl/sets/$setNum/mocs/$mocNum';
    try {
      final response = await _dio.getUri(Uri.parse(urlPath),
          options: Options(headers: {'x-api-key': apiGwKey}));
      return right(Uri.parse(response.data.replaceAll('"', '')));
    } on DioError catch (e) {
      final String errMsg =
          'Failed to get presigned url to build instructions for set $setNum and moc $mocNum from $urlPath. Message ${e.message}';
      log(errMsg);
      return left(Failure(errMsg));
    }
  }
}
