import 'package:genealogy_management/app/data/model/member_info_model.dart';

import '../../../data/model/jafa_model.dart';
import '../../../core/base/base_remote_source.dart';
import '../../../flavors/build_config.dart';

class MemberInfoApi extends BaseRemoteSource {
  Future<MemberInfoModel> getMemberInfoDetail(int idJafa, int idMember) async {
    final baseUrl = BuildConfig.instance.config.apiBaseUrl;
    final request = dioClient.get(
      '$baseUrl/api/genealogy/$idJafa/members/$idMember',
    );
    try {
      return callApiWithErrorParser(request)
          .then((response) => MemberInfoModel.fromJson(response.data['data']));
    } catch (e) {
      rethrow;
    }
  }
}
