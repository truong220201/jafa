import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/model/user.dart';
import '../repository/edit_couple_repository.dart';
import 'edit_couple_state.dart';

class EditCoupleCubit extends Cubit<EditCoupleState> {
  EditCoupleCubit(this._editCoupleRepository) : super(const EditCoupleState());

  final EditCoupleRepository _editCoupleRepository;

  void initData(List<User>? couples) {
    final couples0 = List<User>.from(couples ?? []);
    couples0.sort((a, b) {
      int numA =
          int.parse((a.relationType ?? "").replaceAll(RegExp(r'[^0-9]'), ''));
      int numB =
          int.parse((b.relationType ?? "").replaceAll(RegExp(r'[^0-9]'), ''));
      return numA.compareTo(numB);
    });

    emit(state.copyWith(couples: couples0));
  }

  void changeCouple(int oldIndex, int newIndex, List<User>? couples) {
    final couples0 = List<User>.from(couples ?? []);
    if (couples0.isNotEmpty) {
      final item = couples0.removeAt(oldIndex);
      couples0.insert(newIndex, item);
      emit(state.copyWith(couples: couples0));
    }
  }

  void saveData(int memberId, int genealogyId) {
    try {
      emit(state.copyWith(saveDone: false));
      final ids = (state.couples ?? []).map((e) => e.id ?? -1).toList();
      _editCoupleRepository.changeCouple(
          memberId: memberId, genealogyId: genealogyId, ids: ids.join(','));
      emit(state.copyWith(saveDone: true));
    } catch (e) {
      rethrow;
    }
  }
}
