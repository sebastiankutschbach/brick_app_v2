// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'home_page_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$HomePageState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(Failure failure) error,
    required TResult Function(List<SetList> setLists) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(Failure failure)? error,
    TResult Function(List<SetList> setLists)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(Failure failure)? error,
    TResult Function(List<SetList> setLists)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HomePageLoading value) loading,
    required TResult Function(HomePageError value) error,
    required TResult Function(HomePageLoaded value) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(HomePageLoading value)? loading,
    TResult Function(HomePageError value)? error,
    TResult Function(HomePageLoaded value)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HomePageLoading value)? loading,
    TResult Function(HomePageError value)? error,
    TResult Function(HomePageLoaded value)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomePageStateCopyWith<$Res> {
  factory $HomePageStateCopyWith(
          HomePageState value, $Res Function(HomePageState) then) =
      _$HomePageStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$HomePageStateCopyWithImpl<$Res>
    implements $HomePageStateCopyWith<$Res> {
  _$HomePageStateCopyWithImpl(this._value, this._then);

  final HomePageState _value;
  // ignore: unused_field
  final $Res Function(HomePageState) _then;
}

/// @nodoc
abstract class $HomePageLoadingCopyWith<$Res> {
  factory $HomePageLoadingCopyWith(
          HomePageLoading value, $Res Function(HomePageLoading) then) =
      _$HomePageLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class _$HomePageLoadingCopyWithImpl<$Res>
    extends _$HomePageStateCopyWithImpl<$Res>
    implements $HomePageLoadingCopyWith<$Res> {
  _$HomePageLoadingCopyWithImpl(
      HomePageLoading _value, $Res Function(HomePageLoading) _then)
      : super(_value, (v) => _then(v as HomePageLoading));

  @override
  HomePageLoading get _value => super._value as HomePageLoading;
}

/// @nodoc

class _$HomePageLoading implements HomePageLoading {
  const _$HomePageLoading();

  @override
  String toString() {
    return 'HomePageState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is HomePageLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(Failure failure) error,
    required TResult Function(List<SetList> setLists) loaded,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(Failure failure)? error,
    TResult Function(List<SetList> setLists)? loaded,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(Failure failure)? error,
    TResult Function(List<SetList> setLists)? loaded,
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
    required TResult Function(HomePageLoading value) loading,
    required TResult Function(HomePageError value) error,
    required TResult Function(HomePageLoaded value) loaded,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(HomePageLoading value)? loading,
    TResult Function(HomePageError value)? error,
    TResult Function(HomePageLoaded value)? loaded,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HomePageLoading value)? loading,
    TResult Function(HomePageError value)? error,
    TResult Function(HomePageLoaded value)? loaded,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class HomePageLoading implements HomePageState {
  const factory HomePageLoading() = _$HomePageLoading;
}

/// @nodoc
abstract class $HomePageErrorCopyWith<$Res> {
  factory $HomePageErrorCopyWith(
          HomePageError value, $Res Function(HomePageError) then) =
      _$HomePageErrorCopyWithImpl<$Res>;
  $Res call({Failure failure});
}

/// @nodoc
class _$HomePageErrorCopyWithImpl<$Res>
    extends _$HomePageStateCopyWithImpl<$Res>
    implements $HomePageErrorCopyWith<$Res> {
  _$HomePageErrorCopyWithImpl(
      HomePageError _value, $Res Function(HomePageError) _then)
      : super(_value, (v) => _then(v as HomePageError));

  @override
  HomePageError get _value => super._value as HomePageError;

  @override
  $Res call({
    Object? failure = freezed,
  }) {
    return _then(HomePageError(
      failure == freezed
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure,
    ));
  }
}

/// @nodoc

class _$HomePageError implements HomePageError {
  const _$HomePageError(this.failure);

  @override
  final Failure failure;

  @override
  String toString() {
    return 'HomePageState.error(failure: $failure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is HomePageError &&
            const DeepCollectionEquality().equals(other.failure, failure));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(failure));

  @JsonKey(ignore: true)
  @override
  $HomePageErrorCopyWith<HomePageError> get copyWith =>
      _$HomePageErrorCopyWithImpl<HomePageError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(Failure failure) error,
    required TResult Function(List<SetList> setLists) loaded,
  }) {
    return error(failure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(Failure failure)? error,
    TResult Function(List<SetList> setLists)? loaded,
  }) {
    return error?.call(failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(Failure failure)? error,
    TResult Function(List<SetList> setLists)? loaded,
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
    required TResult Function(HomePageLoading value) loading,
    required TResult Function(HomePageError value) error,
    required TResult Function(HomePageLoaded value) loaded,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(HomePageLoading value)? loading,
    TResult Function(HomePageError value)? error,
    TResult Function(HomePageLoaded value)? loaded,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HomePageLoading value)? loading,
    TResult Function(HomePageError value)? error,
    TResult Function(HomePageLoaded value)? loaded,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class HomePageError implements HomePageState {
  const factory HomePageError(final Failure failure) = _$HomePageError;

  Failure get failure => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HomePageErrorCopyWith<HomePageError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomePageLoadedCopyWith<$Res> {
  factory $HomePageLoadedCopyWith(
          HomePageLoaded value, $Res Function(HomePageLoaded) then) =
      _$HomePageLoadedCopyWithImpl<$Res>;
  $Res call({List<SetList> setLists});
}

/// @nodoc
class _$HomePageLoadedCopyWithImpl<$Res>
    extends _$HomePageStateCopyWithImpl<$Res>
    implements $HomePageLoadedCopyWith<$Res> {
  _$HomePageLoadedCopyWithImpl(
      HomePageLoaded _value, $Res Function(HomePageLoaded) _then)
      : super(_value, (v) => _then(v as HomePageLoaded));

  @override
  HomePageLoaded get _value => super._value as HomePageLoaded;

  @override
  $Res call({
    Object? setLists = freezed,
  }) {
    return _then(HomePageLoaded(
      setLists == freezed
          ? _value.setLists
          : setLists // ignore: cast_nullable_to_non_nullable
              as List<SetList>,
    ));
  }
}

/// @nodoc

class _$HomePageLoaded implements HomePageLoaded {
  const _$HomePageLoaded(final List<SetList> setLists) : _setLists = setLists;

  final List<SetList> _setLists;
  @override
  List<SetList> get setLists {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_setLists);
  }

  @override
  String toString() {
    return 'HomePageState.loaded(setLists: $setLists)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is HomePageLoaded &&
            const DeepCollectionEquality().equals(other.setLists, setLists));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(setLists));

  @JsonKey(ignore: true)
  @override
  $HomePageLoadedCopyWith<HomePageLoaded> get copyWith =>
      _$HomePageLoadedCopyWithImpl<HomePageLoaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(Failure failure) error,
    required TResult Function(List<SetList> setLists) loaded,
  }) {
    return loaded(setLists);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(Failure failure)? error,
    TResult Function(List<SetList> setLists)? loaded,
  }) {
    return loaded?.call(setLists);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(Failure failure)? error,
    TResult Function(List<SetList> setLists)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(setLists);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HomePageLoading value) loading,
    required TResult Function(HomePageError value) error,
    required TResult Function(HomePageLoaded value) loaded,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(HomePageLoading value)? loading,
    TResult Function(HomePageError value)? error,
    TResult Function(HomePageLoaded value)? loaded,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HomePageLoading value)? loading,
    TResult Function(HomePageError value)? error,
    TResult Function(HomePageLoaded value)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class HomePageLoaded implements HomePageState {
  const factory HomePageLoaded(final List<SetList> setLists) = _$HomePageLoaded;

  List<SetList> get setLists => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HomePageLoadedCopyWith<HomePageLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}
