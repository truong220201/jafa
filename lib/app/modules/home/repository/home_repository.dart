import 'package:flutter_firebase/app/data/model/jafa_model.dart';

import '../api/home_api.dart';

class HomeRepository {
  final HomeApi _api;
  HomeRepository(this._api);
  Future<List<JafaModel>> getHomeDetail() {
    return _api.getHomeDetail();
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
