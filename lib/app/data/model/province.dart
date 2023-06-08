import 'package:freezed_annotation/freezed_annotation.dart';
part 'province.freezed.dart';
part 'province.g.dart';

@freezed
class Province with _$Province{
  const Province._();
  const factory Province({
     int? id,
     String? name,
     List<District>? districts,
  })= _Province ;

  factory Province.fromJson(Map<String, Object?> json) =>
      _$ProvinceFromJson(json);
}

@freezed
class District with _$District{
  const District._();
  const factory District({
     int? id,
     String? name,
  })= _District ;

  factory District.fromJson(Map<String, Object?> json) =>
      _$DistrictFromJson(json);
}