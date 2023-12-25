import '../../../core/base/base_remote_source.dart';
import '../../../core/values/api_url_constant.dart';
import '../../../data/model/all_relasion_response.dart';

class EditRelationShipApi extends BaseRemoteSource {
  Future<AllRelationResponse> getAllRelasionship({
    required int genealogyId,
    required int memberId,
  }) {
    try {
      final request = dioClient
          .get(ApiUrlConstants.getAllMemberRelation(genealogyId, memberId));
      return callApiWithErrorParser(request).then((value) =>
          AllRelationResponse.fromJson(
              value.data["data"] as Map<String, dynamic>));
    } catch (e) {
      rethrow;
    }
  }

  Future<int?> createBranch({
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
          .then((value) => value.data["data"]["id"] as int);
    } catch (e) {
      rethrow;
    }
  }
}
