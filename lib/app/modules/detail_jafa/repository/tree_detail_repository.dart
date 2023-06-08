import 'package:genealogy_management/app/data/model/jafa_model.dart';
import 'package:genealogy_management/app/data/model/tree_detail_model.dart';

import '../api/tree_detail_api.dart';

class TreeDetailRepository {
  final TreeDetailApi _api;
  TreeDetailRepository(this._api);
  Future<TreeDetailModel> getTreeDetail(int idJafa) async {
    return await _api.getTreeDetail(idJafa);
  }

  // Future<List<Conservation>> getConservations({
  //   required ConservationKindId conservationKindId,
  //   required ConservationTabType conservationTabType,
  // }) {
  //   return _api.getConservations(
  //     conservationKindId: conservationKindId,
  //     conservationTabType: conservationTabType,
  //   );
  // }

  // Future<List<EmailNotification>> getEmailNotifications() {
  //   return _api.getEmailNotifications();
  // }
  // Future<List<UserModel>> getUserModel() {
  //   return _api.searchConservations(
  //     filter: filter,
  //     query: query,
  //   );
  // }
  // Future<List<Conservation>> searchConservations({
  //   required ConservationFilter? filter,
  //   required String query,
  // }) {
  //   return _api.searchConservations(
  //     filter: filter,
  //     query: query,
  //   );
  // }
  // Future<void> registerFCM() {
  //   return _api.registerFCM();
  // }
}
