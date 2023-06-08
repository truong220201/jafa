import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:genealogy_management/app/core/extension/stringx_extention.dart';

part 'user.freezed.dart';

@freezed
class User with _$User {
  const User._();
  const factory User({
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
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json["id"],
      name: json["name"],
      otherName: json["other_name"],
      avatar: json["avatar"],
      gender: json["gender"],
      birthday: json["birthday"] != null
          ? json["birthday"].toString().toFormatDate()
          : json["birthday"],
      phone: json["phone"],
      address: json["address"],
      deadAt: json["dead_at"] != null
          ? json["dead_at"].toString().toFormatDate()
          : json["dead_at"],
      worshipplace: json["worship_place"],
      burialPlace: json["burial_place"],
      jobName: json["job_name"],
    );
  }
}
