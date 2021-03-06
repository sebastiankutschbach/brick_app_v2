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

  final UserTokenRepositoryFacade userTokenRepository =
      MockUserTokenRepository();
  final MockSettingsCubit mockSettingsCubit = MockSettingsCubit();
  late Dio dio;

  setUp(() {
    dio = Dio();
    when(() => mockSettingsCubit.state).thenReturn(const SettingsState(
        rebrickableUsername: username,
        rebrickablePassword: password,
        rebrickableApiKey: apiKey));
  });

  blocTest<AuthenticationCubit, AuthenticationState>(
      'unauthenticated by default',
      build: () =>
          AuthenticationCubit(dio, userTokenRepository, mockSettingsCubit),
      verify: (cubit) =>
          expect(cubit.state is AuthenticationStateUnauthenticated, true));

  blocTest<AuthenticationCubit, AuthenticationState>(
      'emits authenticated on successful login',
      build: () {
        when(() => userTokenRepository.getUserToken(
            username: username,
            password: password,
            apiKey: apiKey)).thenAnswer((_) async => right(userToken));
        return AuthenticationCubit(dio, userTokenRepository, mockSettingsCubit);
      },
      act: (cubit) => cubit.login(),
      expect: () => [const AuthenticationStateAuthenticated(userToken)],
      verify: (cubit) =>
          expect(dio.options.headers['Authorization'], 'key $apiKey'));

  blocTest<AuthenticationCubit, AuthenticationState>(
      'emits unauthenticated on failed login',
      build: () {
        when(() => userTokenRepository.getUserToken(
                username: username, password: password, apiKey: apiKey))
            .thenAnswer((_) async => left(const Failure('error')));
        return AuthenticationCubit(dio, userTokenRepository, mockSettingsCubit);
      },
      act: (cubit) => cubit.login(),
      expect: () => [const AuthenticationStateUnauthenticated()],
      verify: (cubit) => expect(dio.options.headers['Authorization'], null));

  blocTest<AuthenticationCubit, AuthenticationState>(
      'returns missing credentials error on login without configured credentials',
      build: () {
        when(() => mockSettingsCubit.state).thenReturn(const SettingsState(
            rebrickableUsername: '',
            rebrickablePassword: '',
            rebrickableApiKey: ''));
        return AuthenticationCubit(dio, userTokenRepository, mockSettingsCubit);
      },
      act: (cubit) async {
        final loginResult = await cubit.login();
        expect(loginResult.isLeft(), true);
        loginResult.fold((failure) => failure is WrongCredentialsFailure,
            (r) => fail('should not happen'));
      },
      expect: () => [const AuthenticationStateUnauthenticated()],
      verify: (cubit) => expect(dio.options.headers['Authorization'], null));
}
