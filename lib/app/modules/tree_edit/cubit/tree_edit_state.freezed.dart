// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tree_edit_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TreeEditState {
  String get avatar => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get history => throw _privateConstructorUsedError;
  int? get province => throw _privateConstructorUsedError;
  int? get district => throw _privateConstructorUsedError;
  String get relationship => throw _privateConstructorUsedError;
  bool get pass => throw _privateConstructorUsedError;
  List<Province>? get provinces => throw _privateConstructorUsedError;
  Object? get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TreeEditStateCopyWith<TreeEditState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TreeEditStateCopyWith<$Res> {
  factory $TreeEditStateCopyWith(
          TreeEditState value, $Res Function(TreeEditState) then) =
      _$TreeEditStateCopyWithImpl<$Res, TreeEditState>;
  @useResult
  $Res call(
      {String avatar,
      String name,
      String history,
      int? province,
      int? district,
      String relationship,
      bool pass,
      List<Province>? provinces,
      Object? error});
}

/// @nodoc
class _$TreeEditStateCopyWithImpl<$Res, $Val extends TreeEditState>
    implements $TreeEditStateCopyWith<$Res> {
  _$TreeEditStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? avatar = null,
    Object? name = null,
    Object? history = null,
    Object? province = freezed,
    Object? district = freezed,
    Object? relationship = null,
    Object? pass = null,
    Object? provinces = freezed,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      avatar: null == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      history: null == history
          ? _value.history
          : history // ignore: cast_nullable_to_non_nullable
              as String,
      province: freezed == province
          ? _value.province
          : province // ignore: cast_nullable_to_non_nullable
              as int?,
      district: freezed == district
          ? _value.district
          : district // ignore: cast_nullable_to_non_nullable
              as int?,
      relationship: null == relationship
          ? _value.relationship
          : relationship // ignore: cast_nullable_to_non_nullable
              as String,
      pass: null == pass
          ? _value.pass
          : pass // ignore: cast_nullable_to_non_nullable
              as bool,
      provinces: freezed == provinces
          ? _value.provinces
          : provinces // ignore: cast_nullable_to_non_nullable
              as List<Province>?,
      error: freezed == error ? _value.error : error,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TreeEditStateCopyWith<$Res>
    implements $TreeEditStateCopyWith<$Res> {
  factory _$$_TreeEditStateCopyWith(
          _$_TreeEditState value, $Res Function(_$_TreeEditState) then) =
      __$$_TreeEditStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String avatar,
      String name,
      String history,
      int? province,
      int? district,
      String relationship,
      bool pass,
      List<Province>? provinces,
      Object? error});
}

/// @nodoc
class __$$_TreeEditStateCopyWithImpl<$Res>
    extends _$TreeEditStateCopyWithImpl<$Res, _$_TreeEditState>
    implements _$$_TreeEditStateCopyWith<$Res> {
  __$$_TreeEditStateCopyWithImpl(
      _$_TreeEditState _value, $Res Function(_$_TreeEditState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? avatar = null,
    Object? name = null,
    Object? history = null,
    Object? province = freezed,
    Object? district = freezed,
    Object? relationship = null,
    Object? pass = null,
    Object? provinces = freezed,
    Object? error = freezed,
  }) {
    return _then(_$_TreeEditState(
      avatar: null == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      history: null == history
          ? _value.history
          : history // ignore: cast_nullable_to_non_nullable
              as String,
      province: freezed == province
          ? _value.province
          : province // ignore: cast_nullable_to_non_nullable
              as int?,
      district: freezed == district
          ? _value.district
          : district // ignore: cast_nullable_to_non_nullable
              as int?,
      relationship: null == relationship
          ? _value.relationship
          : relationship // ignore: cast_nullable_to_non_nullable
              as String,
      pass: null == pass
          ? _value.pass
          : pass // ignore: cast_nullable_to_non_nullable
              as bool,
      provinces: freezed == provinces
          ? _value._provinces
          : provinces // ignore: cast_nullable_to_non_nullable
              as List<Province>?,
      error: freezed == error ? _value.error : error,
    ));
  }
}

/// @nodoc

class _$_TreeEditState extends _TreeEditState {
  const _$_TreeEditState(
      {this.avatar = '',
      this.name = '',
      this.history = '',
      this.province,
      this.district,
      this.relationship = '',
      this.pass = false,
      final List<Province>? provinces,
      this.error})
      : _provinces = provinces,
        super._();

  @override
  @JsonKey()
  final String avatar;
  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String history;
  @override
  final int? province;
  @override
  final int? district;
  @override
  @JsonKey()
  final String relationship;
  @override
  @JsonKey()
  final bool pass;
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
  final Object? error;

  @override
  String toString() {
    return 'TreeEditState(avatar: $avatar, name: $name, history: $history, province: $province, district: $district, relationship: $relationship, pass: $pass, provinces: $provinces, error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TreeEditState &&
            (identical(other.avatar, avatar) || other.avatar == avatar) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.history, history) || other.history == history) &&
            (identical(other.province, province) ||
                other.province == province) &&
            (identical(other.district, district) ||
                other.district == district) &&
            (identical(other.relationship, relationship) ||
                other.relationship == relationship) &&
            (identical(other.pass, pass) || other.pass == pass) &&
            const DeepCollectionEquality()
                .equals(other._provinces, _provinces) &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      avatar,
      name,
      history,
      province,
      district,
      relationship,
      pass,
      const DeepCollectionEquality().hash(_provinces),
      const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TreeEditStateCopyWith<_$_TreeEditState> get copyWith =>
      __$$_TreeEditStateCopyWithImpl<_$_TreeEditState>(this, _$identity);
}

abstract class _TreeEditState extends TreeEditState {
  const factory _TreeEditState(
      {final String avatar,
      final String name,
      final String history,
      final int? province,
      final int? district,
      final String relationship,
      final bool pass,
      final List<Province>? provinces,
      final Object? error}) = _$_TreeEditState;
  const _TreeEditState._() : super._();

  @override
  String get avatar;
  @override
  String get name;
  @override
  String get history;
  @override
  int? get province;
  @override
  int? get district;
  @override
  String get relationship;
  @override
  bool get pass;
  @override
  List<Province>? get provinces;
  @override
  Object? get error;
  @override
  @JsonKey(ignore: true)
  _$$_TreeEditStateCopyWith<_$_TreeEditState> get copyWith =>
      throw _privateConstructorUsedError;
}
