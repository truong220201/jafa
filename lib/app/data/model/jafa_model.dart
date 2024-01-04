// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'jafa_model.freezed.dart';
part 'jafa_model.g.dart';

@freezed
class JafaModel with _$JafaModel {
  const JafaModel._();
  const factory JafaModel({
    String? id,
    @Default('') String name,
    @JsonKey(name: 'role_id') int? roleId,
    @JsonKey(name: 'relation_name') @Default('') String relationName,
    @JsonKey(name: 'image') String? imageJafa,
  }) = _JafaModel;

  factory JafaModel.fromJson(Map<String, Object?> json) =>
      _$JafaModelFromJson(json);

  factory JafaModel.fromMap(Map<String, dynamic> map) {
    return JafaModel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      roleId: map['role_id'] ?? 0,
      relationName: map['relationName'] ?? '',
      imageJafa: map['image'] ?? '',
    );
  }
}
