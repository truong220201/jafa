import '../../../data/model/user.dart';
import '../api/user_info_api.dart';

class UserInfoRepository {
  final UserInfoApi _api;
  UserInfoRepository(this._api);

  Future<String?> logout() {
    try {
      return _api.logout();
    } catch (e) {
      rethrow;
    }
  }

  Future<User?> getUserInfo() {
    try {
      return _api.getUserInfo();
    } catch (e) {
      rethrow;
    }
  }
}
