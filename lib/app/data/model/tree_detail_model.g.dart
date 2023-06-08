// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tree_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TreeDetailModel _$$_TreeDetailModelFromJson(Map<String, dynamic> json) =>
    _$_TreeDetailModel(
      id: json['id'] as int?,
      name: json['name'] as String? ?? '',
      roleId: json['role_id'] as int?,
      relationName: json['relation_name'] as String? ?? '',
      imageJafa: json['image'] as String?,
      description: json['description'] as String? ?? '',
      provinceId: json[' province_id'] as int?,
      totalMember: json['total_member'] as int?,
      totalUser: json['total_user'] as int?,
      level: json['level'] as int?,
    );

Map<String, dynamic> _$$_TreeDetailModelToJson(_$_TreeDetailModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'role_id': instance.roleId,
      'relation_name': instance.relationName,
      'image': instance.imageJafa,
      'description': instance.description,
      ' province_id': instance.provinceId,
      'total_member': instance.totalMember,
      'total_user': instance.totalUser,
      'level': instance.level,
    };
