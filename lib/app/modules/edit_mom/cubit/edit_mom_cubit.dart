import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/model/user.dart';
import '../repository/edit_mom_repository.dart';
import 'edit_mom_state.dart';

class EditMomCubit extends Cubit<EditMomState> {
  EditMomCubit(this._editMomRepository) : super(const EditMomState());

  final EditMomRepository _editMomRepository;

  void initData(List<User>? wifesOfDad) {
    emit(state.copyWith(wifesOfDad: wifesOfDad));
    if (wifesOfDad != null && wifesOfDad.isNotEmpty) {
      for (var item in wifesOfDad) {
        if (item.isMom ?? false) {
          emit(state.copyWith(selectedMom: item));
          return;
        }
      }
    }
  }

  void setMom(User user) {
    emit(state.copyWith(selectedMom: user));
  }

  Future<void> saveData(int userGenealogyId, int genealogyId) async {
    try {
      emit(state.copyWith(saveDone: false));
      final response = await _editMomRepository.changeMom(
          userGenealogyId: userGenealogyId, genealogyId: genealogyId);
      emit(state.copyWith(saveDone: true));
      print(response);
    } catch (e) {
      rethrow;
    }
  }
}
