// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tree_view_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TreeViewModelImpl _$$TreeViewModelImplFromJson(Map<String, dynamic> json) =>
    _$TreeViewModelImpl(
      idJafa: json['id_jafa'] as String?,
      id: json['user_genealogy_id'] as String?,
      name: json['name'] as String?,
      image: json['image'] as String?,
      birthday: json['birthday'] as String?,
      gender: json['gender'] as String?,
      childrenParrent: (json['children'] as List<dynamic>?)
              ?.map((e) => Parrent.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      isRoot: json['is_root'] as bool? ?? false,
      self: json['self'] as bool?,
      pId: json['province_id'] as String?,
      address: json['address'] as String?,
    );

Map<String, dynamic> _$$TreeViewModelImplToJson(_$TreeViewModelImpl instance) =>
    <String, dynamic>{
      'id_jafa': instance.idJafa,
      'user_genealogy_id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'birthday': instance.birthday,
      'gender': instance.gender,
      'children': instance.childrenParrent,
      'is_root': instance.isRoot,
      'self': instance.self,
      'province_id': instance.pId,
      'address': instance.address,
    };

_$ParrentImpl _$$ParrentImplFromJson(Map<String, dynamic> json) =>
    _$ParrentImpl(
      id: json['user_genealogy_id'] as String?,
      relationType: json['relation_type'] as String?,
    );

Map<String, dynamic> _$$ParrentImplToJson(_$ParrentImpl instance) =>
    <String, dynamic>{
      'user_genealogy_id': instance.id,
      'relation_type': instance.relationType,
    };
