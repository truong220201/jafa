import '../api/edit_user_info_api.dart';

class EditUserInfoRepository {
  final EditUserInfoApi _editUserInfoApi;
  EditUserInfoRepository(this._editUserInfoApi);

  Future<String?> editInfo({
    required String name,
    String? otherName,
    String? phone,
    int? gender,
    String? avatar,
    DateTime? birthday,
    String? job,
    String? email,
  }) {
    return _editUserInfoApi.editInfo(
        name: name,
        otherName: otherName,
        avatar: avatar,
        phone: phone,
        gender: gender,
        birthday: birthday,
        job: job,
        email: email,);
  }
}
