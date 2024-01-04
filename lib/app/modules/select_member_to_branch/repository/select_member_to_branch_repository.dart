import 'package:flutter_firebase/app/data/model/member_model.dart';

import '../api/select_member_to_branch_api.dart';

class SelectMemberToBranchRepository {
  final SelectMemberToBranchApi _api;
  SelectMemberToBranchRepository(this._api);
  Future<ListMemberModel> getListDetailMember(String idJafa) {
    return _api.getListDetailMember(idJafa);
  }

  Future<String> invMemberToTree(String idJafa, int idMember) {
    return _api.postQr(idJafa, idMember);
  }
}
