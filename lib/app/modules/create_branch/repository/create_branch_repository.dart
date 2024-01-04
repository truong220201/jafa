import '../api/create_branch_api.dart';

class CreateBranchRepository {
  final CreateBranchApi _createBranchApi;
  CreateBranchRepository(this._createBranchApi);

  Future<String?> createBranch({
    required String createType,
    required String userGenealogyId,
    required String genealogyId,
  }) {
    return _createBranchApi.createBranch(
        createType: createType,
        genealogyId: genealogyId,
        userGenealogyId: userGenealogyId);
  }
}
