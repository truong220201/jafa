import 'package:genealogy_management/app/data/model/member_model.dart';

import '../api/member_list_api.dart';

class MemberListRepository {
  final MemberListApi _api;
  MemberListRepository(this._api);
  Future<ListMemberModel> getListDetailMember(int idJafa) {
    return _api.getListDetailMember(idJafa);
  }
}
