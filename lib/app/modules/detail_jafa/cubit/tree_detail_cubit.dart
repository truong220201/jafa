import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:genealogy_management/app/data/model/tree_detail_model.dart';

import '../repository/mock_tree_detail_repository.dart';
import 'tree_detail_state.dart';

class TreeDetailCubit extends Cubit<TreeDetailState> {
  TreeDetailCubit(
    this._mockTreeDetailRepository,
  ) : super(TreeDetailState());

  //final TreeDetailRepository _TreeDetailRepository;
  final MockTreeDetailRepository _mockTreeDetailRepository;
  bool _isLoading = false;
  checkHasData() async {
    emit(state.copyWith(hasInfoJaFa: true));
  }

  void changeModal() {
    if (state.showInviteFriends == true) {
      emit(state.copyWith(showInviteFriends: false));
    }
    emit(state.copyWith(showModal: !state.showModal));
  }

  void changeShowInviteFriends() {
    if (state.showModal == true) {
      emit(state.copyWith(showModal: false));
    }
    emit(state.copyWith(showInviteFriends: !state.showInviteFriends));
  }

  void initData() {
    loadData();
    checkHasData();
    debugPrint('state: ' + state.toString());
  }

  Future<void> loadData() async {
    if (_isLoading) {
      return;
    }
    _isLoading = true;
    try {
      debugPrint('loadata' + state.toString());
      await Future.wait<void>([
        loadDataJaFa(),
      ]);

      _isLoading = false;
    } catch (e) {
      _isLoading = false;
    }
  }

  Future<void> loadDataJaFa() async {
    emit(state.copyWith(treeDetail: TreeDetailModel()));
    debugPrint('state:+++++++++++' + state.toString());
    try {
      final treeDetailReponse =
          await _mockTreeDetailRepository.getTreeDetailModel();
      emit(state.copyWith(treeDetail: treeDetailReponse));
    } catch (e) {
      emit(state.copyWith(showUserListError: e));
    }
  }
}
