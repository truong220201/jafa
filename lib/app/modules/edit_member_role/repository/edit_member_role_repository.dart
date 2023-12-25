import '../api/edit_member_role_api.dart';

class EditMemberRoleRepository {
  final EditMemberRoleApi _editMemberRoleApi;

  EditMemberRoleRepository(this._editMemberRoleApi);

  Future<String?> changeRole({
    required int userGenealogyId,
    required int genealogyId,
    required int roleId,
  }) {
    try {
      return _editMemberRoleApi.changeRole(
          userGenealogyId: userGenealogyId,
          genealogyId: genealogyId,
          roleId: roleId);
    } catch (e) {
      rethrow;
    }
  }
}
