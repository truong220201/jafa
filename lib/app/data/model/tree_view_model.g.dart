// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tree_view_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TreeViewModel _$$_TreeViewModelFromJson(Map<String, dynamic> json) =>
    _$_TreeViewModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      avatar: json['avatar'] as String?,
      childrenParrent: (json['childrenParrent'] as List<dynamic>?)
          ?.map((e) => Parrent.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_TreeViewModelToJson(_$_TreeViewModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'avatar': instance.avatar,
      'childrenParrent': instance.childrenParrent,
    };

_$_Parrent _$$_ParrentFromJson(Map<String, dynamic> json) => _$_Parrent(
      id: json['id'] as int?,
      relationType: json['relationType'] as String?,
    );

Map<String, dynamic> _$$_ParrentToJson(_$_Parrent instance) =>
    <String, dynamic>{
      'id': instance.id,
      'relationType': instance.relationType,
    };

_$_Couple _$$_CoupleFromJson(Map<String, dynamic> json) => _$_Couple(
      idaPerson: json['idaPerson'] as int?,
      listIdvk:
          (json['listIdvk'] as List<dynamic>?)?.map((e) => e as int).toList(),
    );

Map<String, dynamic> _$$_CoupleToJson(_$_Couple instance) => <String, dynamic>{
      'idaPerson': instance.idaPerson,
      'listIdvk': instance.listIdvk,
    };
