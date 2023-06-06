// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'jafa_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_JafaModel _$$_JafaModelFromJson(Map<String, dynamic> json) => _$_JafaModel(
      name: json['name'] as String? ?? '',
      content: json['relation_name'] as String? ?? '',
      imageJafa: json['image'] as String? ?? '',
    );

Map<String, dynamic> _$$_JafaModelToJson(_$_JafaModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'relation_name': instance.content,
      'image': instance.imageJafa,
    };
