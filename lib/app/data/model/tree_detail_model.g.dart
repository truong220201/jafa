// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tree_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TreeDetailModel _$$_TreeDetailModelFromJson(Map<String, dynamic> json) =>
    _$_TreeDetailModel(
      user: json['user'] == null
          ? const UserModel()
          : UserModel.fromJson(json['user'] as Map<String, dynamic>),
      familyInfo: json['familyInfo'] as String? ?? '',
      familyInfoContent: json['familyInfoContent'] as String? ?? '',
      imageUrl: json['imageUrl'] as String? ?? '',
    );

Map<String, dynamic> _$$_TreeDetailModelToJson(_$_TreeDetailModel instance) =>
    <String, dynamic>{
      'user': instance.user,
      'familyInfo': instance.familyInfo,
      'familyInfoContent': instance.familyInfoContent,
      'imageUrl': instance.imageUrl,
    };
