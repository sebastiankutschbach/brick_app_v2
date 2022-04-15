import 'dart:developer';

import 'package:brick_app_v2/domain/failure.dart';
import 'package:brick_app_v2/infrastructure/rebrickable_api_constants.dart';
import 'package:brick_app_v2/injection.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

abstract class UserTokenRepositoryFacade {
  Future<Either<Failure, String>> getUserToken(
      {required String username,
      required String password,
      required String apiKey});
}

@Injectable(as: UserTokenRepositoryFacade)
class UserTokenRepository implements UserTokenRepositoryFacade {
  @override
  Future<Either<Failure, String>> getUserToken(
      {required String username,
      required String password,
      required String apiKey}) async {
    try {
      final response = await getIt<Dio>().postUri(userTokenUrl,
          options: Options(headers: {
            Headers.contentTypeHeader: Headers.formUrlEncodedContentType,
            'Authorization': 'key $apiKey'
          }),
          data: 'username=$username&password=$password');
      return right(response.data['user_token']);
    } on DioError catch (e) {
      log('Error retrieving user token: ${e.message}');
      if (e.message.contains('[403]')) {
        return left(WrongCredentialsFailure(e.message));
      }
      return left(Failure(e.message));
    }
  }
}
