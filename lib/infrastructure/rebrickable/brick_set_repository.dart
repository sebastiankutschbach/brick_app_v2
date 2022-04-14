import 'package:brick_app_v2/domain/failure.dart';
import 'package:brick_app_v2/domain/moc.dart';
import 'package:brick_app_v2/infrastructure/rebrickable/rebrickable_api_constants.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class BrickSetRepository {
  final Dio _dio;

  BrickSetRepository(this._dio);

  Future<Either<Failure, List<Moc>>> loadMocs({required String setNum}) async {
    try {
      final mocsUrl =
          Uri.parse(setMocListUrlTemplate.expand({'set_num': setNum}));
      final response = await _dio.getUri(mocsUrl);
      final mocs = List<Moc>.from(
          response.data['results'].map((result) => Moc.fromJson(result)));
      return right(mocs);
    } on DioError catch (e) {
      return left(Failure(e.message));
    }
  }
}
