import 'package:genealogy_management/app/data/model/tree_view_model.dart';

import '../api/tree_detail_api.dart';

class TreeViewRepository {
  final TreeViewApi _api;
  TreeViewRepository(this._api);
  Future<List<TreeViewModel>> getTreeViewDetail(int id) {
    return _api.getTreeViewDetail(id);
  }

  Future<String?> treeRequest({
    required int userGenealogyId,
    required int genealogyId,
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
