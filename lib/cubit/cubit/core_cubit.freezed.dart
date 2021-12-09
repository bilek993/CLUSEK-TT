// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'core_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$CoreStateTearOff {
  const _$CoreStateTearOff();

  _Initial initial({bool testField = true}) {
    return _Initial(
      testField: testField,
    );
  }
}

/// @nodoc
const $CoreState = _$CoreStateTearOff();

/// @nodoc
mixin _$CoreState {
  bool get testField => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool testField) initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool testField)? initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool testField)? initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CoreStateCopyWith<CoreState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CoreStateCopyWith<$Res> {
  factory $CoreStateCopyWith(CoreState value, $Res Function(CoreState) then) =
      _$CoreStateCopyWithImpl<$Res>;
  $Res call({bool testField});
}

/// @nodoc
class _$CoreStateCopyWithImpl<$Res> implements $CoreStateCopyWith<$Res> {
  _$CoreStateCopyWithImpl(this._value, this._then);

  final CoreState _value;
  // ignore: unused_field
  final $Res Function(CoreState) _then;

  @override
  $Res call({
    Object? testField = freezed,
  }) {
    return _then(_value.copyWith(
      testField: testField == freezed
          ? _value.testField
          : testField // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$InitialCopyWith<$Res> implements $CoreStateCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) then) =
      __$InitialCopyWithImpl<$Res>;
  @override
  $Res call({bool testField});
}

/// @nodoc
class __$InitialCopyWithImpl<$Res> extends _$CoreStateCopyWithImpl<$Res>
    implements _$InitialCopyWith<$Res> {
  __$InitialCopyWithImpl(_Initial _value, $Res Function(_Initial) _then)
      : super(_value, (v) => _then(v as _Initial));

  @override
  _Initial get _value => super._value as _Initial;

  @override
  $Res call({
    Object? testField = freezed,
  }) {
    return _then(_Initial(
      testField: testField == freezed
          ? _value.testField
          : testField // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial({this.testField = true});

  @JsonKey(defaultValue: true)
  @override
  final bool testField;

  @override
  String toString() {
    return 'CoreState.initial(testField: $testField)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Initial &&
            const DeepCollectionEquality().equals(other.testField, testField));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(testField));

  @JsonKey(ignore: true)
  @override
  _$InitialCopyWith<_Initial> get copyWith =>
      __$InitialCopyWithImpl<_Initial>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool testField) initial,
  }) {
    return initial(testField);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool testField)? initial,
  }) {
    return initial?.call(testField);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool testField)? initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(testField);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements CoreState {
  const factory _Initial({bool testField}) = _$_Initial;

  @override
  bool get testField;
  @override
  @JsonKey(ignore: true)
  _$InitialCopyWith<_Initial> get copyWith =>
      throw _privateConstructorUsedError;
}
