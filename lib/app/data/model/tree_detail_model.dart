// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class TreeDetailModel {
  String? id;
  String? name;
  String? image;
  String? description;
  String? provinceId;
  String? district;
  String? relationName;
  int? level;
  int? totalMember;
  int? totalUser;
  int? roleId;
  TreeDetailModel({
    this.id,
    this.name,
    this.image,
    this.description,
    this.provinceId,
    this.district,
    this.relationName,
    this.level,
    this.totalMember,
    this.totalUser,
    this.roleId,
  });
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      // 'roleId': roleId,
      'image': image,
      'description': description,
      'province': provinceId,
      'district': district,
      'relation_name': relationName,
      'level': level,
      'total_member': totalMember,
      'total_user': totalUser,
      'role_id': roleId,
    };
  }

  factory TreeDetailModel.fromMap(Map<String, dynamic> map) {
    return TreeDetailModel(
      id: map['id'] != null ? map['id'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      // roleId: map['roleId'] != null ? map['roleId'] as int : null,
      image: map['image'] != null ? map['image'] as String : null,
      description:
          map['description'] != null ? map['description'] as String : null,
      provinceId: map['province'] != null ? map['province'] as String : null,
      district: map['district'] != null ? map['district'] as String : null,
      relationName:
          map['relation_name'] != null ? map['relation_name'] as String : null,
      level: map['level'] != null ? map['level'] as int : null,
      totalMember:
          map['total_member'] != null ? map['total_member'] as int : null,
      totalUser: map['total_user'] != null ? map['total_user'] as int : null,
      roleId: map['role_id'] != null ? map['role_id'] as int : null,
    );
  }
  String toJson() => json.encode(toMap());
  factory TreeDetailModel.fromJson(String source) =>
      TreeDetailModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
