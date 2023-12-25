import '../../../data/model/province.dart';
import '../../../data/model/tree.dart';
import '../api/tree_create_api.dart';

class TreeCreateRepository {
  final TreeCreateApi _api;

  TreeCreateRepository(this._api);

  Future<Tree?> treeCreate({
    required String name,
    String? description,
    String? image,
    int? province,
    int? district,
    String? address,
    String? relationship,
  }) {
    return _api.treeCreate(
      name: name,
      description: description,
      image: image,
      province: province,
      district: district,
      address: address,
      relationship: relationship,
    );
  }

  Future<List<Province>> getProvinces() {
    return _api.getProvinces();
  }
}
