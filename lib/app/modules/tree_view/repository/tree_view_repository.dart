import 'package:flutter_firebase/app/data/model/tree_view_model.dart';
import '../api/tree_detail_api.dart';

class TreeViewRepository {
  final TreeViewApi _api;
  TreeViewRepository(this._api);
  Future<List<TreeViewModel>> getTreeViewDetail(String id) {
    return _api.getTreeViewDetail(id);
  }

  Future<String?> treeRequest({
    required String userGenealogyId,
    required String genealogyId,
  }) {
    try {
      return _api.treeRequest(
        userGenealogyId: userGenealogyId,
        genealogyId: genealogyId,
      );
    } catch (e) {
      rethrow;
    }
  }
}
