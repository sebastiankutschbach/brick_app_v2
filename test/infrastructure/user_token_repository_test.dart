import 'package:brick_app_v2/infrastructure/rebrickable/rebrickable_api_constants.dart';
import 'package:brick_app_v2/infrastructure/rebrickable/user_token_repository.dart';
import 'package:brick_app_v2/injection.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

main() {
  const userToken = 'userToken';
  const username = 'username';
  const password = 'password';

  test('fetches user token with username and password', () async {
    final dio = Dio();
    final dioAdapter = DioAdapter(dio: dio);

    getIt.allowReassignment = true;
    getIt.registerSingleton<Dio>(dio);

    dioAdapter.onPost(userTokenUrl.toString(),
        (request) => request.reply(201, {'user_token': userToken}), data: {
      'username': username,
      'password': password
    }, headers: {
      Headers.contentTypeHeader: Headers.formUrlEncodedContentType
    });

    final result = await UserTokenRepository()
        .getUserToken(username: username, password: password);

    expect(result.isRight(), true);
    expect(result.getOrElse(() => fail('should not happen')), userToken);
  });

  test('returns failure on api error', () async {
    final dio = Dio();
    final dioAdapter = DioAdapter(dio: dio);

    getIt.allowReassignment = true;
    getIt.registerSingleton<Dio>(dio);

    dioAdapter.onPost(
        userTokenUrl.toString(), (request) => request.reply(429, 'Error'),
        data: {
          'username': username,
          'password': password
        },
        headers: {
          Headers.contentTypeHeader: Headers.formUrlEncodedContentType
        });

    final result = await UserTokenRepository()
        .getUserToken(username: username, password: password);

    expect(result.isLeft(), true);
    result.fold((failure) => expect(failure.message, 'Http status error [429]'),
        (r) => fail('should not happen'));
  });
}
