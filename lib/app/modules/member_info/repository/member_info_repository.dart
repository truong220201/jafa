import '../../../data/model/member_info_model.dart';
import '../api/member_info_api.dart';

class MemberInfoRepository {
  final MemberInfoApi _api;
  MemberInfoRepository(this._api);
  Future<MemberInfoModel> getMemberInfoDetail(int idJafa, int idMember) {
    return _api.getMemberInfoDetail(idJafa, idMember);
  }
}
