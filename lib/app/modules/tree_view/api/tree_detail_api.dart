import 'package:genealogy_management/app/data/model/tree_view_model.dart';

import '../../../core/base/base_remote_source.dart';
import '../../../core/values/api_url_constant.dart';

class TreeViewApi extends BaseRemoteSource {
  // Future<List<JafaModel>> getTreeViewDetail() async {
  //   final responseData =
  //       await apiHelper.get(path: '/api/genealogy/?per_page=23&page=1');

  //   List<JafaModel> data = responseData.data['data']
  //       .map<JafaModel>((n) => JafaModel.fromJson(n))
  //       .toList();
  //   debugPrint('-----------data' + data.toString());
  //   return data;
  // }

  Future<List<TreeViewModel>> getTreeViewDetail(int id) async {
    final request = dioClient.get(ApiUrlConstants.getTreeView(id));
    try {
      // return callApiWithErrorParser(request)
      //     .then((response) => List<TreeViewModel>.fromJson(response.data['data']));
      return callApiWithErrorParser(request).then((response) =>
          (response.data['data'] as List)
              .map<TreeViewModel>((value) => TreeViewModel.fromJson(value))
              .toList());
      //return MockTreeDetailRepository().getTreeViewModel();
    } catch (e) {
      rethrow;
    }
  }
  // Future<List<EmailNotification>> getEmailNotifications() async {
  //   final data = await apiHelper.get(path: '/account/email-notification');
  //   return (data as List).map((e) => EmailNotification.fromJson(e)).toList();
  // }

  // Future<List<Conservation>> searchConservations({
  //   required ConservationFilter? filter,
  //   required String query,
  // }) async {
  //
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
  Future<String?> treeRequest({
    required int userGenealogyId,
    required int genealogyId,
  }) {
    final data = {
      "user_genealogy_id": userGenealogyId,
      "genealogy_id": genealogyId
    };
    final request = dioClient.post(ApiUrlConstants.treeRequest, data: data);
    try {
      return callApiWithErrorParser(request)
          .then((value) => value.data["message"]);
    } catch (e) {
      rethrow;
    }
  }
}
