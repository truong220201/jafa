import 'package:flutter_firebase/app/data/model/tree_detail_model.dart';

import '../api/tree_detail_api.dart';

class TreeDetailRepository {
  final TreeDetailApi _api;
  TreeDetailRepository(this._api);
  Future<TreeDetailModel> getTreeDetail(String idJafa) async {
    return await _api.getTreeDetail(idJafa);
  }
}
