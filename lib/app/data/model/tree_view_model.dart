// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'tree_view_model.freezed.dart';
part 'tree_view_model.g.dart';

@freezed
class TreeViewModel with _$TreeViewModel {
  const TreeViewModel._();
  const factory TreeViewModel({
    @JsonKey(name: 'user_genealogy_id') int? id,
    String? name,
    String? avatar,
    String? birthday,
    String? gender,
    @JsonKey(name: 'children') @Default([]) List<Parrent> childrenParrent,
    @JsonKey(name: 'is_root') @Default(false) bool isRoot,
    bool? self,
  }) = _TreeViewModel;

  factory TreeViewModel.fromJson(Map<String, Object?> json) =>
      _$TreeViewModelFromJson(json);
}

@freezed
class Parrent with _$Parrent {
  const Parrent._();
  const factory Parrent({
    @JsonKey(name: 'user_genealogy_id') int? id,
    @JsonKey(name: 'relation_type') String? relationType,
  }) = _Parrent;

  factory Parrent.fromJson(Map<String, Object?> json) =>
      _$ParrentFromJson(json);
}

class Couple {
  int? idaPerson;
  List<int>? listIdvk;

  Couple({
    this.idaPerson,
    this.listIdvk,
  });
  Couple copyWith({
    int? idaPerson,
    List<int>? listIdvk,
  }) {
    return Couple(
      idaPerson: idaPerson ?? this.idaPerson,
      listIdvk: listIdvk ?? this.listIdvk,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'idaPerson': idaPerson,
      'listIdvk': listIdvk,
    };
  }

  factory Couple.fromMap(Map<String, dynamic> map) {
    return Couple(
      idaPerson: map['idaPerson'] != null ? map['idaPerson'] as int : null,
      listIdvk: map['listIdvk'] != null
          ? List<int>.from((map['listIdvk'] as List<int>))
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Couple.fromJson(String source) =>
      Couple.fromMap(json.decode(source) as Map<String, dynamic>);
}
