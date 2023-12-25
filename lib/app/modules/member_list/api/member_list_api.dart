import 'package:flutter/cupertino.dart';
import 'package:genealogy_management/app/data/model/member_model.dart';

import '../../../core/base/base_remote_source.dart';
import '../../../flavors/build_config.dart';

class MemberListApi extends BaseRemoteSource {
  Future<ListMemberModel> getListDetailMember(int idJafa) async {
    final baseUrl = BuildConfig.instance.config.apiBaseUrl;
    final request = dioClient.get(
      '$baseUrl/api/genealogy/$idJafa/members',
    );
    try {
      ListMemberModel a = await callApiWithErrorParser(request)
          .then((response) => ListMemberModel.fromJson(response.data['data'])
          );
      return a;
    } catch (e) {
      rethrow;
    }
  }
}
