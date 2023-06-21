import 'package:genealogy_management/app/data/model/tree_detail_model.dart';

import '../../../data/model/province.dart';
import '../../../data/model/tree.dart';
import '../api/tree_edit_api.dart';

class TreeEditRepository {
  final TreeEditApi _api;

  TreeEditRepository(this._api);

  Future<String?> treeEdit({
    required int id,
    required String name,
    String? description,
    String? image,
    String? province,
    String? district,
    String? address,
    String? relationship,
  }) async {
    return _api
        .updateJafa(
            id: id,
            name: name,
            description: description,
            image: image,
            province: province,
            district: district,
            relationship: relationship)
        .toString();
  }

  Future<List<Province>> getProvinces() {
    return _api.getProvinces();
  }
}
