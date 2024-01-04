import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase/app/data/model/tree_view_model.dart';
import 'package:flutter_firebase/app/data/model/user.dart';

import '../repository/create_branch_repository.dart';
import 'create_branch_state.dart';

class CreateBranchCubit extends Cubit<CreateBranchState> {
  CreateBranchCubit(this._createBranchRepository)
      : super(const CreateBranchState());

  final CreateBranchRepository _createBranchRepository;

  void createBranch({required String createType}) async {
    try {
      emit(state.copyWith(saveDone: false, message: null));
      await _createBranchRepository.createBranch(
        createType: createType,
        userGenealogyId: state.userGenealogyId ?? '',
        genealogyId: state.genealogyId ?? '',
      );
      emit(state.copyWith(saveDone: true));
    } catch (e) {
      // rethrow;
    }
  }

  void initData(
      {required String userGenealogyId,
      required String genealogyId,
      required int roleId,
      required TreeViewModel user,
      String? name,
      String? avatar}) {
    emit(state.copyWith(
        user: user,
        genealogyId: genealogyId,
        userGenealogyId: userGenealogyId,
        roleId: roleId,
        name: name,
        avatar: avatar));
  }
}
