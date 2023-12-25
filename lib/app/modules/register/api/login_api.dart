import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/api/api_hepler.dart';
import '../../../data/model/user.dart';

final apiHelper = ApiHelper();

class LoginApi {
  Future<User?> login({
    required String fUid,
  }) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final response = await apiHelper.post(
        path: '/api/login',
        parameters: {
          'f_uid': fUid,
        },
      );
      if (response.data['status']) {
        final userJson = response.data['data']['user'];
        final accessToken = response.data['data']['access_token'].toString();
        await prefs.setString('accessToken', accessToken);
        final user = User.fromJson(userJson);
        return user;
      } else {
        return null;
      }
    } catch (e) {
      rethrow;
    }
  }
}
