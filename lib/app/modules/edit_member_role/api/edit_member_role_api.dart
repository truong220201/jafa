import '../../../core/base/base_remote_source.dart';
import '../../../core/values/api_url_constant.dart';

class EditMemberRoleApi extends BaseRemoteSource {
  Future<String?> changeRole(
      {required int userGenealogyId,
      required int genealogyId,
      required int roleId}) {
    try {
      final data = {"role_id": roleId};
      final request = dioClient.patch(
        ApiUrlConstants.changeRole(genealogyId, genealogyId),
        data: data,
      );
      return callApiWithErrorParser(request)
          .then((value) => value.data["message"]);
    } catch (e) {
      rethrow;
    }
  }
}
