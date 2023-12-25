import '../../../data/model/user.dart';
import '../api/login_api.dart';
import '../api/register_api.dart';

class RegistrationRepository {
  final LoginApi _loginApi;
  final RegisterApi _registerApi;
  RegistrationRepository(this._loginApi, this._registerApi);

  Future<User?> login({
    required String fUid,
  }) {
    return _loginApi.login(fUid: fUid);
  }

  Future<User?> register({
    required String fUid,
    required String name,
    String? phone,
    int? gender,
    String? avatar,
    DateTime? birthday,
  }) {
    try {
      return _registerApi.register(
        fUid: fUid,
        name: name,
        phone: phone,
        gender: gender,
        avatar: avatar,
        birthday: birthday,
      );
    } catch (e) {
      rethrow;
    }
  }
}
