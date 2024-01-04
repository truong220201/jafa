// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tree_create_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TreeCreateState {
  String? get avatar => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get history => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  String? get relationship => throw _privateConstructorUsedError;
  List<Province>? get provinces => throw _privateConstructorUsedError;
  bool get pass => throw _privateConstructorUsedError;
  Object? get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TreeCreateStateCopyWith<TreeCreateState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TreeCreateStateCopyWith<$Res> {
  factory $TreeCreateStateCopyWith(
          TreeCreateState value, $Res Function(TreeCreateState) then) =
      _$TreeCreateStateCopyWithImpl<$Res, TreeCreateState>;
  @useResult
  $Res call(
      {String? avatar,
      String name,
      String? history,
      String? address,
      String? relationship,
      List<Province>? provinces,
      bool pass,
      Object? error});
}

/// @nodoc
class _$TreeCreateStateCopyWithImpl<$Res, $Val extends TreeCreateState>
    implements $TreeCreateStateCopyWith<$Res> {
  _$TreeCreateStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? avatar = freezed,
    Object? name = null,
    Object? history = freezed,
    Object? address = freezed,
    Object? relationship = freezed,
    Object? provinces = freezed,
    Object? pass = null,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      history: freezed == history
          ? _value.history
          : history // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      relationship: freezed == relationship
          ? _value.relationship
          : relationship // ignore: cast_nullable_to_non_nullable
              as String?,
      provinces: freezed == provinces
          ? _value.provinces
          : provinces // ignore: cast_nullable_to_non_nullable
              as List<Province>?,
      pass: null == pass
          ? _value.pass
          : pass // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error ? _value.error : error,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TreeCreateStateImplCopyWith<$Res>
    implements $TreeCreateStateCopyWith<$Res> {
  factory _$$TreeCreateStateImplCopyWith(_$TreeCreateStateImpl value,
          $Res Function(_$TreeCreateStateImpl) then) =
      __$$TreeCreateStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? avatar,
      String name,
      String? history,
      String? address,
      String? relationship,
      List<Province>? provinces,
      bool pass,
      Object? error});
}

/// @nodoc
class __$$TreeCreateStateImplCopyWithImpl<$Res>
    extends _$TreeCreateStateCopyWithImpl<$Res, _$TreeCreateStateImpl>
    implements _$$TreeCreateStateImplCopyWith<$Res> {
  __$$TreeCreateStateImplCopyWithImpl(
      _$TreeCreateStateImpl _value, $Res Function(_$TreeCreateStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? avatar = freezed,
    Object? name = null,
    Object? history = freezed,
    Object? address = freezed,
    Object? relationship = freezed,
    Object? provinces = freezed,
    Object? pass = null,
    Object? error = freezed,
  }) {
    return _then(_$TreeCreateStateImpl(
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      history: freezed == history
          ? _value.history
          : history // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      relationship: freezed == relationship
          ? _value.relationship
          : relationship // ignore: cast_nullable_to_non_nullable
              as String?,
      provinces: freezed == provinces
          ? _value._provinces
          : provinces // ignore: cast_nullable_to_non_nullable
              as List<Province>?,
      pass: null == pass
          ? _value.pass
          : pass // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error ? _value.error : error,
    ));
  }
}

/// @nodoc

class _$TreeCreateStateImpl extends _TreeCreateState {
  const _$TreeCreateStateImpl(
      {this.avatar,
      this.name = '',
      this.history,
      this.address,
      this.relationship,
      final List<Province>? provinces,
      this.pass = false,
      this.error})
      : _provinces = provinces,
        super._();

  @override
  final String? avatar;
  @override
  @JsonKey()
  final String name;
  @override
  final String? history;
  @override
  final String? address;
  @override
  final String? relationship;
  final List<Province>? _provinces;
  @override
  List<Province>? get provinces {
    final value = _provinces;
    if (value == null) return null;
    if (_provinces is EqualUnmodifiableListView) return _provinces;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey()
  final bool pass;
  @override
  final Object? error;

  @override
  String toString() {
    return 'TreeCreateState(avatar: $avatar, name: $name, history: $history, address: $address, relationship: $relationship, provinces: $provinces, pass: $pass, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TreeCreateStateImpl &&
            (identical(other.avatar, avatar) || other.avatar == avatar) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.history, history) || other.history == history) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.relationship, relationship) ||
                other.relationship == relationship) &&
            const DeepCollectionEquality()
                .equals(other._provinces, _provinces) &&
            (identical(other.pass, pass) || other.pass == pass) &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      avatar,
      name,
      history,
      address,
      relationship,
      const DeepCollectionEquality().hash(_provinces),
      pass,
      const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TreeCreateStateImplCopyWith<_$TreeCreateStateImpl> get copyWith =>
      __$$TreeCreateStateImplCopyWithImpl<_$TreeCreateStateImpl>(
          this, _$identity);
}

abstract class _TreeCreateState extends TreeCreateState {
  const factory _TreeCreateState(
      {final String? avatar,
      final String name,
      final String? history,
      final String? address,
      final String? relationship,
      final List<Province>? provinces,
      final bool pass,
      final Object? error}) = _$TreeCreateStateImpl;
  const _TreeCreateState._() : super._();

  @override
  String? get avatar;
  @override
  String get name;
  @override
  String? get history;
  @override
  String? get address;
  @override
  String? get relationship;
  @override
  List<Province>? get provinces;
  @override
  bool get pass;
  @override
  Object? get error;
  @override
  @JsonKey(ignore: true)
  _$$TreeCreateStateImplCopyWith<_$TreeCreateStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
