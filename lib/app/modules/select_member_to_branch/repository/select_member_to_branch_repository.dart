import 'package:flutter/cupertino.dart';
import 'package:genealogy_management/app/data/model/member_model.dart';

import '../api/select_member_to_branch_api.dart';

class SelectMemberToBranchRepository {
  final SelectMemberToBranchApi _api;
  SelectMemberToBranchRepository(this._api);
  Future<ListMemberModel> getListDetailMember(int idJafa) {
    return _api.getListDetailMember(idJafa);
  }

  Future<String> invMemberToTree(int idJafa, int idMember) {
    return _api.postQr(idJafa, idMember);
  }
}
