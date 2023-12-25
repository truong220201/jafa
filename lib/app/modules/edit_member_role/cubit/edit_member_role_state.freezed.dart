// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edit_member_role_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$EditMemberRoleState {
  int get roleId => throw _privateConstructorUsedError;
  bool get saveDone => throw _privateConstructorUsedError;
  Object? get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EditMemberRoleStateCopyWith<EditMemberRoleState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditMemberRoleStateCopyWith<$Res> {
  factory $EditMemberRoleStateCopyWith(
          EditMemberRoleState value, $Res Function(EditMemberRoleState) then) =
      _$EditMemberRoleStateCopyWithImpl<$Res, EditMemberRoleState>;
  @useResult
  $Res call({int roleId, bool saveDone, Object? error});
}

/// @nodoc
class _$EditMemberRoleStateCopyWithImpl<$Res, $Val extends EditMemberRoleState>
    implements $EditMemberRoleStateCopyWith<$Res> {
  _$EditMemberRoleStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? roleId = null,
    Object? saveDone = null,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      roleId: null == roleId
          ? _value.roleId
          : roleId // ignore: cast_nullable_to_non_nullable
              as int,
      saveDone: null == saveDone
          ? _value.saveDone
          : saveDone // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error ? _value.error : error,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_EditMemberRoleStateCopyWith<$Res>
    implements $EditMemberRoleStateCopyWith<$Res> {
  factory _$$_EditMemberRoleStateCopyWith(_$_EditMemberRoleState value,
          $Res Function(_$_EditMemberRoleState) then) =
      __$$_EditMemberRoleStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int roleId, bool saveDone, Object? error});
}

/// @nodoc
class __$$_EditMemberRoleStateCopyWithImpl<$Res>
    extends _$EditMemberRoleStateCopyWithImpl<$Res, _$_EditMemberRoleState>
    implements _$$_EditMemberRoleStateCopyWith<$Res> {
  __$$_EditMemberRoleStateCopyWithImpl(_$_EditMemberRoleState _value,
      $Res Function(_$_EditMemberRoleState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? roleId = null,
    Object? saveDone = null,
    Object? error = freezed,
  }) {
    return _then(_$_EditMemberRoleState(
      roleId: null == roleId
          ? _value.roleId
          : roleId // ignore: cast_nullable_to_non_nullable
              as int,
      saveDone: null == saveDone
          ? _value.saveDone
          : saveDone // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error ? _value.error : error,
    ));
  }
}

/// @nodoc

class _$_EditMemberRoleState extends _EditMemberRoleState {
  const _$_EditMemberRoleState(
      {this.roleId = 1, this.saveDone = false, this.error})
      : super._();

  @override
  @JsonKey()
  final int roleId;
  @override
  @JsonKey()
  final bool saveDone;
  @override
  final Object? error;

  @override
  String toString() {
    return 'EditMemberRoleState(roleId: $roleId, saveDone: $saveDone, error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EditMemberRoleState &&
            (identical(other.roleId, roleId) || other.roleId == roleId) &&
            (identical(other.saveDone, saveDone) ||
                other.saveDone == saveDone) &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, roleId, saveDone,
      const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EditMemberRoleStateCopyWith<_$_EditMemberRoleState> get copyWith =>
      __$$_EditMemberRoleStateCopyWithImpl<_$_EditMemberRoleState>(
          this, _$identity);
}

abstract class _EditMemberRoleState extends EditMemberRoleState {
  const factory _EditMemberRoleState(
      {final int roleId,
      final bool saveDone,
      final Object? error}) = _$_EditMemberRoleState;
  const _EditMemberRoleState._() : super._();

  @override
  int get roleId;
  @override
  bool get saveDone;
  @override
  Object? get error;
  @override
  @JsonKey(ignore: true)
  _$$_EditMemberRoleStateCopyWith<_$_EditMemberRoleState> get copyWith =>
      throw _privateConstructorUsedError;
}
