// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'member_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MemberInfoModel _$$_MemberInfoModelFromJson(Map<String, dynamic> json) =>
    _$_MemberInfoModel(
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

Map<String, dynamic> _$$_MemberInfoModelToJson(_$_MemberInfoModel instance) =>
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

_$_Detail _$$_DetailFromJson(Map<String, dynamic> json) => _$_Detail(
      userId: json['user_id'] as int?,
      roleId: json['role_id'] as int?,
    );

Map<String, dynamic> _$$_DetailToJson(_$_Detail instance) => <String, dynamic>{
      'user_id': instance.userId,
      'role_id': instance.roleId,
    };
