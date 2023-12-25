// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_info_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UserInfoState {
  User? get user => throw _privateConstructorUsedError;
  bool get initDone => throw _privateConstructorUsedError;
  bool get pass => throw _privateConstructorUsedError;
  Object? get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserInfoStateCopyWith<UserInfoState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserInfoStateCopyWith<$Res> {
  factory $UserInfoStateCopyWith(
          UserInfoState value, $Res Function(UserInfoState) then) =
      _$UserInfoStateCopyWithImpl<$Res, UserInfoState>;
  @useResult
  $Res call({User? user, bool initDone, bool pass, Object? error});
}

/// @nodoc
class _$UserInfoStateCopyWithImpl<$Res, $Val extends UserInfoState>
    implements $UserInfoStateCopyWith<$Res> {
  _$UserInfoStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = freezed,
    Object? initDone = null,
    Object? pass = null,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      initDone: null == initDone
          ? _value.initDone
          : initDone // ignore: cast_nullable_to_non_nullable
              as bool,
      pass: null == pass
          ? _value.pass
          : pass // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error ? _value.error : error,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserInfoStateCopyWith<$Res>
    implements $UserInfoStateCopyWith<$Res> {
  factory _$$_UserInfoStateCopyWith(
          _$_UserInfoState value, $Res Function(_$_UserInfoState) then) =
      __$$_UserInfoStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({User? user, bool initDone, bool pass, Object? error});
}

/// @nodoc
class __$$_UserInfoStateCopyWithImpl<$Res>
    extends _$UserInfoStateCopyWithImpl<$Res, _$_UserInfoState>
    implements _$$_UserInfoStateCopyWith<$Res> {
  __$$_UserInfoStateCopyWithImpl(
      _$_UserInfoState _value, $Res Function(_$_UserInfoState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = freezed,
    Object? initDone = null,
    Object? pass = null,
    Object? error = freezed,
  }) {
    return _then(_$_UserInfoState(
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      initDone: null == initDone
          ? _value.initDone
          : initDone // ignore: cast_nullable_to_non_nullable
              as bool,
      pass: null == pass
          ? _value.pass
          : pass // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error ? _value.error : error,
    ));
  }
}

/// @nodoc

class _$_UserInfoState extends _UserInfoState {
  const _$_UserInfoState(
      {this.user, this.initDone = false, this.pass = false, this.error})
      : super._();

  @override
  final User? user;
  @override
  @JsonKey()
  final bool initDone;
  @override
  @JsonKey()
  final bool pass;
  @override
  final Object? error;

  @override
  String toString() {
    return 'UserInfoState(user: $user, initDone: $initDone, pass: $pass, error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserInfoState &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.initDone, initDone) ||
                other.initDone == initDone) &&
            (identical(other.pass, pass) || other.pass == pass) &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user, initDone, pass,
      const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserInfoStateCopyWith<_$_UserInfoState> get copyWith =>
      __$$_UserInfoStateCopyWithImpl<_$_UserInfoState>(this, _$identity);
}

abstract class _UserInfoState extends UserInfoState {
  const factory _UserInfoState(
      {final User? user,
      final bool initDone,
      final bool pass,
      final Object? error}) = _$_UserInfoState;
  const _UserInfoState._() : super._();

  @override
  User? get user;
  @override
  bool get initDone;
  @override
  bool get pass;
  @override
  Object? get error;
  @override
  @JsonKey(ignore: true)
  _$$_UserInfoStateCopyWith<_$_UserInfoState> get copyWith =>
      throw _privateConstructorUsedError;
}
