import '../../../core/base/base_remote_source.dart';
import '../../../core/values/api_url_constant.dart';

class CreateBranchApi extends BaseRemoteSource {
  Future<String?> createBranch({
    required String createType,
    required int userGenealogyId,
    required int genealogyId,
  }) async {
    final request = dioClient.post(ApiUrlConstants.createBranch, data: {
      "create_type": createType,
      "user_genealogy_id": userGenealogyId,
      "genealogy_id": genealogyId
    });
    try {
      return callApiWithErrorParser(request)
          .then((value) => value.data["message"]);
    } catch (e) {
      rethrow;
    }
  }
}
