import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:genealogy_management/app/data/model/member_model.dart';

import '../../../core/base/base_remote_source.dart';
import '../../../flavors/build_config.dart';

class SelectMemberToBranchApi extends BaseRemoteSource {
  Future<ListMemberModel> getListDetailMember(int idJafa) async {
    final baseUrl = BuildConfig.instance.config.apiBaseUrl;
    final request = dioClient.get(
      '$baseUrl/api/genealogy/$idJafa/members',
    );
    try {
      ListMemberModel a = await callApiWithErrorParser(request)
          .then((response) => ListMemberModel.fromJson(response.data['data']));
      debugPrint('aaaaaaaaaa---------' + a.toString());
      return a;
    } catch (e) {
      rethrow;
    }
  }

  Future<String> postQr(int idJafa, int idMember) async {
    debugPrint('id jafa: ' +
        idJafa.toString() +
        '-----id member: ' +
        idMember.toString());
    final baseUrl = BuildConfig.instance.config.apiBaseUrl;
    final request = dioClient.post(
      '$baseUrl/api/tree/$idJafa/invite/$idMember',
    );

    try {
      var message = await callApiWithErrorParser(request)
          .then((value) => value.data["message"]);

      debugPrint(message.toString());
      // _snackSample("Gia nhập thành công!");
      //return response.toString();
      return "Gia nhập thành công!";
    } on DioException catch (e) {
      // debugPrint('Bạn đã gia nhập gia tộc này rồi');
      // _snackSample("Bạn đã gia nhập gia tộc này rồi.");
      return 'Bạn đã gia nhập gia tộc này rồi.';
      //return e.toString().contains('400').toString();
    }
  }

  Future<ListMemberModel> invMemberToJafa(int idMember, int idJafa) async {
    final baseUrl = BuildConfig.instance.config.apiBaseUrl;
    final request = dioClient.get(
      '$baseUrl/api/genealogy/$idJafa/members',
    );
    try {
      ListMemberModel a = await callApiWithErrorParser(request)
          .then((response) => ListMemberModel.fromJson(response.data['data']));
      debugPrint('aaaaaaaaaa---------' + a.toString());
      return a;
    } catch (e) {
      rethrow;
    }
  }
}
