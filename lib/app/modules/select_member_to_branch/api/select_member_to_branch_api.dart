import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_firebase/app/data/model/member_model.dart';

class SelectMemberToBranchApi {
  Future<ListMemberModel> getListDetailMember(String idJafa) async {
    return ListMemberModel();
  }

  Future<String> postQr(String idJafa, int idMember) async {
    return '';
  }

  Future<ListMemberModel> invMemberToJafa(int idMember, String idJafa) async {
    return ListMemberModel();
  }
}
