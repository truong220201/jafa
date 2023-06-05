import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';

import '../../core/widgets/alert/network_alert_view.dart';
import '../../flavors/build_config.dart';

class NetworkAlertIgnore {
  final String path;
  final String method;

  NetworkAlertIgnore({required this.path, required this.method});

  @override
  String toString() {
    return method + path;
  }
}

class ApiPath {
  static const String createReport = '/report/inspection';
  static const String postMethod = 'POST';

  static List<NetworkAlertIgnore> ignorePaths = [
    NetworkAlertIgnore(path: createReport, method: postMethod)
  ];
  static List<String> get ignorePathStrings =>
      ignorePaths.map((e) => e.toString()).toList();
}

const String rootPath = 'https://curly-wolves-say.loca.lt';

class ApiHelper {
  final logger = BuildConfig.instance.config.logger;
  static const int timeoutDuration = 10;
  final _dio = Dio();

  Future<Response> get({
    required String path,
    Map<String, dynamic>? parameters,
  }) async {
    if (await isNotConnected()) {
      handleNetworkIssue(path: path);
      throw NetworkException();
    }

    final Map<String, String> headers =
        _getHeaders('1|InYOqkfZZLcwog5JHyaX7hbnVFBVROj116yRT1iD');
    try {
      return await _dio.get(rootPath + path,
          options: Options(headers: headers));
    } catch (e) {
      throw Exception('exception in GET HTTP request. $e');
    }
  }

  Future<String> delete({
    required String path,
  }) async {
    try {
      var response = await Dio().delete(rootPath + path,
          options: Options(headers: {
            "Content-Type": "application/json",
            "Authorization":
                "Bearer 1|InYOqkfZZLcwog5JHyaX7hbnVFBVROj116yRT1iD",
          }));
      debugPrint('a--------------' + response.toString());
      if (response.statusCode == 400) {
        var jsonResponse = response.data['message'];
        debugPrint(jsonResponse.toString());
        return jsonResponse;
      }
      return response.toString();
    } on DioError catch (e) {
      if (e.response!.statusCode == 400) {
        debugPrint(e.response!.data['message'].toString());
        return e.response!.data['message'];
        //debugPrint(e.response!.data['message'].toString());
      }
    }
    return '';
  }
//  Future<dynamic> get({
//     required String path,
//     Map<String, dynamic>? parameters,
//   }) async {
//     assert(path.startsWith('/'), 'path should start with /');
//     logger.d('GET $path, $parameters');
//     final response = await _get(path: path, parameters: parameters);

//     if (response.statusCode! < 200 || response.statusCode! >= 300) {
//       // logger
//       //     .d('statusCode is not 200s. ${response.statusCode} ${response.body}');
//       // throw ApiException(
//       //   httpCode: response.statusCode,
//       //   status: response.body,
//       //   message: getMessageFromResponse(response),
//       // );
//     }
//     final body = utf8.decode(response.bodyBytes);
//     logger.d(body);
//     final json = jsonDecode(body);
//     final status = json['status'];
//     if (status != true) {
//       logger.e('status is not true. $json');
//     }
//     final message = json['message'];
//     if (message != null) {
//       logger.d(message);
//     }
//     return json['data'];
//   }
  // Future<Response> _post({
  //   required String path,
  //   required dynamic data,
  // }) async {
  //   if (await isNotConnected()) {
  //     if (ApiPath.ignorePathStrings.contains(ApiPath.postMethod + path)) {
  //       throw const SocketException('Should save data in local');
  //     }
  //     handleNetworkIssue(path: path);
  //     throw NetworkException();
  //   }
  //   final Map<String, String> headers = _getHeaders('');
  //   try {
  //     return await _dio
  //         .post(_getUri(path).toString(), options: Options(headers: headers))
  //         .timeout(const Duration(seconds: timeoutDuration));
  //   } on Exception catch (e) {
  //     logger.e('POST ${_getUri(path)}, ${jsonEncode(data)}');
  //     if (e is SocketException || e is TimeoutException) {
  //       if (path.contains(ApiPath.createReport)) {
  //         rethrow;
  //       }
  //     }
  //     throw Exception('exception in POST HTTP request. $e');
  //   }
  // }

  // Future<dynamic> post({
  //   required String path,
  //   required dynamic data,
  // }) async {
  //   assert(path.startsWith('/'), 'path should start with /');
  //   logger.d('POST $path $data');
  //   final response = await _post(path: path, data: data);
  //   if (response.statusCode! < 200 || response.statusCode! >= 300) {
  //     throw ApiException(
  //       httpCode: response.statusCode!,
  //       status: response.toString(),
  //       message: getMessageFromResponse(response),
  //     );
  //   }

  //   final body = utf8.decode(response.bodyBytes);
  //   logger.d(body);
  //   final json = jsonDecode(body);
  //   final status = json['status'];
  //   if (status != true) {
  //     logger.e('status is not true. $json');
  //   }
  //   final message = json['message'];
  //   if (message != null) {
  //     logger.d(message);
  //   }
  //   return json['data'];
  // }

  Map<String, String> _getHeaders(String token) {
    final Map<String, String> headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token",
    };

    if (token != null) {
      headers.addAll({
        'access-token': 'Bearer $token',
      });
    }

    return headers;
  }

  void handleNetworkIssue({String? path}) {
    /// Ignore some apis, to not show alert
    if (path != null && path == ApiPath.createReport) {
      return;
    }
    logger.e('=====> Network connection false');
    NetworkAlertView.instance.show();
  }

  Future<bool> isNotConnected() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    return connectivityResult == ConnectivityResult.none;
  }
}

class NetworkException {}

class ApiException {
  ApiException({
    required this.httpCode,
    required this.status,
    required this.message,
  });

  final int httpCode;
  final String status;
  final String message;

  @override
  String toString() {
    return 'ApiException(httpCode: $httpCode, status: $status, message: $message)';
  }
}