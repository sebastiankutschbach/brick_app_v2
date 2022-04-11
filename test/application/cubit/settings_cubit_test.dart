import 'package:bloc_test/bloc_test.dart';
import 'package:brick_app_v2/application/cubit/authentication_cubit.dart';
import 'package:brick_app_v2/application/cubit/settings_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../mocks.dart';

main() {
  const username = 'username';
  const password = 'password';
  const apiKey = 'apiKey';

  late AuthenticationCubit mockAuthenticationCubit = MockAuthenticationCubit();

  blocTest<SettingsCubit, SettingsState>('settings are empty initially',
      build: () => mockHydratedStorage<SettingsCubit>(
            () => SettingsCubit(MockAuthenticationCubit()),
          ),
      verify: (cubit) {
        expect(cubit.state.rebrickableUsername, '');
        expect(cubit.state.rebrickablePassword, '');
        expect(cubit.state.rebrickableApiKey, '');
      });

  blocTest<SettingsCubit, SettingsState>(
      'setting the username emits a new state',
      build: () => mockHydratedStorage<SettingsCubit>(
            () => SettingsCubit(mockAuthenticationCubit),
          ),
      act: (cubit) => cubit.setRebrickableUsername(username),
      expect: () => [
            const SettingsState(
                rebrickableUsername: username,
                rebrickablePassword: '',
                rebrickableApiKey: '')
          ],
      verify: (cubit) {
        expect(cubit.state.rebrickableUsername, username);
      });

  blocTest<SettingsCubit, SettingsState>(
      'setting the password emits a new state',
      build: () => mockHydratedStorage<SettingsCubit>(
          () => SettingsCubit(mockAuthenticationCubit)),
      act: (cubit) => cubit.setRebrickablePassword(password),
      expect: () => [
            const SettingsState(
                rebrickableUsername: '',
                rebrickablePassword: password,
                rebrickableApiKey: '')
          ],
      verify: (cubit) {
        expect(cubit.state.rebrickablePassword, password);
      });

  blocTest<SettingsCubit, SettingsState>(
      'setting the api key emits a new state',
      build: () => mockHydratedStorage<SettingsCubit>(
            () => SettingsCubit(mockAuthenticationCubit),
          ),
      act: (cubit) => cubit.setRebrickableApiKey(apiKey),
      expect: () => [
            const SettingsState(
                rebrickableUsername: '',
                rebrickablePassword: '',
                rebrickableApiKey: apiKey)
          ],
      verify: (cubit) {
        expect(cubit.state.rebrickableApiKey, apiKey);
      });

  blocTest<SettingsCubit, SettingsState>(
      'logs in when all credentials are provided', build: () {
    return mockHydratedStorage<SettingsCubit>(
      () => SettingsCubit(mockAuthenticationCubit),
    );
  }, act: (cubit) {
    cubit.setRebrickableUsername(username);
    cubit.setRebrickablePassword(password);
    cubit.setRebrickableApiKey(apiKey);
  }, verify: (cubit) {
    expect(cubit.state.rebrickableApiKey, apiKey);
    verify(() => mockAuthenticationCubit.login(
        username: username, password: password)).called(1);
  });
}
