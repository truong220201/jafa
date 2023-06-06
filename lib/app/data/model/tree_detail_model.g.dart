// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tree_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TreeDetailModel _$$_TreeDetailModelFromJson(Map<String, dynamic> json) =>
    _$_TreeDetailModel(
      jafa: json['jafa'] == null
          ? const JafaModel()
          : JafaModel.fromJson(json['jafa'] as Map<String, dynamic>),
      familyInfo: json['familyInfo'] as String? ?? '',
      familyInfoContent: json['familyInfoContent'] as String? ?? '',
      imageUrl: json['imageUrl'] as String? ?? '',
    );

Map<String, dynamic> _$$_TreeDetailModelToJson(_$_TreeDetailModel instance) =>
    <String, dynamic>{
      'jafa': instance.jafa,
      'familyInfo': instance.familyInfo,
      'familyInfoContent': instance.familyInfoContent,
      'imageUrl': instance.imageUrl,
    };
