import '../api/create_branch_api.dart';

class CreateBranchRepository {
  final CreateBranchApi _createBranchApi;
  CreateBranchRepository(this._createBranchApi);

  Future<String?> createBranch({
    required String createType,
    required int userGenealogyId,
    required int genealogyId,
  }) {
    return _createBranchApi.createBranch(
        createType: createType,
        genealogyId: genealogyId,
        userGenealogyId: userGenealogyId);
  }
}
