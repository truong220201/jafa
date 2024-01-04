import '../../../data/model/user.dart';
import '../api/edit_branch_no_info_api.dart';

class EditBranchNoInfoRepository {
  final EditBranchNoInfoApi _editBranchNoInfoApi;
  EditBranchNoInfoRepository(this._editBranchNoInfoApi);

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
      return _editBranchNoInfoApi.editBranch(
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
      return _editBranchNoInfoApi.getBranch(
        genealogyId: genealogyId,
        userGenealogyId: userGenealogyId,
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<String?> treeRequest({
    required int userGenealogyId,
    required int genealogyId,
  }) {
    try {
      return _editBranchNoInfoApi.treeRequest(
        userGenealogyId: userGenealogyId,
        genealogyId: genealogyId,
      );
    } catch (e) {
      rethrow;
    }
  }
}
