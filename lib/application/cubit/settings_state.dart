part of 'settings_cubit.dart';

@immutable
class SettingsState {
  final String rebrickableUsername;
  final String rebrickablePassword;
  final String rebrickableApiToken;

  factory SettingsState.fromJson(Map<String, dynamic> json) {
    return SettingsState(
      rebrickableUsername: json['rebrickableUsername'] ?? '',
      rebrickablePassword: json['rebrickablePassword'] ?? '',
      rebrickableApiToken: json['rebrickableApiToken'] ?? '',
    );
  }

  const SettingsState(
      {required this.rebrickableUsername,
      required this.rebrickablePassword,
      required this.rebrickableApiToken});

  Map<String, dynamic> toJson() {
    return {
      'rebrickableUsername': rebrickableUsername,
      'rebrickablePassword': rebrickablePassword,
      'rebrickableApiToken': rebrickableApiToken
    };
  }

  SettingsState copyWith(
          {String? rebrickableUsername,
          String? rebrickablePassword,
          String? rebrickableApiToken}) =>
      SettingsState(
          rebrickableUsername: rebrickableUsername ?? this.rebrickableUsername,
          rebrickablePassword: rebrickablePassword ?? this.rebrickablePassword,
          rebrickableApiToken: rebrickableApiToken ?? this.rebrickableApiToken);
}
