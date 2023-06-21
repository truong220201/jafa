// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tree_view_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TreeViewModel _$$_TreeViewModelFromJson(Map<String, dynamic> json) =>
    _$_TreeViewModel(
      id: json['user_genealogy_id'] as int?,
      name: json['name'] as String?,
      avatar: json['avatar'] as String?,
      childrenParrent: (json['children'] as List<dynamic>?)
              ?.map((e) => Parrent.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_TreeViewModelToJson(_$_TreeViewModel instance) =>
    <String, dynamic>{
      'user_genealogy_id': instance.id,
      'name': instance.name,
      'avatar': instance.avatar,
      'children': instance.childrenParrent,
    };

_$_Parrent _$$_ParrentFromJson(Map<String, dynamic> json) => _$_Parrent(
      id: json['user_genealogy_id'] as int?,
      relationType: json['relation_type'] as String?,
    );

Map<String, dynamic> _$$_ParrentToJson(_$_Parrent instance) =>
    <String, dynamic>{
      'user_genealogy_id': instance.id,
      'relation_type': instance.relationType,
    };
