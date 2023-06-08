import 'package:freezed_annotation/freezed_annotation.dart';

part 'tree.freezed.dart';

@freezed
class Tree with _$Tree {
  const Tree._();
  const factory Tree({
    @Default('') String name,
    String? discription,
    String? image,
    String? province,
    String? district,
    String? address,
    String? relationship,
  }) = _Tree;

  factory Tree.fromJson(Map<String, dynamic> json) {
    return Tree(
      name: json["name"],
      discription: json["discription"],
      image: json["image"],
      province: json["province_id"].toString(),
      district: json["district_id"].toString(),
      address: json["address"],
      relationship: json["relation_name"],
    );
  }
}
