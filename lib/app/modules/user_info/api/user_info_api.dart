import '../../../core/base/base_remote_source.dart';
import '../../../core/values/api_url_constant.dart';
import '../../../data/model/user.dart';

class UserInfoApi extends BaseRemoteSource {
  Future<String?> logout() async {
    final request = dioClient.post(ApiUrlConstants.logout);
    try {
      return callApiWithErrorParser(request)
          .then((value) => value.data['message']);
    } catch (e) {
      rethrow;
    }
  }

  Future<User?> getUserInfo() async {
    final request = dioClient.get(ApiUrlConstants.getInfo);
    try {
      return callApiWithErrorParser(request).then(
          (value) => User.fromJson(value.data['data'] as Map<String, dynamic>));
    } catch (e) {
      rethrow;
    }
  }
}
