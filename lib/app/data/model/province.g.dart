// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'province.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Province _$$_ProvinceFromJson(Map<String, dynamic> json) => _$_Province(
      id: json['id'] as int?,
      name: json['name'] as String?,
      districts: (json['districts'] as List<dynamic>?)
          ?.map((e) => District.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ProvinceToJson(_$_Province instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'districts': instance.districts,
    };

_$_District _$$_DistrictFromJson(Map<String, dynamic> json) => _$_District(
      id: json['id'] as int?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$$_DistrictToJson(_$_District instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
