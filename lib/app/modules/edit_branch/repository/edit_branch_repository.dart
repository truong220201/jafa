import '../../../data/model/user.dart';
import '../api/edit_branch_api.dart';

class EditBranchRepository {
  final EditBranchApi _editBranchApi;
  EditBranchRepository(this._editBranchApi);

  Future<String?> editBranch({
    required int userGenealogyId,
    required int genealogyId,
    String? avatar,
    String? role,
    required String name,
    String? otherName,
    String? job,
    int? gender,
    DateTime? birthday,
    bool? alive,
    DateTime? death,
    String? graves,
    String? worship,
  }) {
    try {
      return _editBranchApi.editBranch(
        genealogyId: genealogyId,
        userGenealogyId: userGenealogyId,
        avatar: avatar,
        role: role,
        name: name,
        otherName: otherName,
        gender: gender,
        job: job,
        birthday: birthday,
        alive: alive,
        death: death,
        graves: graves,
        worship: worship,
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<User?> getBranch({
    required int userGenealogyId,
    required int genealogyId,
  }) {
    try {
      return _editBranchApi.getBranch(
        genealogyId: genealogyId,
        userGenealogyId: userGenealogyId,
      );
    } catch (e) {
      rethrow;
    }
  }
}
