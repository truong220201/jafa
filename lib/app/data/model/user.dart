import 'package:genealogy_management/app/core/extension/string_extention.dart';

class User {
  int? id;
  String? role;
  String? name;
  String? otherName;
  String? gender;
  DateTime? birthday;
  String? avatar;
  String? phone;
  String? address;
  bool? isAlive;
  bool? isMom;
  DateTime? deadAt;
  String? worshipplace;
  String? burialPlace;
  String? jobName;
  String? relationType;
  String? email;
  User({
    this.id,
    this.role,
    this.name,
    this.otherName,
    this.gender,
    this.birthday,
    this.avatar,
    this.phone,
    this.address,
    this.isAlive,
    this.isMom,
    this.deadAt,
    this.worshipplace,
    this.burialPlace,
    this.jobName,
    this.relationType,
    this.email,
  });
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json["user_genealogy_id"],
      role: json.containsKey("role") ? json["role"] : null,
      name: json["name"],
      otherName: json["other_name"],
      avatar: json["avatar"],
      gender: json["gender"],
      birthday: json["birthday"] != null
          ? json["birthday"].toString().toFormatDate2()
          : json["birthday"],
      phone: json["phone"],
      address: json["address"],
      isAlive: json.containsKey("is_dead") ? json["is_dead"] == 0 : true,
      isMom: json.containsKey("is_mom") ? json["is_mom"] as bool : false,
      deadAt: json["dead_at"] != null
          ? json["dead_at"].toString().toFormatDate2()
          : json["dead_at"],
      worshipplace: json["worship_place"],
      burialPlace: json["burial_place"],
      jobName: json["job_name"],
      relationType:
          json.containsKey("relation_type") ? json["relation_type"] : null,
      email: json.containsKey("email") ? json["email"] : null,
    );
  }

  User copyWith({
    int? id,
    String? name,
    String? otherName,
    String? gender,
    DateTime? birthday,
    String? avatar,
    String? phone,
    String? address,
    DateTime? deadAt,
    String? worshipplace,
    String? burialPlace,
    String? jobName,
    bool? isAlive,
    bool? isMom,
    String? relationType,
    String? email,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      otherName: otherName ?? this.otherName,
      gender: gender ?? this.gender,
      birthday: birthday ?? this.birthday,
      avatar: avatar ?? this.avatar,
      phone: phone ?? this.phone,
      address: address ?? this.address,
      deadAt: deadAt ?? this.deadAt,
      worshipplace: worshipplace ?? this.worshipplace,
      burialPlace: burialPlace ?? this.burialPlace,
      jobName: jobName ?? this.jobName,
      isAlive: isAlive ?? this.isAlive,
      isMom: isMom ?? this.isMom,
      relationType: relationType ?? this.relationType,
      email: email ?? this.email,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'other_name': otherName,
      'gender': gender,
      'birthday': birthday?.millisecondsSinceEpoch,
      'avatar': avatar,
      'phone': phone,
      'address': address,
      'is_alive': isAlive,
      'is_mom': isMom,
      'deadAt': deadAt?.millisecondsSinceEpoch,
      'worship_place': worshipplace,
      'burial_place': burialPlace,
      'job_name': jobName,
      "relation_type": relationType,
      'email': email,
    };
  }
}
