import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:genealogy_management/app/data/model/jafa_model.dart';

part 'tree_detail_model.freezed.dart';
part 'tree_detail_model.g.dart';

@freezed
class TreeDetailModel with _$TreeDetailModel {
  const TreeDetailModel._();
  const factory TreeDetailModel({
    JafaModel? jafa,
    @Default('') String familyInfo,
    @Default('') String familyInfoContent,
    @Default('') String imageUrl,
  }) = _TreeDetailModel;

  factory TreeDetailModel.fromJson(Map<String, Object?> json) =>
      _$TreeDetailModelFromJson(json);
}
