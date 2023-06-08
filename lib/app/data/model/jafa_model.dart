import 'package:freezed_annotation/freezed_annotation.dart';

part 'jafa_model.freezed.dart';
part 'jafa_model.g.dart';

@freezed
class JafaModel with _$JafaModel {
  const JafaModel._();
  const factory JafaModel({
    int? id,
    @Default('') String name,
    @JsonKey(name: 'role_id') int? roleId,
    @JsonKey(name: 'relation_name') @Default('') String relationName,
    @JsonKey(name: 'image') String? imageJafa,
  }) = _JafaModel;

  factory JafaModel.fromJson(Map<String, Object?> json) =>
      _$JafaModelFromJson(json);
}
