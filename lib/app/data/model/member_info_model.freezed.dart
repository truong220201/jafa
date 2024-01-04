// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'member_info_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MemberInfoModel _$MemberInfoModelFromJson(Map<String, dynamic> json) {
  return _MemberInfoModel.fromJson(json);
}

/// @nodoc
mixin _$MemberInfoModel {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'other_name')
  String? get otherName => throw _privateConstructorUsedError;
  String? get gender => throw _privateConstructorUsedError;
  String? get birthday => throw _privateConstructorUsedError;
  String? get avatar => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  @JsonKey(name: 'dead_at')
  String? get deadAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'worship_place')
  String? get worshipPlace => throw _privateConstructorUsedError;
  @JsonKey(name: 'burial_place')
  String? get burialPlace => throw _privateConstructorUsedError;
  @JsonKey(name: 'job_name')
  String? get jobName => throw _privateConstructorUsedError;
  @JsonKey(name: 'role')
  String? get role => throw _privateConstructorUsedError;
  Detail? get detail => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MemberInfoModelCopyWith<MemberInfoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MemberInfoModelCopyWith<$Res> {
  factory $MemberInfoModelCopyWith(
          MemberInfoModel value, $Res Function(MemberInfoModel) then) =
      _$MemberInfoModelCopyWithImpl<$Res, MemberInfoModel>;
  @useResult
  $Res call(
      {int? id,
      String? name,
      @JsonKey(name: 'other_name') String? otherName,
      String? gender,
      String? birthday,
      String? avatar,
      String? address,
      String? phone,
      @JsonKey(name: 'dead_at') String? deadAt,
      @JsonKey(name: 'worship_place') String? worshipPlace,
      @JsonKey(name: 'burial_place') String? burialPlace,
      @JsonKey(name: 'job_name') String? jobName,
      @JsonKey(name: 'role') String? role,
      Detail? detail});

  $DetailCopyWith<$Res>? get detail;
}

