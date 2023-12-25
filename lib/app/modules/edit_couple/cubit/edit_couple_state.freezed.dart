// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edit_couple_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$EditCoupleState {
  List<User>? get couples => throw _privateConstructorUsedError;
  bool get saveDone => throw _privateConstructorUsedError;
  Object? get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EditCoupleStateCopyWith<EditCoupleState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditCoupleStateCopyWith<$Res> {
  factory $EditCoupleStateCopyWith(
          EditCoupleState value, $Res Function(EditCoupleState) then) =
      _$EditCoupleStateCopyWithImpl<$Res, EditCoupleState>;
  @useResult
  $Res call({List<User>? couples, bool saveDone, Object? error});
}

/// @nodoc
class _$EditCoupleStateCopyWithImpl<$Res, $Val extends EditCoupleState>
    implements $EditCoupleStateCopyWith<$Res> {
  _$EditCoupleStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? couples = freezed,
    Object? saveDone = null,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      couples: freezed == couples
          ? _value.couples
          : couples // ignore: cast_nullable_to_non_nullable
              as List<User>?,
      saveDone: null == saveDone
          ? _value.saveDone
          : saveDone // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error ? _value.error : error,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_EditCoupleStateCopyWith<$Res>
    implements $EditCoupleStateCopyWith<$Res> {
  factory _$$_EditCoupleStateCopyWith(
          _$_EditCoupleState value, $Res Function(_$_EditCoupleState) then) =
      __$$_EditCoupleStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<User>? couples, bool saveDone, Object? error});
}

/// @nodoc
class __$$_EditCoupleStateCopyWithImpl<$Res>
    extends _$EditCoupleStateCopyWithImpl<$Res, _$_EditCoupleState>
    implements _$$_EditCoupleStateCopyWith<$Res> {
  __$$_EditCoupleStateCopyWithImpl(
      _$_EditCoupleState _value, $Res Function(_$_EditCoupleState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? couples = freezed,
    Object? saveDone = null,
    Object? error = freezed,
  }) {
    return _then(_$_EditCoupleState(
      couples: freezed == couples
          ? _value._couples
          : couples // ignore: cast_nullable_to_non_nullable
              as List<User>?,
      saveDone: null == saveDone
          ? _value.saveDone
          : saveDone // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error ? _value.error : error,
    ));
  }
}

/// @nodoc

class _$_EditCoupleState extends _EditCoupleState {
  const _$_EditCoupleState(
      {final List<User>? couples, this.saveDone = false, this.error})
      : _couples = couples,
        super._();

  final List<User>? _couples;
  @override
  List<User>? get couples {
    final value = _couples;
    if (value == null) return null;
    if (_couples is EqualUnmodifiableListView) return _couples;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey()
  final bool saveDone;
  @override
  final Object? error;

  @override
  String toString() {
    return 'EditCoupleState(couples: $couples, saveDone: $saveDone, error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EditCoupleState &&
            const DeepCollectionEquality().equals(other._couples, _couples) &&
            (identical(other.saveDone, saveDone) ||
                other.saveDone == saveDone) &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_couples),
      saveDone,
      const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EditCoupleStateCopyWith<_$_EditCoupleState> get copyWith =>
      __$$_EditCoupleStateCopyWithImpl<_$_EditCoupleState>(this, _$identity);
}

abstract class _EditCoupleState extends EditCoupleState {
  const factory _EditCoupleState(
      {final List<User>? couples,
      final bool saveDone,
      final Object? error}) = _$_EditCoupleState;
  const _EditCoupleState._() : super._();

  @override
  List<User>? get couples;
  @override
  bool get saveDone;
  @override
  Object? get error;
  @override
  @JsonKey(ignore: true)
  _$$_EditCoupleStateCopyWith<_$_EditCoupleState> get copyWith =>
      throw _privateConstructorUsedError;
}
