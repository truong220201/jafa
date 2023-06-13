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
    final prefs = await SharedPreferences.getInstance();
    final String accessToken = prefs.getString('accessToken') ??
        '1|8Mytq492Rg6e5pV1cPChnRCbUWOkjMYbx7iAR8nA';

    var customHeaders = {'content-type': 'application/json'};

    if (accessToken.trim().isNotEmpty) {
      customHeaders.addAll({
        'Authorization': "Bearer $accessToken",
      });
    }

    return customHeaders;
  }
}
