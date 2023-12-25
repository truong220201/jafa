import '../../../core/base/base_remote_source.dart';
import '../../../core/values/api_url_constant.dart';

class EditCoupleApi extends BaseRemoteSource {
  Future<String?> changeCouple(
      {required int memberId,
      required int genealogyId,
      required String ids}) {
    try {
      final data = {
        "member_id": memberId,
        'ids': ids,
      };
      final request = dioClient.patch(
        ApiUrlConstants.changeCouple(genealogyId),
        data: data,
      );
      return callApiWithErrorParser(request)
          .then((value) => value.data["message"]);
    } catch (e) {
      rethrow;
    }
  }
}
