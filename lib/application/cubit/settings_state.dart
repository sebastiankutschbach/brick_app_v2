part of 'settings_cubit.dart';

@immutable
class SettingsState extends Equatable {
  final String rebrickableUsername;
  final String rebrickablePassword;
  final String rebrickableApiKey;

  factory SettingsState.fromJson(Map<String, dynamic> json) {
    return SettingsState(
      rebrickableUsername: json['rebrickableUsername'] ?? '',
      rebrickablePassword: json['rebrickablePassword'] ?? '',
      rebrickableApiKey: json['rebrickableApiKey'] ?? '',
    );
  }

  const SettingsState(
      {required this.rebrickableUsername,
      required this.rebrickablePassword,
      required this.rebrickableApiKey});

  Map<String, dynamic> toJson() {
    return {
      'rebrickableUsername': rebrickableUsername,
      'rebrickablePassword': rebrickablePassword,
      'rebrickableApiKey': rebrickableApiKey
    };
  }

  SettingsState copyWith(
          {String? rebrickableUsername,
          String? rebrickablePassword,
          String? rebrickableApiKey}) =>
      SettingsState(
          rebrickableUsername: rebrickableUsername ?? this.rebrickableUsername,
          rebrickablePassword: rebrickablePassword ?? this.rebrickablePassword,
          rebrickableApiKey: rebrickableApiKey ?? this.rebrickableApiKey);

  @override
  List<Object?> get props =>
      [rebrickableUsername, rebrickablePassword, rebrickableApiKey];
}
