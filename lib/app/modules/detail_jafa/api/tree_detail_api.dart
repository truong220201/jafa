import 'package:dio/dio.dart';
import 'package:genealogy_management/app/data/model/tree_detail_model.dart';

import '../../../flavors/build_config.dart';
import '../../../core/base/base_remote_source.dart';

class TreeDetailApi extends BaseRemoteSource {
  Future<TreeDetailModel> getTreeDetail(int idJafa) async {
    final baseUrl = BuildConfig.instance.config.apiBaseUrl;
    final request = dioClient.get(
      '$baseUrl/api/genealogy/$idJafa/detail',
      
    );
    try {
      return callApiWithErrorParser(request)
          .then((response) => TreeDetailModel.fromJson(response.data['data']));
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> deleteJafa(int idJafa) async {
    final baseUrl = BuildConfig.instance.config.apiBaseUrl;
    final request = dioClient.delete(
      '$baseUrl/api/genealogy/$idJafa/detail',
    );
    final Response responseData = await callApiWithErrorParser(request)
        .then((response) => response.data['data']);
    return responseData;
  }

  Future<Response> leavingJafa(int idJafa) async {
    final baseUrl = BuildConfig.instance.config.apiBaseUrl;
    final request = dioClient.delete(
      '$baseUrl/api/genealogy/${idJafa.toString()}/leave',
    );
    final Response responseData = await callApiWithErrorParser(request)
        .then((response) => response.data['data']);
    return responseData;
  }

  // Future<TreeDetailModel> getTreeDetail(int idJafa) async {
  //   final baseUrl = BuildConfig.instance.config.apiBaseUrl;
  //   final request = dioClient.get(
  //     '$baseUrl/api/genealogy/?per_page=23&page=5',
  //   );
  //   try {
  //     return callApiWithErrorParser(request)
  //         .then((response) => TreeDetailModel.fromJson(response.data['data']));
  //     // (response.data['data'] as List)
  //     //     .map<JafaModel>((value) => JafaModel.fromJson(value))
  //     //     .toList());
  //   } catch (e) {
  //     rethrow;
  //   }
  // }
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
