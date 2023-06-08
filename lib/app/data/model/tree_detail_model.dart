import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:genealogy_management/app/data/model/jafa_model.dart';

part 'tree_detail_model.freezed.dart';
part 'tree_detail_model.g.dart';

@freezed
class TreeDetailModel with _$TreeDetailModel {
  const TreeDetailModel._();
  const factory TreeDetailModel({
    int? id,
    @Default('') String name,
    @JsonKey(name: 'role_id') int? roleId,
    @JsonKey(name: 'relation_name') @Default('') String relationName,
    @JsonKey(name: 'image') String? imageJafa,
    @Default('') String description,
    @JsonKey(name: ' province_id') int? provinceId,
    @JsonKey(name: 'total_member') int? totalMember,
     @JsonKey(name: 'total_user') int? totalUser,
    int? level,
  }) = _TreeDetailModel;

  factory TreeDetailModel.fromJson(Map<String, Object?> json) =>
      _$TreeDetailModelFromJson(json);
}
