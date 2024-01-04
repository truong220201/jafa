// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'dart:convert';

// import 'package:genealogy_management/app/core/extension/string_extention.dart';
// import 'package:genealogy_management/app/data/model/time_line_data_model.dart';

// class TimeLine {
//   String? startYear;
//   String? endYear;
//   TimeLineData? data;
//   TimeLine({
//     this.startYear,
//     this.endYear,
//   });

//   TimeLine copyWith({
//     String? startYear,
//     String? endYear,
//   }) {
//     return TimeLine(
//       startYear: startYear ?? this.startYear,
//       endYear: endYear ?? this.endYear,
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return <String, dynamic>{
//       'startYear': startYear,
//       'endYear': endYear,
//     };
//   }

//   factory TimeLine.fromMap(Map<String, dynamic> map) {
//     return TimeLine(
//       startYear: map['start_year'] != null ? map['start_year'] as String : null,
//       endYear: map['end_year'] != null ? map['end_year'] as String : null,
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory TimeLine.fromJson(String source) =>
//       TimeLine.fromMap(json.decode(source) as Map<String, dynamic>);

//   @override
//   String toString() => 'TimeLine(startYear: $startYear, endYear: $endYear)';

//   @override
//   bool operator ==(covariant TimeLine other) {
//     if (identical(this, other)) return true;

//     return other.startYear == startYear && other.endYear == endYear;
//   }

//   @override
//   int get hashCode => startYear.hashCode ^ endYear.hashCode;
// }
