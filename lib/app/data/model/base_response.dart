// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import '../../core/constant/model_constants.dart';

// class BaseResponse<T> {
//   final int? status;
//   final bool? success;
//   final T? data;
//   final String? message;

//   BaseResponse(
//     this.status,
//     this.success,
//     this.data,
//     this.message,
//   );

//   factory BaseResponse.fromJson(
//       {required Map<String, dynamic> json, Function(dynamic json)? fromJson}) {
//     final results =
//         fromJson != null ? fromJson(json[ModelConstants.data]) : null;
//     final status = json[ModelConstants.status];
//     final message = json[ModelConstants.message];
//     final success = json[ModelConstants.success];
//     return BaseResponse(status, success, results, message);
//   }
// }
