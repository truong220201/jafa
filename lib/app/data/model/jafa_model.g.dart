// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'jafa_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_JafaModel _$$_JafaModelFromJson(Map<String, dynamic> json) => _$_JafaModel(
      id: json['id'] as int?,
      name: json['name'] as String? ?? '',
      roleId: json['role_id'] as int?,
      content: json['content'] as String? ?? '',
      imageJafa: json['imageJafa'] as String? ?? '',
    );

Map<String, dynamic> _$$_JafaModelToJson(_$_JafaModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'role_id': instance.roleId,
      'content': instance.content,
      'imageJafa': instance.imageJafa,
    };
