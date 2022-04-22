// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'settings_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SettingsState _$SettingsStateFromJson(Map<String, dynamic> json) {
  return _SettingsState.fromJson(json);
}

/// @nodoc
mixin _$SettingsState {
  String get rebrickableUsername => throw _privateConstructorUsedError;
  String get rebrickablePassword => throw _privateConstructorUsedError;
  String get rebrickableApiKey => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SettingsStateCopyWith<SettingsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingsStateCopyWith<$Res> {
  factory $SettingsStateCopyWith(
          SettingsState value, $Res Function(SettingsState) then) =
      _$SettingsStateCopyWithImpl<$Res>;
  $Res call(
      {String rebrickableUsername,
      String rebrickablePassword,
      String rebrickableApiKey});
}

/// @nodoc
class _$SettingsStateCopyWithImpl<$Res>
    implements $SettingsStateCopyWith<$Res> {
  _$SettingsStateCopyWithImpl(this._value, this._then);

  final SettingsState _value;
  // ignore: unused_field
  final $Res Function(SettingsState) _then;

  @override
  $Res call({
    Object? rebrickableUsername = freezed,
    Object? rebrickablePassword = freezed,
    Object? rebrickableApiKey = freezed,
  }) {
    return _then(_value.copyWith(
      rebrickableUsername: rebrickableUsername == freezed
          ? _value.rebrickableUsername
          : rebrickableUsername // ignore: cast_nullable_to_non_nullable
              as String,
      rebrickablePassword: rebrickablePassword == freezed
          ? _value.rebrickablePassword
          : rebrickablePassword // ignore: cast_nullable_to_non_nullable
              as String,
      rebrickableApiKey: rebrickableApiKey == freezed
          ? _value.rebrickableApiKey
          : rebrickableApiKey // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$SettingsStateCopyWith<$Res>
    implements $SettingsStateCopyWith<$Res> {
  factory _$SettingsStateCopyWith(
          _SettingsState value, $Res Function(_SettingsState) then) =
      __$SettingsStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {String rebrickableUsername,
      String rebrickablePassword,
      String rebrickableApiKey});
}

/// @nodoc
class __$SettingsStateCopyWithImpl<$Res>
    extends _$SettingsStateCopyWithImpl<$Res>
    implements _$SettingsStateCopyWith<$Res> {
  __$SettingsStateCopyWithImpl(
      _SettingsState _value, $Res Function(_SettingsState) _then)
      : super(_value, (v) => _then(v as _SettingsState));

  @override
  _SettingsState get _value => super._value as _SettingsState;

  @override
  $Res call({
    Object? rebrickableUsername = freezed,
    Object? rebrickablePassword = freezed,
    Object? rebrickableApiKey = freezed,
  }) {
    return _then(_SettingsState(
      rebrickableUsername: rebrickableUsername == freezed
          ? _value.rebrickableUsername
          : rebrickableUsername // ignore: cast_nullable_to_non_nullable
              as String,
      rebrickablePassword: rebrickablePassword == freezed
          ? _value.rebrickablePassword
          : rebrickablePassword // ignore: cast_nullable_to_non_nullable
              as String,
      rebrickableApiKey: rebrickableApiKey == freezed
          ? _value.rebrickableApiKey
          : rebrickableApiKey // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SettingsState implements _SettingsState {
  const _$_SettingsState(
      {this.rebrickableUsername = '',
      this.rebrickablePassword = '',
      this.rebrickableApiKey = ''});

  factory _$_SettingsState.fromJson(Map<String, dynamic> json) =>
      _$$_SettingsStateFromJson(json);

  @override
  @JsonKey()
  final String rebrickableUsername;
  @override
  @JsonKey()
  final String rebrickablePassword;
  @override
  @JsonKey()
  final String rebrickableApiKey;

  @override
  String toString() {
    return 'SettingsState(rebrickableUsername: $rebrickableUsername, rebrickablePassword: $rebrickablePassword, rebrickableApiKey: $rebrickableApiKey)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SettingsState &&
            const DeepCollectionEquality()
                .equals(other.rebrickableUsername, rebrickableUsername) &&
            const DeepCollectionEquality()
                .equals(other.rebrickablePassword, rebrickablePassword) &&
            const DeepCollectionEquality()
                .equals(other.rebrickableApiKey, rebrickableApiKey));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(rebrickableUsername),
      const DeepCollectionEquality().hash(rebrickablePassword),
      const DeepCollectionEquality().hash(rebrickableApiKey));

  @JsonKey(ignore: true)
  @override
  _$SettingsStateCopyWith<_SettingsState> get copyWith =>
      __$SettingsStateCopyWithImpl<_SettingsState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SettingsStateToJson(this);
  }
}

abstract class _SettingsState implements SettingsState {
  const factory _SettingsState(
      {final String rebrickableUsername,
      final String rebrickablePassword,
      final String rebrickableApiKey}) = _$_SettingsState;

  factory _SettingsState.fromJson(Map<String, dynamic> json) =
      _$_SettingsState.fromJson;

  @override
  String get rebrickableUsername => throw _privateConstructorUsedError;
  @override
  String get rebrickablePassword => throw _privateConstructorUsedError;
  @override
  String get rebrickableApiKey => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$SettingsStateCopyWith<_SettingsState> get copyWith =>
      throw _privateConstructorUsedError;
}
