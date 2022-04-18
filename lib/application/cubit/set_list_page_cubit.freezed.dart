// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'set_list_page_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$SetListPageStateTearOff {
  const _$SetListPageStateTearOff();

  SetListPageLoading loading() {
    return const SetListPageLoading();
  }

  SetListPageError error(Failure failure) {
    return SetListPageError(
      failure,
    );
  }

  SetListPageLoaded loaded(List<BrickSet> sets) {
    return SetListPageLoaded(
      sets,
    );
  }
}

/// @nodoc
const $SetListPageState = _$SetListPageStateTearOff();

/// @nodoc
mixin _$SetListPageState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(Failure failure) error,
    required TResult Function(List<BrickSet> sets) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(Failure failure)? error,
    TResult Function(List<BrickSet> sets)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(Failure failure)? error,
    TResult Function(List<BrickSet> sets)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SetListPageLoading value) loading,
    required TResult Function(SetListPageError value) error,
    required TResult Function(SetListPageLoaded value) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(SetListPageLoading value)? loading,
    TResult Function(SetListPageError value)? error,
    TResult Function(SetListPageLoaded value)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SetListPageLoading value)? loading,
    TResult Function(SetListPageError value)? error,
    TResult Function(SetListPageLoaded value)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SetListPageStateCopyWith<$Res> {
  factory $SetListPageStateCopyWith(
          SetListPageState value, $Res Function(SetListPageState) then) =
      _$SetListPageStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$SetListPageStateCopyWithImpl<$Res>
    implements $SetListPageStateCopyWith<$Res> {
  _$SetListPageStateCopyWithImpl(this._value, this._then);

  final SetListPageState _value;
  // ignore: unused_field
  final $Res Function(SetListPageState) _then;
}

/// @nodoc
abstract class $SetListPageLoadingCopyWith<$Res> {
  factory $SetListPageLoadingCopyWith(
          SetListPageLoading value, $Res Function(SetListPageLoading) then) =
      _$SetListPageLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class _$SetListPageLoadingCopyWithImpl<$Res>
    extends _$SetListPageStateCopyWithImpl<$Res>
    implements $SetListPageLoadingCopyWith<$Res> {
  _$SetListPageLoadingCopyWithImpl(
      SetListPageLoading _value, $Res Function(SetListPageLoading) _then)
      : super(_value, (v) => _then(v as SetListPageLoading));

  @override
  SetListPageLoading get _value => super._value as SetListPageLoading;
}

/// @nodoc

class _$SetListPageLoading implements SetListPageLoading {
  const _$SetListPageLoading();

  @override
  String toString() {
    return 'SetListPageState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is SetListPageLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(Failure failure) error,
    required TResult Function(List<BrickSet> sets) loaded,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(Failure failure)? error,
    TResult Function(List<BrickSet> sets)? loaded,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(Failure failure)? error,
    TResult Function(List<BrickSet> sets)? loaded,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SetListPageLoading value) loading,
    required TResult Function(SetListPageError value) error,
    required TResult Function(SetListPageLoaded value) loaded,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(SetListPageLoading value)? loading,
    TResult Function(SetListPageError value)? error,
    TResult Function(SetListPageLoaded value)? loaded,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SetListPageLoading value)? loading,
    TResult Function(SetListPageError value)? error,
    TResult Function(SetListPageLoaded value)? loaded,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class SetListPageLoading implements SetListPageState {
  const factory SetListPageLoading() = _$SetListPageLoading;
}

/// @nodoc
abstract class $SetListPageErrorCopyWith<$Res> {
  factory $SetListPageErrorCopyWith(
          SetListPageError value, $Res Function(SetListPageError) then) =
      _$SetListPageErrorCopyWithImpl<$Res>;
  $Res call({Failure failure});
}

/// @nodoc
class _$SetListPageErrorCopyWithImpl<$Res>
    extends _$SetListPageStateCopyWithImpl<$Res>
    implements $SetListPageErrorCopyWith<$Res> {
  _$SetListPageErrorCopyWithImpl(
      SetListPageError _value, $Res Function(SetListPageError) _then)
      : super(_value, (v) => _then(v as SetListPageError));

  @override
  SetListPageError get _value => super._value as SetListPageError;

  @override
  $Res call({
    Object? failure = freezed,
  }) {
    return _then(SetListPageError(
      failure == freezed
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure,
    ));
  }
}

/// @nodoc

class _$SetListPageError implements SetListPageError {
  const _$SetListPageError(this.failure);

  @override
  final Failure failure;

  @override
  String toString() {
    return 'SetListPageState.error(failure: $failure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SetListPageError &&
            const DeepCollectionEquality().equals(other.failure, failure));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(failure));

  @JsonKey(ignore: true)
  @override
  $SetListPageErrorCopyWith<SetListPageError> get copyWith =>
      _$SetListPageErrorCopyWithImpl<SetListPageError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(Failure failure) error,
    required TResult Function(List<BrickSet> sets) loaded,
  }) {
    return error(failure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(Failure failure)? error,
    TResult Function(List<BrickSet> sets)? loaded,
  }) {
    return error?.call(failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(Failure failure)? error,
    TResult Function(List<BrickSet> sets)? loaded,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(failure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SetListPageLoading value) loading,
    required TResult Function(SetListPageError value) error,
    required TResult Function(SetListPageLoaded value) loaded,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(SetListPageLoading value)? loading,
    TResult Function(SetListPageError value)? error,
    TResult Function(SetListPageLoaded value)? loaded,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SetListPageLoading value)? loading,
    TResult Function(SetListPageError value)? error,
    TResult Function(SetListPageLoaded value)? loaded,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class SetListPageError implements SetListPageState {
  const factory SetListPageError(Failure failure) = _$SetListPageError;

  Failure get failure;
  @JsonKey(ignore: true)
  $SetListPageErrorCopyWith<SetListPageError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SetListPageLoadedCopyWith<$Res> {
  factory $SetListPageLoadedCopyWith(
          SetListPageLoaded value, $Res Function(SetListPageLoaded) then) =
      _$SetListPageLoadedCopyWithImpl<$Res>;
  $Res call({List<BrickSet> sets});
}

/// @nodoc
class _$SetListPageLoadedCopyWithImpl<$Res>
    extends _$SetListPageStateCopyWithImpl<$Res>
    implements $SetListPageLoadedCopyWith<$Res> {
  _$SetListPageLoadedCopyWithImpl(
      SetListPageLoaded _value, $Res Function(SetListPageLoaded) _then)
      : super(_value, (v) => _then(v as SetListPageLoaded));

  @override
  SetListPageLoaded get _value => super._value as SetListPageLoaded;

  @override
  $Res call({
    Object? sets = freezed,
  }) {
    return _then(SetListPageLoaded(
      sets == freezed
          ? _value.sets
          : sets // ignore: cast_nullable_to_non_nullable
              as List<BrickSet>,
    ));
  }
}

/// @nodoc

class _$SetListPageLoaded implements SetListPageLoaded {
  const _$SetListPageLoaded(this.sets);

  @override
  final List<BrickSet> sets;

  @override
  String toString() {
    return 'SetListPageState.loaded(sets: $sets)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SetListPageLoaded &&
            const DeepCollectionEquality().equals(other.sets, sets));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(sets));

  @JsonKey(ignore: true)
  @override
  $SetListPageLoadedCopyWith<SetListPageLoaded> get copyWith =>
      _$SetListPageLoadedCopyWithImpl<SetListPageLoaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(Failure failure) error,
    required TResult Function(List<BrickSet> sets) loaded,
  }) {
    return loaded(sets);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(Failure failure)? error,
    TResult Function(List<BrickSet> sets)? loaded,
  }) {
    return loaded?.call(sets);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(Failure failure)? error,
    TResult Function(List<BrickSet> sets)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(sets);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SetListPageLoading value) loading,
    required TResult Function(SetListPageError value) error,
    required TResult Function(SetListPageLoaded value) loaded,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(SetListPageLoading value)? loading,
    TResult Function(SetListPageError value)? error,
    TResult Function(SetListPageLoaded value)? loaded,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SetListPageLoading value)? loading,
    TResult Function(SetListPageError value)? error,
    TResult Function(SetListPageLoaded value)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class SetListPageLoaded implements SetListPageState {
  const factory SetListPageLoaded(List<BrickSet> sets) = _$SetListPageLoaded;

  List<BrickSet> get sets;
  @JsonKey(ignore: true)
  $SetListPageLoadedCopyWith<SetListPageLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}
