import 'package:flutter_bloc/flutter_bloc.dart';

import '../repository/edit_relasionship_repository.dart';
import 'edit_relasionship_state.dart';

class EditRelationShipCubit extends Cubit<EditRelationShipState> {
  EditRelationShipCubit(this._editRelationShipRepository)
      : super(const EditRelationShipState());

  final EditRelationShipRepository _editRelationShipRepository;

  Future<void> getAllRelasionship({
    required int genealogyId,
    required int memberId,
  }) async {
    try {
      emit(state.copyWith(initDone: false));
      final allRelation = await _editRelationShipRepository.getAllRelasionship(
          genealogyId: genealogyId, memberId: memberId);
      final couples = allRelation.couple;
      if (couples != null) {
        couples.sort((a, b) {
          int numA = int.parse(
              (a.relationType ?? "").replaceAll(RegExp(r'[^0-9]'), ''));
          int numB = int.parse(
              (b.relationType ?? "").replaceAll(RegExp(r'[^0-9]'), ''));
          return numA.compareTo(numB);
        });
      }
      emit(state.copyWith(
        dad: allRelation.dad,
        wifesOfDad: allRelation.wivesOfDad,
        children: allRelation.children,
        couple: couples,
        siblings: allRelation.siblings,
        others: allRelation.others,
        initDone: true,
      ));
      if (allRelation.wivesOfDad != null &&
          allRelation.wivesOfDad!.isNotEmpty) {
        for (var item in allRelation.wivesOfDad!) {
          if (item.isMom ?? false) {
            emit(state.copyWith(mainWife: item));
            return;
          }
        }
      }
    } catch (e) {
      if (e is FormatException) {
        return;
      }
      rethrow;
    }
  }

  void createBranch(
      {required String createType,
      required int genealogyId,
      required int memberId}) async {
    try {
      emit(state.copyWith(saveDone: false));
      final selectedId = await _editRelationShipRepository.createBranch(
        createType: createType,
        userGenealogyId: memberId,
        genealogyId: genealogyId,
      );
      emit(state.copyWith(saveDone: true, selectedId: selectedId));
    } catch (e) {
      rethrow;
    }
  }
}
