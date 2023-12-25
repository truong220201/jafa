import 'package:flutter_bloc/flutter_bloc.dart';

import '../repository/edit_member_role_repository.dart';
import 'edit_member_role_state.dart';

class EditMemberRoleCubit extends Cubit<EditMemberRoleState> {
  EditMemberRoleCubit(this._editMemberRoleRepository)
      : super(const EditMemberRoleState());

  final EditMemberRoleRepository _editMemberRoleRepository;
  Future<void> changeRole(int userGenealogyId, int genealogyId) async {
    try {
      final response = await _editMemberRoleRepository.changeRole(
          userGenealogyId: userGenealogyId,
          genealogyId: genealogyId,
          roleId: state.roleId);
      print(response);
    } catch (e) {
      rethrow;
    }
  }

  void setRoleId(int roleId){
    emit(state.copyWith(roleId: roleId));
  }
}
