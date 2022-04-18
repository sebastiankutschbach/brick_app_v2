part of 'settings_cubit.dart';

@freezed
class SettingsState with _$SettingsState {
  const factory SettingsState(
      {@Default('') String rebrickableUsername,
      @Default('') String rebrickablePassword,
      @Default('') String rebrickableApiKey}) = _SettingsState;

  factory SettingsState.fromJson(Map<String, dynamic> json) =>
      _$SettingsStateFromJson(json);
}
