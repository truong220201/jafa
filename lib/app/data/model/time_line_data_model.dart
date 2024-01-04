// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'dart:convert';

// import 'package:flutter/foundation.dart';

// import 'package:genealogy_management/app/data/model/time_line_user_info_model.dart';

// class TimeLineData {
//   TimeLineUserInfo? father;
//   List<TimeLineUserInfo>? children;
//   TimeLineData({
//     this.father,
//     this.children,
//   });

//   TimeLineData copyWith({
//     TimeLineUserInfo? father,
//     List<TimeLineUserInfo>? children,
//   }) {
//     return TimeLineData(
//       father: father ?? this.father,
//       children: children ?? this.children,
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return <String, dynamic>{
//       'father': father?.toMap(),
//       'children': children!.map((x) => x?.toMap()).toList(),
//     };
//   }

//   factory TimeLineData.fromMap(Map<String, dynamic> map) {
//     return TimeLineData(
//       father: map['father'] != null
//           ? TimeLineUserInfo.fromMap(map['father'] as Map<String, dynamic>)
//           : null,
//       children: map['children'] != null
//           ? List<TimeLineUserInfo>.from(
//               (map['children'] as List<int>).map<TimeLineUserInfo?>(
//                 (x) => TimeLineUserInfo.fromMap(x as Map<String, dynamic>),
//               ),
//             )
//           : null,
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory TimeLineData.fromJson(String source) =>
//       TimeLineData.fromMap(json.decode(source) as Map<String, dynamic>);

//   @override
//   String toString() => 'TimeLineData(father: $father, children: $children)';

//   @override
//   bool operator ==(covariant TimeLineData other) {
//     if (identical(this, other)) return true;

//     return other.father == father && listEquals(other.children, children);
//   }

//   @override
//   int get hashCode => father.hashCode ^ children.hashCode;
// }
