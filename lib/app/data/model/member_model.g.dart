// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'member_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MemberModelImpl _$$MemberModelImplFromJson(Map<String, dynamic> json) =>
    _$MemberModelImpl(
      id: json['id'] as int?,
      name: json['name'] as String?,
      avatar: json['avatar'] as String?,
      gender: json['gender'] as String?,
      otherName: json['other_name'] as String?,
      roleId: json['role_id'] as int?,
      birthday: json['birthday'] as String?,
      userGenealogyId: json['user_genealogy_id'] as String?,
    );

Map<String, dynamic> _$$MemberModelImplToJson(_$MemberModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'avatar': instance.avatar,
      'gender': instance.gender,
      'other_name': instance.otherName,
      'role_id': instance.roleId,
      'birthday': instance.birthday,
      'user_genealogy_id': instance.userGenealogyId,
    };

_$ListMemberModelImpl _$$ListMemberModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ListMemberModelImpl(
      admins: (json['admins'] as List<dynamic>?)
          ?.map((e) => MemberModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      members: (json['members'] as List<dynamic>?)
          ?.map((e) => MemberModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      viewer: (json['viewer'] as List<dynamic>?)
          ?.map((e) => MemberModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ListMemberModelImplToJson(
        _$ListMemberModelImpl instance) =>
    <String, dynamic>{
      'admins': instance.admins,
      'members': instance.members,
      'viewer': instance.viewer,
    };
