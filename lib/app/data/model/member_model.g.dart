// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'member_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MemberModel _$$_MemberModelFromJson(Map<String, dynamic> json) =>
    _$_MemberModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      avatar: json['avatar'] as String?,
      gender: json['gender'] as String?,
      otherName: json['other_name'] as String?,
      roleId: json['role_id'] as int?,
      birthday: json['birthday'] as String?,
      userGenealogyId: json['user_genealogy_id'] as int?,
    );

Map<String, dynamic> _$$_MemberModelToJson(_$_MemberModel instance) =>
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

_$_ListMemberModel _$$_ListMemberModelFromJson(Map<String, dynamic> json) =>
    _$_ListMemberModel(
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

Map<String, dynamic> _$$_ListMemberModelToJson(_$_ListMemberModel instance) =>
    <String, dynamic>{
      'admins': instance.admins,
      'members': instance.members,
      'viewer': instance.viewer,
    };
