import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RequestHeaderInterceptor extends InterceptorsWrapper {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    getCustomHeaders().then((customHeaders) {
      options.headers.addAll(customHeaders);
      super.onRequest(options, handler);
    });
  }

  Future<Map<String, String>> getCustomHeaders() async {
    // final String accessToken =
    //     await PreferenceManagerImpl().getString(PreferenceManager.keyToken);
    //      log(accessToken);
    //String accessToken = '14|CKVWIhTJObHbmAAtQGyAZSgdZfb3xJ5Wdt017Sqw';
    // final prefs = await SharedPreferences.getInstance();
    const String accessToken = '91|gCd6q6F5vxz2S68kvgXYK1pTLvzcv4pzYTGnySEg';

    var customHeaders = {'content-type': 'application/json'};

    if (accessToken.trim().isNotEmpty) {
      customHeaders.addAll({
        'Authorization': "Bearer $accessToken",
      });
    }

    return customHeaders;
  }
}
