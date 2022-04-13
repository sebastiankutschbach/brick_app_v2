import 'package:bloc_test/bloc_test.dart';
import 'package:brick_app_v2/application/cubit/authentication_cubit.dart';
import 'package:brick_app_v2/domain/failure.dart';
import 'package:brick_app_v2/infrastructure/rebrickable/user_token_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../mocks.dart';

main() {
  const username = 'username';
  const password = 'password';
  const apiKey = 'apiKey';
  const userToken = 'userToken';

  final UserTokenRepository _userTokenRepository = MockUserTokenRepository();
  late Dio _dio;

  setUpAll(() {
    _dio = Dio();
  });

  blocTest<AuthenticationCubit, AuthenticationState>(
      'unauthenticated by default',
      build: () => AuthenticationCubit(_dio, _userTokenRepository),
      verify: (cubit) =>
          expect(cubit.state is AuthenticationUnauthenticated, true));

  blocTest<AuthenticationCubit, AuthenticationState>(
      'emits authenticated on successful login',
      build: () {
        when(() => _userTokenRepository.getUserToken(
            username: username,
            password: password,
            apiKey: apiKey)).thenAnswer((_) async => right(userToken));
        return AuthenticationCubit(_dio, _userTokenRepository);
      },
      act: (cubit) =>
          cubit.login(username: username, password: password, apiKey: apiKey),
      expect: () => [const AuthenticationAuthenticated(userToken)],
      verify: (cubit) =>
          expect(_dio.options.headers['Authorization'], 'key $apiKey'));

  blocTest<AuthenticationCubit, AuthenticationState>(
      'emits unauthenticated on failed login',
      build: () {
        when(() => _userTokenRepository.getUserToken(
                username: username, password: password, apiKey: apiKey))
            .thenAnswer((_) async => left(const Failure('error')));
        return AuthenticationCubit(_dio, _userTokenRepository);
      },
      act: (cubit) =>
          cubit.login(username: username, password: password, apiKey: apiKey),
      expect: () => [AuthenticationUnauthenticated()],
      verify: (cubit) => expect(_dio.options.headers['Authorization'], null));
}
