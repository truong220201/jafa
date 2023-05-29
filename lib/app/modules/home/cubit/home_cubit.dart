import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:genealogy_management/app/data/model/user_model.dart';

import '../repository/home_repository.dart';
import '../repository/mock_home_repository.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(
    this._mockHomeRepository,
  ) : super(HomeState());

  //final HomeRepository _homeRepository;
  final MockHomeRepository _mockHomeRepository;
  bool _isLoading = false;
  checkHasUser() async {
    emit(state.copyWith(hasInfoJaFa: true));
  }

  void initData() {
    debugPrint('init' + state.toString());
    loadData();
    checkHasUser();
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
    List<UserModel> listModel = [];

    emit(state.copyWith(
      userList: [],
    ));
    debugPrint('state:+++++++++++' + state.toString());
    try {
      final userListReponse = await _mockHomeRepository.getUserModel();
      emit(state.copyWith(userList: List.of(userListReponse)));
    } catch (e) {
      emit(state.copyWith(showUserListError: e));
    }
  }
}
