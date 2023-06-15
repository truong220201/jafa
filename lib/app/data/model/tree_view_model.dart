import 'package:freezed_annotation/freezed_annotation.dart';

part 'tree_view_model.freezed.dart';
part 'tree_view_model.g.dart';

@freezed
class TreeViewModel with _$TreeViewModel {
  const TreeViewModel._();
  const factory TreeViewModel({
    int? id,
    String? name,
    String? avatar,
    List<Parrent>? childrenParrent,
  }) = _TreeViewModel;

  factory TreeViewModel.fromJson(Map<String, Object?> json) =>
      _$TreeViewModelFromJson(json);
}

@freezed
class Parrent with _$Parrent {
  const Parrent._();
  const factory Parrent({
    int? id,
    String? relationType,
  }) = _Parrent;

  factory Parrent.fromJson(Map<String, Object?> json) =>
      _$ParrentFromJson(json);
}

@freezed
class Couple with _$Couple {
  const Couple._();
  const factory Couple({
    int? idaPerson,
    List<int>? listIdvk,
  }) = _Couple;

  factory Couple.fromJson(Map<String, Object?> json) => _$CoupleFromJson(json);
}
