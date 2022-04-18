// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'authentication_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$AuthenticationStateTearOff {
  const _$AuthenticationStateTearOff();

  AuthenticationStateUnauthenticated unauthenticated() {
    return const AuthenticationStateUnauthenticated();
  }

  AuthenticationStateAuthenticated authenticated(String userToken) {
    return AuthenticationStateAuthenticated(
      userToken,
    );
  }
}

/// @nodoc
const $AuthenticationState = _$AuthenticationStateTearOff();

/// @nodoc
mixin _$AuthenticationState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unauthenticated,
    required TResult Function(String userToken) authenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? unauthenticated,
    TResult Function(String userToken)? authenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unauthenticated,
    TResult Function(String userToken)? authenticated,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthenticationStateUnauthenticated value)
        unauthenticated,
    required TResult Function(AuthenticationStateAuthenticated value)
        authenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(AuthenticationStateUnauthenticated value)? unauthenticated,
    TResult Function(AuthenticationStateAuthenticated value)? authenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthenticationStateUnauthenticated value)? unauthenticated,
    TResult Function(AuthenticationStateAuthenticated value)? authenticated,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthenticationStateCopyWith<$Res> {
  factory $AuthenticationStateCopyWith(
          AuthenticationState value, $Res Function(AuthenticationState) then) =
      _$AuthenticationStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$AuthenticationStateCopyWithImpl<$Res>
    implements $AuthenticationStateCopyWith<$Res> {
  _$AuthenticationStateCopyWithImpl(this._value, this._then);

  final AuthenticationState _value;
  // ignore: unused_field
  final $Res Function(AuthenticationState) _then;
}

/// @nodoc
abstract class $AuthenticationStateUnauthenticatedCopyWith<$Res> {
  factory $AuthenticationStateUnauthenticatedCopyWith(
          AuthenticationStateUnauthenticated value,
          $Res Function(AuthenticationStateUnauthenticated) then) =
      _$AuthenticationStateUnauthenticatedCopyWithImpl<$Res>;
}

/// @nodoc
class _$AuthenticationStateUnauthenticatedCopyWithImpl<$Res>
    extends _$AuthenticationStateCopyWithImpl<$Res>
    implements $AuthenticationStateUnauthenticatedCopyWith<$Res> {
  _$AuthenticationStateUnauthenticatedCopyWithImpl(
      AuthenticationStateUnauthenticated _value,
      $Res Function(AuthenticationStateUnauthenticated) _then)
      : super(_value, (v) => _then(v as AuthenticationStateUnauthenticated));

  @override
  AuthenticationStateUnauthenticated get _value =>
      super._value as AuthenticationStateUnauthenticated;
}

/// @nodoc

class _$AuthenticationStateUnauthenticated
    implements AuthenticationStateUnauthenticated {
  const _$AuthenticationStateUnauthenticated();

  @override
  String toString() {
    return 'AuthenticationState.unauthenticated()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AuthenticationStateUnauthenticated);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unauthenticated,
    required TResult Function(String userToken) authenticated,
  }) {
    return unauthenticated();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? unauthenticated,
    TResult Function(String userToken)? authenticated,
  }) {
    return unauthenticated?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unauthenticated,
    TResult Function(String userToken)? authenticated,
    required TResult orElse(),
  }) {
    if (unauthenticated != null) {
      return unauthenticated();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthenticationStateUnauthenticated value)
        unauthenticated,
    required TResult Function(AuthenticationStateAuthenticated value)
        authenticated,
  }) {
    return unauthenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(AuthenticationStateUnauthenticated value)? unauthenticated,
    TResult Function(AuthenticationStateAuthenticated value)? authenticated,
  }) {
    return unauthenticated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthenticationStateUnauthenticated value)? unauthenticated,
    TResult Function(AuthenticationStateAuthenticated value)? authenticated,
    required TResult orElse(),
  }) {
    if (unauthenticated != null) {
      return unauthenticated(this);
    }
    return orElse();
  }
}

abstract class AuthenticationStateUnauthenticated
    implements AuthenticationState {
  const factory AuthenticationStateUnauthenticated() =
      _$AuthenticationStateUnauthenticated;
}

/// @nodoc
abstract class $AuthenticationStateAuthenticatedCopyWith<$Res> {
  factory $AuthenticationStateAuthenticatedCopyWith(
          AuthenticationStateAuthenticated value,
          $Res Function(AuthenticationStateAuthenticated) then) =
      _$AuthenticationStateAuthenticatedCopyWithImpl<$Res>;
  $Res call({String userToken});
}

/// @nodoc
class _$AuthenticationStateAuthenticatedCopyWithImpl<$Res>
    extends _$AuthenticationStateCopyWithImpl<$Res>
    implements $AuthenticationStateAuthenticatedCopyWith<$Res> {
  _$AuthenticationStateAuthenticatedCopyWithImpl(
      AuthenticationStateAuthenticated _value,
      $Res Function(AuthenticationStateAuthenticated) _then)
      : super(_value, (v) => _then(v as AuthenticationStateAuthenticated));

  @override
  AuthenticationStateAuthenticated get _value =>
      super._value as AuthenticationStateAuthenticated;

  @override
  $Res call({
    Object? userToken = freezed,
  }) {
    return _then(AuthenticationStateAuthenticated(
      userToken == freezed
          ? _value.userToken
          : userToken // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AuthenticationStateAuthenticated
    implements AuthenticationStateAuthenticated {
  const _$AuthenticationStateAuthenticated(this.userToken);

  @override
  final String userToken;

  @override
  String toString() {
    return 'AuthenticationState.authenticated(userToken: $userToken)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AuthenticationStateAuthenticated &&
            const DeepCollectionEquality().equals(other.userToken, userToken));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(userToken));

  @JsonKey(ignore: true)
  @override
  $AuthenticationStateAuthenticatedCopyWith<AuthenticationStateAuthenticated>
      get copyWith => _$AuthenticationStateAuthenticatedCopyWithImpl<
          AuthenticationStateAuthenticated>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unauthenticated,
    required TResult Function(String userToken) authenticated,
  }) {
    return authenticated(userToken);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? unauthenticated,
    TResult Function(String userToken)? authenticated,
  }) {
    return authenticated?.call(userToken);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unauthenticated,
    TResult Function(String userToken)? authenticated,
    required TResult orElse(),
  }) {
    if (authenticated != null) {
      return authenticated(userToken);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthenticationStateUnauthenticated value)
        unauthenticated,
    required TResult Function(AuthenticationStateAuthenticated value)
        authenticated,
  }) {
    return authenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(AuthenticationStateUnauthenticated value)? unauthenticated,
    TResult Function(AuthenticationStateAuthenticated value)? authenticated,
  }) {
    return authenticated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthenticationStateUnauthenticated value)? unauthenticated,
    TResult Function(AuthenticationStateAuthenticated value)? authenticated,
    required TResult orElse(),
  }) {
    if (authenticated != null) {
      return authenticated(this);
    }
    return orElse();
  }
}

abstract class AuthenticationStateAuthenticated implements AuthenticationState {
  const factory AuthenticationStateAuthenticated(String userToken) =
      _$AuthenticationStateAuthenticated;

  String get userToken;
  @JsonKey(ignore: true)
  $AuthenticationStateAuthenticatedCopyWith<AuthenticationStateAuthenticated>
      get copyWith => throw _privateConstructorUsedError;
}