/// @nodoc
class _$MemberInfoModelCopyWithImpl<$Res, $Val extends MemberInfoModel>
    implements $MemberInfoModelCopyWith<$Res> {
  _$MemberInfoModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? otherName = freezed,
    Object? gender = freezed,
    Object? birthday = freezed,
    Object? avatar = freezed,
    Object? address = freezed,
    Object? phone = freezed,
    Object? deadAt = freezed,
    Object? worshipPlace = freezed,
    Object? burialPlace = freezed,
    Object? jobName = freezed,
    Object? role = freezed,
    Object? detail = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      otherName: freezed == otherName
          ? _value.otherName
          : otherName // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      birthday: freezed == birthday
          ? _value.birthday
          : birthday // ignore: cast_nullable_to_non_nullable
              as String?,
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      deadAt: freezed == deadAt
          ? _value.deadAt
          : deadAt // ignore: cast_nullable_to_non_nullable
              as String?,
      worshipPlace: freezed == worshipPlace
          ? _value.worshipPlace
          : worshipPlace // ignore: cast_nullable_to_non_nullable
              as String?,
      burialPlace: freezed == burialPlace
          ? _value.burialPlace
          : burialPlace // ignore: cast_nullable_to_non_nullable
              as String?,
      jobName: freezed == jobName
          ? _value.jobName
          : jobName // ignore: cast_nullable_to_non_nullable
              as String?,
      role: freezed == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String?,
      detail: freezed == detail
          ? _value.detail
          : detail // ignore: cast_nullable_to_non_nullable
              as Detail?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DetailCopyWith<$Res>? get detail {
    if (_value.detail == null) {
      return null;
    }

    return $DetailCopyWith<$Res>(_value.detail!, (value) {
      return _then(_value.copyWith(detail: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MemberInfoModelImplCopyWith<$Res>
    implements $MemberInfoModelCopyWith<$Res> {
  factory _$$MemberInfoModelImplCopyWith(_$MemberInfoModelImpl value,
          $Res Function(_$MemberInfoModelImpl) then) =
      __$$MemberInfoModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? name,
      @JsonKey(name: 'other_name') String? otherName,
      String? gender,
      String? birthday,
      String? avatar,
      String? address,
      String? phone,
      @JsonKey(name: 'dead_at') String? deadAt,
      @JsonKey(name: 'worship_place') String? worshipPlace,
      @JsonKey(name: 'burial_place') String? burialPlace,
      @JsonKey(name: 'job_name') String? jobName,
      @JsonKey(name: 'role') String? role,
      Detail? detail});

  @override
  $DetailCopyWith<$Res>? get detail;
}

/// @nodoc
class __$$MemberInfoModelImplCopyWithImpl<$Res>
    extends _$MemberInfoModelCopyWithImpl<$Res, _$MemberInfoModelImpl>
    implements _$$MemberInfoModelImplCopyWith<$Res> {
  __$$MemberInfoModelImplCopyWithImpl(
      _$MemberInfoModelImpl _value, $Res Function(_$MemberInfoModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? otherName = freezed,
    Object? gender = freezed,
    Object? birthday = freezed,
    Object? avatar = freezed,
    Object? address = freezed,
    Object? phone = freezed,
    Object? deadAt = freezed,
    Object? worshipPlace = freezed,
    Object? burialPlace = freezed,
    Object? jobName = freezed,
    Object? role = freezed,
    Object? detail = freezed,
  }) {
    return _then(_$MemberInfoModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      otherName: freezed == otherName
          ? _value.otherName
          : otherName // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      birthday: freezed == birthday
          ? _value.birthday
          : birthday // ignore: cast_nullable_to_non_nullable
              as String?,
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      deadAt: freezed == deadAt
          ? _value.deadAt
          : deadAt // ignore: cast_nullable_to_non_nullable
              as String?,
      worshipPlace: freezed == worshipPlace
          ? _value.worshipPlace
          : worshipPlace // ignore: cast_nullable_to_non_nullable
              as String?,
      burialPlace: freezed == burialPlace
          ? _value.burialPlace
          : burialPlace // ignore: cast_nullable_to_non_nullable
              as String?,
      jobName: freezed == jobName
          ? _value.jobName
          : jobName // ignore: cast_nullable_to_non_nullable
              as String?,
      role: freezed == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String?,
      detail: freezed == detail
          ? _value.detail
          : detail // ignore: cast_nullable_to_non_nullable
              as Detail?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MemberInfoModelImpl extends _MemberInfoModel {
  const _$MemberInfoModelImpl(
      {this.id,
      this.name,
      @JsonKey(name: 'other_name') this.otherName,
      this.gender,
      this.birthday,
      this.avatar,
      this.address,
      this.phone,
      @JsonKey(name: 'dead_at') this.deadAt,
      @JsonKey(name: 'worship_place') this.worshipPlace,
      @JsonKey(name: 'burial_place') this.burialPlace,
      @JsonKey(name: 'job_name') this.jobName,
      @JsonKey(name: 'role') this.role,
      this.detail})
      : super._();

  factory _$MemberInfoModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MemberInfoModelImplFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  @override
  @JsonKey(name: 'other_name')
  final String? otherName;
  @override
  final String? gender;
  @override
  final String? birthday;
  @override
  final String? avatar;
  @override
  final String? address;
  @override
  final String? phone;
  @override
  @JsonKey(name: 'dead_at')
  final String? deadAt;
  @override
  @JsonKey(name: 'worship_place')
  final String? worshipPlace;
  @override
  @JsonKey(name: 'burial_place')
  final String? burialPlace;
  @override
  @JsonKey(name: 'job_name')
  final String? jobName;
  @override
  @JsonKey(name: 'role')
  final String? role;
  @override
  final Detail? detail;

  @override
  String toString() {
    return 'MemberInfoModel(id: $id, name: $name, otherName: $otherName, gender: $gender, birthday: $birthday, avatar: $avatar, address: $address, phone: $phone, deadAt: $deadAt, worshipPlace: $worshipPlace, burialPlace: $burialPlace, jobName: $jobName, role: $role, detail: $detail)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MemberInfoModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.otherName, otherName) ||
                other.otherName == otherName) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.birthday, birthday) ||
                other.birthday == birthday) &&
            (identical(other.avatar, avatar) || other.avatar == avatar) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.deadAt, deadAt) || other.deadAt == deadAt) &&
            (identical(other.worshipPlace, worshipPlace) ||
                other.worshipPlace == worshipPlace) &&
            (identical(other.burialPlace, burialPlace) ||
                other.burialPlace == burialPlace) &&
            (identical(other.jobName, jobName) || other.jobName == jobName) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.detail, detail) || other.detail == detail));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      otherName,
      gender,
      birthday,
      avatar,
      address,
      phone,
      deadAt,
      worshipPlace,
      burialPlace,
      jobName,
      role,
      detail);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MemberInfoModelImplCopyWith<_$MemberInfoModelImpl> get copyWith =>
      __$$MemberInfoModelImplCopyWithImpl<_$MemberInfoModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MemberInfoModelImplToJson(
      this,
    );
  }
}

