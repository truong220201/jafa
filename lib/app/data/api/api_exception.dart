import 'package:dio/dio.dart';

class ApiException {
  ApiException({
    required this.response,
  });
  final Response response;

  @override
  String toString() {
    return 'ApiException(httpCode: ${response.statusCode}, status: ${response.statusMessage}, message: ${getMessageFromResponse(response)})';
  }

  String getMessageFromResponse(Response response) {
    try {
      final message = response.data['message'];
      return message as String;
    } catch (e) {
      return '';
    }
  }
}

class NetworkException{
  
}