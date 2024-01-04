// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'member_model.freezed.dart';
part 'member_model.g.dart';

@freezed
class MemberModel with _$MemberModel {
  const MemberModel._();
  const factory MemberModel({
    int? id,
    String? name,
    String? avatar,
    String? gender,
    @JsonKey(name: 'other_name') String? otherName,
    @JsonKey(name: 'role_id') int? roleId,
    @JsonKey(name: 'birthday') String? birthday,
    @JsonKey(name: 'user_genealogy_id') String? userGenealogyId,
  }) = _MemberModel;

  factory MemberModel.fromJson(Map<String, Object?> json) =>
      _$MemberModelFromJson(json);
}

@freezed
class ListMemberModel with _$ListMemberModel {
  const ListMemberModel._();
  const factory ListMemberModel({
    List<MemberModel>? admins,
    List<MemberModel>? members,
    List<MemberModel>? viewer,
  }) = _ListMemberModel;

  factory ListMemberModel.fromJson(Map<String, Object?> json) =>
      _$ListMemberModelFromJson(json);
}
