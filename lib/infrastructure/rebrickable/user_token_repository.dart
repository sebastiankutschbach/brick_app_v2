import 'dart:developer';

import 'package:brick_app_v2/domain/failure.dart';
import 'package:brick_app_v2/infrastructure/rebrickable/rebrickable_api_constants.dart';
import 'package:brick_app_v2/injection.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class UserTokenRepository {
  Future<Either<Failure, String>> getUserToken(
      {required String username, required String password}) async {
    try {
      final response = await getIt<Dio>().postUri(userTokenUrl,
          options: Options(headers: {
            Headers.contentTypeHeader: Headers.formUrlEncodedContentType
          }),
          data: {'username': username, 'password': password});
      return right(response.data['user_token']);
    } on DioError catch (e) {
      log('Error retrieving user token: ${e.message}');
      return left(Failure(e.message));
    }
  }
}
