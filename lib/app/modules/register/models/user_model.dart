import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  late String id;
  final String avatar;
  late String name;
  late String phone;
  late String gender;
  late String birthday;
  UserModel(
      {required this.id,
      required this.avatar,
      required this.name,
      required this.phone,
      required this.gender,
      required this.birthday});

  factory UserModel.fromDocumentSnapshot(DocumentSnapshot doc) {
    return UserModel(
      id: doc["id"],
      name:doc["name"],
      phone:doc["phone"],
      avatar:doc["avatar"],
      gender:doc["gender"],
      birthday:doc["birthday"],
    );
  }
  factory UserModel.fromJson(Map<String, dynamic> m) {
    return UserModel(
      id: m["id"],
      name:m["name"],
      phone:m["phone"],
      avatar:m["avatar"],
      gender:m["gender"],
      birthday:m["birthday"],
    );
  }
}
