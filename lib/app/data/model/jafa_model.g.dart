// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'jafa_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$JafaModelImpl _$$JafaModelImplFromJson(Map<String, dynamic> json) =>
    _$JafaModelImpl(
      id: json['id'] as String?,
      name: json['name'] as String? ?? '',
      roleId: json['role_id'] as int?,
      relationName: json['relation_name'] as String? ?? '',
      imageJafa: json['image'] as String?,
    );

Map<String, dynamic> _$$JafaModelImplToJson(_$JafaModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'role_id': instance.roleId,
      'relation_name': instance.relationName,
      'image': instance.imageJafa,
    };