abstract class _MemberInfoModel extends MemberInfoModel {
  const factory _MemberInfoModel(
      {final int? id,
      final String? name,
      @JsonKey(name: 'other_name') final String? otherName,
      final String? gender,
      final String? birthday,
      final String? avatar,
      final String? address,
      final String? phone,
      @JsonKey(name: 'dead_at') final String? deadAt,
      @JsonKey(name: 'worship_place') final String? worshipPlace,
      @JsonKey(name: 'burial_place') final String? burialPlace,
      @JsonKey(name: 'job_name') final String? jobName,
      @JsonKey(name: 'role') final String? role,
      final Detail? detail}) = _$MemberInfoModelImpl;
  const _MemberInfoModel._() : super._();

  factory _MemberInfoModel.fromJson(Map<String, dynamic> json) =
      _$MemberInfoModelImpl.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  @JsonKey(name: 'other_name')
  String? get otherName;
  @override
  String? get gender;
  @override
  String? get birthday;
  @override
  String? get avatar;
  @override
  String? get address;
  @override
  String? get phone;
  @override
  @JsonKey(name: 'dead_at')
  String? get deadAt;
  @override
  @JsonKey(name: 'worship_place')
  String? get worshipPlace;
  @override
  @JsonKey(name: 'burial_place')
  String? get burialPlace;
  @override
  @JsonKey(name: 'job_name')
  String? get jobName;
  @override
  @JsonKey(name: 'role')
  String? get role;
  @override
  Detail? get detail;
  @override
  @JsonKey(ignore: true)
  _$$MemberInfoModelImplCopyWith<_$MemberInfoModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Detail _$DetailFromJson(Map<String, dynamic> json) {
  return _Detail.fromJson(json);
}

/// @nodoc
mixin _$Detail {
  @JsonKey(name: 'user_id')
  int? get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'role_id')
  int? get roleId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DetailCopyWith<Detail> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetailCopyWith<$Res> {
  factory $DetailCopyWith(Detail value, $Res Function(Detail) then) =
      _$DetailCopyWithImpl<$Res, Detail>;
  @useResult
  $Res call(
      {@JsonKey(name: 'user_id') int? userId,
      @JsonKey(name: 'role_id') int? roleId});
}

/// @nodoc
class _$DetailCopyWithImpl<$Res, $Val extends Detail>
    implements $DetailCopyWith<$Res> {
  _$DetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = freezed,
    Object? roleId = freezed,
  }) {
    return _then(_value.copyWith(
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      roleId: freezed == roleId
          ? _value.roleId
          : roleId // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DetailImplCopyWith<$Res> implements $DetailCopyWith<$Res> {
  factory _$$DetailImplCopyWith(
          _$DetailImpl value, $Res Function(_$DetailImpl) then) =
      __$$DetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'user_id') int? userId,
      @JsonKey(name: 'role_id') int? roleId});
}

/// @nodoc
class __$$DetailImplCopyWithImpl<$Res>
    extends _$DetailCopyWithImpl<$Res, _$DetailImpl>
    implements _$$DetailImplCopyWith<$Res> {
  __$$DetailImplCopyWithImpl(
      _$DetailImpl _value, $Res Function(_$DetailImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = freezed,
    Object? roleId = freezed,
  }) {
    return _then(_$DetailImpl(
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      roleId: freezed == roleId
          ? _value.roleId
          : roleId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DetailImpl extends _Detail {
  const _$DetailImpl(
      {@JsonKey(name: 'user_id') this.userId,
      @JsonKey(name: 'role_id') this.roleId})
      : super._();

  factory _$DetailImpl.fromJson(Map<String, dynamic> json) =>
      _$$DetailImplFromJson(json);

  @override
  @JsonKey(name: 'user_id')
  final int? userId;
  @override
  @JsonKey(name: 'role_id')
  final int? roleId;

  @override
  String toString() {
    return 'Detail(userId: $userId, roleId: $roleId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DetailImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.roleId, roleId) || other.roleId == roleId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, userId, roleId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DetailImplCopyWith<_$DetailImpl> get copyWith =>
      __$$DetailImplCopyWithImpl<_$DetailImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DetailImplToJson(
      this,
    );
  }
}

abstract class _Detail extends Detail {
  const factory _Detail(
      {@JsonKey(name: 'user_id') final int? userId,
      @JsonKey(name: 'role_id') final int? roleId}) = _$DetailImpl;
  const _Detail._() : super._();

  factory _Detail.fromJson(Map<String, dynamic> json) = _$DetailImpl.fromJson;

  @override
  @JsonKey(name: 'user_id')
  int? get userId;
  @override
  @JsonKey(name: 'role_id')
  int? get roleId;
  @override
  @JsonKey(ignore: true)
  _$$DetailImplCopyWith<_$DetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
