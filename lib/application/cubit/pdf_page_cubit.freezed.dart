// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'pdf_page_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PdfPageState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(Failure failure) error,
    required TResult Function(Uri url) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(Failure failure)? error,
    TResult Function(Uri url)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(Failure failure)? error,
    TResult Function(Uri url)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PdfPageLoading value) loading,
    required TResult Function(PdfPageError value) error,
    required TResult Function(PdfPageLoaded value) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(PdfPageLoading value)? loading,
    TResult Function(PdfPageError value)? error,
    TResult Function(PdfPageLoaded value)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PdfPageLoading value)? loading,
    TResult Function(PdfPageError value)? error,
    TResult Function(PdfPageLoaded value)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PdfPageStateCopyWith<$Res> {
  factory $PdfPageStateCopyWith(
          PdfPageState value, $Res Function(PdfPageState) then) =
      _$PdfPageStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$PdfPageStateCopyWithImpl<$Res> implements $PdfPageStateCopyWith<$Res> {
  _$PdfPageStateCopyWithImpl(this._value, this._then);

  final PdfPageState _value;
  // ignore: unused_field
  final $Res Function(PdfPageState) _then;
}

/// @nodoc
abstract class $PdfPageLoadingCopyWith<$Res> {
  factory $PdfPageLoadingCopyWith(
          PdfPageLoading value, $Res Function(PdfPageLoading) then) =
      _$PdfPageLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class _$PdfPageLoadingCopyWithImpl<$Res>
    extends _$PdfPageStateCopyWithImpl<$Res>
    implements $PdfPageLoadingCopyWith<$Res> {
  _$PdfPageLoadingCopyWithImpl(
      PdfPageLoading _value, $Res Function(PdfPageLoading) _then)
      : super(_value, (v) => _then(v as PdfPageLoading));

  @override
  PdfPageLoading get _value => super._value as PdfPageLoading;
}

/// @nodoc

class _$PdfPageLoading implements PdfPageLoading {
  const _$PdfPageLoading();

  @override
  String toString() {
    return 'PdfPageState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is PdfPageLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(Failure failure) error,
    required TResult Function(Uri url) loaded,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(Failure failure)? error,
    TResult Function(Uri url)? loaded,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(Failure failure)? error,
    TResult Function(Uri url)? loaded,
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
    required TResult Function(PdfPageLoading value) loading,
    required TResult Function(PdfPageError value) error,
    required TResult Function(PdfPageLoaded value) loaded,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(PdfPageLoading value)? loading,
    TResult Function(PdfPageError value)? error,
    TResult Function(PdfPageLoaded value)? loaded,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PdfPageLoading value)? loading,
    TResult Function(PdfPageError value)? error,
    TResult Function(PdfPageLoaded value)? loaded,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class PdfPageLoading implements PdfPageState {
  const factory PdfPageLoading() = _$PdfPageLoading;
}

/// @nodoc
abstract class $PdfPageErrorCopyWith<$Res> {
  factory $PdfPageErrorCopyWith(
          PdfPageError value, $Res Function(PdfPageError) then) =
      _$PdfPageErrorCopyWithImpl<$Res>;
  $Res call({Failure failure});
}

/// @nodoc
class _$PdfPageErrorCopyWithImpl<$Res> extends _$PdfPageStateCopyWithImpl<$Res>
    implements $PdfPageErrorCopyWith<$Res> {
  _$PdfPageErrorCopyWithImpl(
      PdfPageError _value, $Res Function(PdfPageError) _then)
      : super(_value, (v) => _then(v as PdfPageError));

  @override
  PdfPageError get _value => super._value as PdfPageError;

  @override
  $Res call({
    Object? failure = freezed,
  }) {
    return _then(PdfPageError(
      failure == freezed
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure,
    ));
  }
}

/// @nodoc

class _$PdfPageError implements PdfPageError {
  const _$PdfPageError(this.failure);

  @override
  final Failure failure;

  @override
  String toString() {
    return 'PdfPageState.error(failure: $failure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PdfPageError &&
            const DeepCollectionEquality().equals(other.failure, failure));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(failure));

  @JsonKey(ignore: true)
  @override
  $PdfPageErrorCopyWith<PdfPageError> get copyWith =>
      _$PdfPageErrorCopyWithImpl<PdfPageError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(Failure failure) error,
    required TResult Function(Uri url) loaded,
  }) {
    return error(failure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(Failure failure)? error,
    TResult Function(Uri url)? loaded,
  }) {
    return error?.call(failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(Failure failure)? error,
    TResult Function(Uri url)? loaded,
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
    required TResult Function(PdfPageLoading value) loading,
    required TResult Function(PdfPageError value) error,
    required TResult Function(PdfPageLoaded value) loaded,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(PdfPageLoading value)? loading,
    TResult Function(PdfPageError value)? error,
    TResult Function(PdfPageLoaded value)? loaded,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PdfPageLoading value)? loading,
    TResult Function(PdfPageError value)? error,
    TResult Function(PdfPageLoaded value)? loaded,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class PdfPageError implements PdfPageState {
  const factory PdfPageError(final Failure failure) = _$PdfPageError;

  Failure get failure => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PdfPageErrorCopyWith<PdfPageError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PdfPageLoadedCopyWith<$Res> {
  factory $PdfPageLoadedCopyWith(
          PdfPageLoaded value, $Res Function(PdfPageLoaded) then) =
      _$PdfPageLoadedCopyWithImpl<$Res>;
  $Res call({Uri url});
}

/// @nodoc
class _$PdfPageLoadedCopyWithImpl<$Res> extends _$PdfPageStateCopyWithImpl<$Res>
    implements $PdfPageLoadedCopyWith<$Res> {
  _$PdfPageLoadedCopyWithImpl(
      PdfPageLoaded _value, $Res Function(PdfPageLoaded) _then)
      : super(_value, (v) => _then(v as PdfPageLoaded));

  @override
  PdfPageLoaded get _value => super._value as PdfPageLoaded;

  @override
  $Res call({
    Object? url = freezed,
  }) {
    return _then(PdfPageLoaded(
      url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as Uri,
    ));
  }
}

/// @nodoc

class _$PdfPageLoaded implements PdfPageLoaded {
  const _$PdfPageLoaded(this.url);

  @override
  final Uri url;

  @override
  String toString() {
    return 'PdfPageState.loaded(url: $url)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PdfPageLoaded &&
            const DeepCollectionEquality().equals(other.url, url));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(url));

  @JsonKey(ignore: true)
  @override
  $PdfPageLoadedCopyWith<PdfPageLoaded> get copyWith =>
      _$PdfPageLoadedCopyWithImpl<PdfPageLoaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(Failure failure) error,
    required TResult Function(Uri url) loaded,
  }) {
    return loaded(url);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(Failure failure)? error,
    TResult Function(Uri url)? loaded,
  }) {
    return loaded?.call(url);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(Failure failure)? error,
    TResult Function(Uri url)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(url);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PdfPageLoading value) loading,
    required TResult Function(PdfPageError value) error,
    required TResult Function(PdfPageLoaded value) loaded,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(PdfPageLoading value)? loading,
    TResult Function(PdfPageError value)? error,
    TResult Function(PdfPageLoaded value)? loaded,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PdfPageLoading value)? loading,
    TResult Function(PdfPageError value)? error,
    TResult Function(PdfPageLoaded value)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class PdfPageLoaded implements PdfPageState {
  const factory PdfPageLoaded(final Uri url) = _$PdfPageLoaded;

  Uri get url => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PdfPageLoadedCopyWith<PdfPageLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}
