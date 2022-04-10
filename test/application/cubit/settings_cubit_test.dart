import 'package:bloc_test/bloc_test.dart';
import 'package:brick_app_v2/application/cubit/settings_cubit.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../mocks.dart';

main() {
  const username = 'username';
  const password = 'password';
  const apiKey = 'apiKey';

  blocTest<SettingsCubit, SettingsState>('settings are empty initially',
      build: () => mockHydratedStorage<SettingsCubit>(
            () => SettingsCubit(),
          ),
      verify: (cubit) {
        expect(cubit.state.rebrickableUsername, '');
        expect(cubit.state.rebrickablePassword, '');
        expect(cubit.state.rebrickableApiKey, '');
      });

  blocTest<SettingsCubit, SettingsState>(
      'setting the username emits a new state',
      build: () => mockHydratedStorage<SettingsCubit>(
            () => SettingsCubit(),
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
            () => SettingsCubit(),
          ),
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
            () => SettingsCubit(),
          ),
      act: (cubit) => cubit.setrebrickableApiKey(apiKey),
      expect: () => [
            const SettingsState(
                rebrickableUsername: '',
                rebrickablePassword: '',
                rebrickableApiKey: apiKey)
          ],
      verify: (cubit) {
        expect(cubit.state.rebrickableApiKey, apiKey);
      });
}
