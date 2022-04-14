import 'package:bloc_test/bloc_test.dart';
import 'package:brick_app_v2/application/cubit/authentication_cubit.dart';
import 'package:brick_app_v2/application/cubit/settings_cubit.dart';
import 'package:brick_app_v2/domain/failure.dart';
import 'package:brick_app_v2/infrastructure/user_token_repository.dart';
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

  final UserTokenRepositoryFacade _userTokenRepository =
      MockUserTokenRepository();
  final MockSettingsCubit _mockSettingsCubit = MockSettingsCubit();
  late Dio _dio;

  setUpAll(() {
    _dio = Dio();
    when(() => _mockSettingsCubit.state).thenReturn(const SettingsState(
        rebrickableUsername: username,
        rebrickablePassword: password,
        rebrickableApiKey: apiKey));
  });

  blocTest<AuthenticationCubit, AuthenticationState>(
      'unauthenticated by default',
      build: () =>
          AuthenticationCubit(_dio, _userTokenRepository, _mockSettingsCubit),
      verify: (cubit) =>
          expect(cubit.state is AuthenticationUnauthenticated, true));

  blocTest<AuthenticationCubit, AuthenticationState>(
      'emits authenticated on successful login',
      build: () {
        when(() => _userTokenRepository.getUserToken(
            username: username,
            password: password,
            apiKey: apiKey)).thenAnswer((_) async => right(userToken));
        return AuthenticationCubit(
            _dio, _userTokenRepository, _mockSettingsCubit);
      },
      act: (cubit) => cubit.login(),
      expect: () => [const AuthenticationAuthenticated(userToken)],
      verify: (cubit) =>
          expect(_dio.options.headers['Authorization'], 'key $apiKey'));

  blocTest<AuthenticationCubit, AuthenticationState>(
      'emits unauthenticated on failed login',
      build: () {
        when(() => _userTokenRepository.getUserToken(
                username: username, password: password, apiKey: apiKey))
            .thenAnswer((_) async => left(const Failure('error')));
        return AuthenticationCubit(
            _dio, _userTokenRepository, _mockSettingsCubit);
      },
      act: (cubit) => cubit.login(),
      expect: () => [AuthenticationUnauthenticated()],
      verify: (cubit) => expect(_dio.options.headers['Authorization'], null));
}
