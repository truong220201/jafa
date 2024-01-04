// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'member_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MemberInfoModelImpl _$$MemberInfoModelImplFromJson(
        Map<String, dynamic> json) =>
    _$MemberInfoModelImpl(
      id: json['id'] as int?,
      name: json['name'] as String?,
      otherName: json['other_name'] as String?,
      gender: json['gender'] as String?,
      birthday: json['birthday'] as String?,
      avatar: json['avatar'] as String?,
      address: json['address'] as String?,
      phone: json['phone'] as String?,
      deadAt: json['dead_at'] as String?,
      worshipPlace: json['worship_place'] as String?,
      burialPlace: json['burial_place'] as String?,
      jobName: json['job_name'] as String?,
      role: json['role'] as String?,
      detail: json['detail'] == null
          ? null
          : Detail.fromJson(json['detail'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$MemberInfoModelImplToJson(
        _$MemberInfoModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'other_name': instance.otherName,
      'gender': instance.gender,
      'birthday': instance.birthday,
      'avatar': instance.avatar,
      'address': instance.address,
      'phone': instance.phone,
      'dead_at': instance.deadAt,
      'worship_place': instance.worshipPlace,
      'burial_place': instance.burialPlace,
      'job_name': instance.jobName,
      'role': instance.role,
      'detail': instance.detail,
    };

_$DetailImpl _$$DetailImplFromJson(Map<String, dynamic> json) => _$DetailImpl(
      userId: json['user_id'] as int?,
      roleId: json['role_id'] as int?,
    );

Map<String, dynamic> _$$DetailImplToJson(_$DetailImpl instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'role_id': instance.roleId,
    };
