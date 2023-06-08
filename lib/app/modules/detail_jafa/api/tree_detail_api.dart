import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:genealogy_management/app/data/model/tree_detail_model.dart';

import '../../../data/api/api_hepler.dart';
import '../../../data/model/jafa_model.dart';

class TreeDetailApi {
  final apiHelper = ApiHelper();
  Future<TreeDetailModel> getTreeDetail(int idJafa) async {
    debugPrint(idJafa.toString());
    final responseData =
        await apiHelper.get(path: '/api/genealogy/$idJafa/detail');
    debugPrint('-----------responseData' + responseData.toString());
    TreeDetailModel data = TreeDetailModel.fromJson(responseData.data['data']);
    debugPrint('-----------data' + data.toString());
    return data;
  }

  Future<String> deleteJafa(int idJafa) async {
    final String responseData =
        await apiHelper.delete(path: '/api/genealogy/${idJafa.toString()}');
    return responseData.toString();
  }

  Future<String> leavingJafa(int idJafa) async {
    final String responseData = await apiHelper.delete(
        path: '/api/genealogy/${idJafa.toString()}/leave');
    return responseData.toString();
  }
  // Future<List<EmailNotification>> getEmailNotifications() async {
  //   final data = await apiHelper.get(path: '/account/email-notification');
  //   return (data as List).map((e) => EmailNotification.fromJson(e)).toList();
  // }

  // Future<List<Conservation>> searchConservations({
  //   required ConservationFilter? filter,
  //   required String query,
  // }) async {
  //   final Map<String, String> params = {};
  //   if (query.trim().isNotEmpty) {
  //     params['search'] = query.trim();
  //   }
  //   if (filter != null) {
  //     if (filter.companyLocation != null) {
  //       params['location1'] = filter.companyLocation!.id.id.toString();
  //     }
  //     if (filter.location1 != null) {
  //       params['location2'] = filter.location1!.id.id.toString();
  //     }
  //     if (filter.location2 != null) {
  //       params['location3'] = filter.location2!.id.id.toString();
  //     }
  //     if (filter.conservationKind != null) {
  //       params['conservation_kind_id'] =
  //           filter.conservationKind!.id.id.toString();
  //     }
  //     if (filter.responPerson != null) {
  //       params['created_id'] = filter.responPerson!.id.id.toString();
  //     }
  //   }
  //   final data =
  //       await apiHelper.get(path: '/conservation-rule', parameters: params);
  //   return (data as List).map((e) => Conservation.fromJson(e)).toList();
  // }

  // Future<void> registerFCM() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   final String? firstLogin = prefs.getString('firstLoginToken');
  //   final String? token = await FirebaseMessaging.instance.getToken();
  //   await apiHelper.post(
  //     path: '/auth/register-fcm-token',
  //     data: {
  //       'first_login_token': firstLogin,
  //       'fcm_token': token,
  //     },
  //   );
  // }
}
