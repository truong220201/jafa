import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../data/api/api_hepler.dart';
import '../../../data/model/user.dart';

final apiHelper = ApiHelper();

class RegisterApi {
  Future<User?> register({
    required String fUid,
    required String name,
    String? phone,
    int? gender,
    String? avatar,
    DateTime? birthday,
  }) async {
    FormData formData = FormData.fromMap({
      "f_uid": fUid,
      "name": name,
      'gender': gender,
      "avatar": avatar != null ? MultipartFile.fromFileSync(avatar) : null,
      'phone': phone,
      'birthday': birthday,
    });

    try {
      final prefs = await SharedPreferences.getInstance();
      final response = await apiHelper.post(
        path: '/api/register',
        parameters: formData,
      );
      if (response.data['status']) {
        final userJson = response.data['data']['user'];
        final accessToken = response.data['data']['access_token'];
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
