// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'member_info_model.freezed.dart';
part 'member_info_model.g.dart';

@freezed
class MemberInfoModel with _$MemberInfoModel {
  const MemberInfoModel._();
  const factory MemberInfoModel({
    int? id,
    String? name,
    @JsonKey(name: 'other_name') String? otherName,
    String? gender,
    String? birthday,
    String? avatar,
    String? address,
    String? phone,
    @JsonKey(name: 'dead_at') String? deadAt,
    @JsonKey(name: 'worship_place') String? worshipPlace,
    @JsonKey(name: 'burial_place') String? burialPlace,
    @JsonKey(name: 'job_name') String? jobName,
    @JsonKey(name: 'role') String? role,
    Detail? detail,
  }) = _MemberInfoModel;

  factory MemberInfoModel.fromJson(Map<String, Object?> json) =>
      _$MemberInfoModelFromJson(json);
}

@freezed
class Detail with _$Detail {
  const Detail._();
  const factory Detail({
    @JsonKey(name: 'user_id') int? userId,
    @JsonKey(name: 'role_id') int? roleId,
  }) = _Detail;
  factory Detail.fromJson(Map<String, Object?> json) => _$DetailFromJson(json);
}
