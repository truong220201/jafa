// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class TimeLineUserInfo {
  int? id;
  String? name;
  String? otherName;
  String? birthday;
  String? avatar;
  String? address;
  String? phone;
  String? deadAt;
  String? worshipPlace;
  String? burialPlace;
  String? jobName;
  int? isDead;
  String? email;
  int? userGenealogyId;
  int? roleId;
  String? userId;
  TimeLineUserInfo({
    this.id,
    this.name,
    this.otherName,
    this.birthday,
    this.avatar,
    this.address,
    this.phone,
    this.deadAt,
    this.worshipPlace,
    this.burialPlace,
    this.jobName,
    this.isDead,
    this.email,
    this.userGenealogyId,
    this.roleId,
    this.userId,
  });

  TimeLineUserInfo copyWith({
    int? id,
    String? name,
    String? otherName,
    String? birthday,
    String? avatar,
    String? address,
    String? phone,
    String? deadAt,
    String? worshipPlace,
    String? burialPlace,
    String? jobName,
    int? isDead,
    String? email,
    int? userGenealogyId,
    int? roleId,
    String? userId,
  }) {
    return TimeLineUserInfo(
      id: id ?? this.id,
      name: name ?? this.name,
      otherName: otherName ?? this.otherName,
      birthday: birthday ?? this.birthday,
      avatar: avatar ?? this.avatar,
      address: address ?? this.address,
      phone: phone ?? this.phone,
      deadAt: deadAt ?? this.deadAt,
      worshipPlace: worshipPlace ?? this.worshipPlace,
      burialPlace: burialPlace ?? this.burialPlace,
      jobName: jobName ?? this.jobName,
      isDead: isDead ?? this.isDead,
      email: email ?? this.email,
      userGenealogyId: userGenealogyId ?? this.userGenealogyId,
      roleId: roleId ?? this.roleId,
      userId: userId ?? this.userId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'otherName': otherName,
      'birthday': birthday,
      'avatar': avatar,
      'address': address,
      'phone': phone,
      'deadAt': deadAt,
      'worshipPlace': worshipPlace,
      'burialPlace': burialPlace,
      'jobName': jobName,
      'isDead': isDead,
      'email': email,
      'userGenealogyId': userGenealogyId,
      'roleId': roleId,
      'userId': userId,
    };
  }

  factory TimeLineUserInfo.fromMap(Map<String, dynamic> map) {
    return TimeLineUserInfo(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] != null ? map['name'] as String : null,
      otherName: map['otherName'] != null ? map['otherName'] as String : null,
      birthday: map['birthday'] != null ? map['birthday'] as String : null,
      avatar: map['avatar'] != null ? map['avatar'] as String : null,
      address: map['address'] != null ? map['address'] as String : null,
      phone: map['phone'] != null ? map['phone'] as String : null,
      deadAt: map['deadAt'] != null ? map['deadAt'] as String : null,
      worshipPlace:
          map['worshipPlace'] != null ? map['worshipPlace'] as String : null,
      burialPlace:
          map['burialPlace'] != null ? map['burialPlace'] as String : null,
      jobName: map['jobName'] != null ? map['jobName'] as String : null,
      isDead: map['isDead'] != null ? map['isDead'] as int : null,
      email: map['email'] != null ? map['email'] as String : null,
      userGenealogyId:
          map['userGenealogyId'] != null ? map['userGenealogyId'] as int : null,
      roleId: map['roleId'] != null ? map['roleId'] as int : null,
      userId: map['userId'] != null ? map['userId'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory TimeLineUserInfo.fromJson(String source) =>
      TimeLineUserInfo.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'TimeLineUserInfo(id: $id, name: $name, otherName: $otherName, birthday: $birthday, avatar: $avatar, address: $address, phone: $phone, deadAt: $deadAt, worshipPlace: $worshipPlace, burialPlace: $burialPlace, jobName: $jobName, isDead: $isDead, email: $email, userGenealogyId: $userGenealogyId, roleId: $roleId, userId: $userId)';
  }

  @override
  bool operator ==(covariant TimeLineUserInfo other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.otherName == otherName &&
        other.birthday == birthday &&
        other.avatar == avatar &&
        other.address == address &&
        other.phone == phone &&
        other.deadAt == deadAt &&
        other.worshipPlace == worshipPlace &&
        other.burialPlace == burialPlace &&
        other.jobName == jobName &&
        other.isDead == isDead &&
        other.email == email &&
        other.userGenealogyId == userGenealogyId &&
        other.roleId == roleId &&
        other.userId == userId;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        otherName.hashCode ^
        birthday.hashCode ^
        avatar.hashCode ^
        address.hashCode ^
        phone.hashCode ^
        deadAt.hashCode ^
        worshipPlace.hashCode ^
        burialPlace.hashCode ^
        jobName.hashCode ^
        isDead.hashCode ^
        email.hashCode ^
        userGenealogyId.hashCode ^
        roleId.hashCode ^
        userId.hashCode;
  }
}
