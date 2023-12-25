import '../../../core/base/base_remote_source.dart';
import '../../../core/values/api_url_constant.dart';

class EditMomApi extends BaseRemoteSource {
  Future<String?> changeMom({
    required int userGenealogyId,
    required int genealogyId,
  }) {
    try {
      final data = {"user_genealogy_id": userGenealogyId};
      final request = dioClient.patch(
        ApiUrlConstants.changeMom(genealogyId),
        data: data,
      );
      return callApiWithErrorParser(request)
          .then((value) => value.data["message"]);
    } catch (e) {
      rethrow;
    }
  }
}
