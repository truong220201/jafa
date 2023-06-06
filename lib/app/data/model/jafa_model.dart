import 'package:freezed_annotation/freezed_annotation.dart';

part 'jafa_model.freezed.dart';
part 'jafa_model.g.dart';

@freezed
class JafaModel with _$JafaModel {
  const JafaModel._();
  const factory JafaModel({
    @Default('') String name,
    @Default('') String content,
    @Default('') String imageJafa,
  }) = _JafaModel;

  factory JafaModel.fromJson(Map<String, Object?> json) =>
      _$JafaModelFromJson(json);
}
