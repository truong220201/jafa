import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:genealogy_management/app/network/exceptions/bad_request_exception.dart';

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
        userGenealogyId: state.userGenealogyId ?? -1,
        genealogyId: state.genealogyId ?? -1,
      );
      emit(state.copyWith(saveDone: true));
    } catch (e) {
      if (e is BadRequestException) {
        emit(state.copyWith(message: e.message, saveDone: true));
        return;
      }
      rethrow;
    }
  }

  void initData(
      {required int userGenealogyId,
      required int genealogyId,
      required int roleId,
      String? name,
      String? avatar}) {
    emit(state.copyWith(
        genealogyId: genealogyId,
        userGenealogyId: userGenealogyId,
        roleId: roleId,
        name: name,
        avatar: avatar));
  }
}
