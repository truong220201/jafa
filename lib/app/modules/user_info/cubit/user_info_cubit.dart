import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:genealogy_management/app/modules/user_info/cubit/user_info_state.dart';

import '../repository/user_info_repository.dart';

class UserInfoCubit extends Cubit<UserInfoState> {
  UserInfoCubit(this._userInfoRepository) : super(const UserInfoState());

  final UserInfoRepository _userInfoRepository;

  void logout() async {
    try {
      emit(state.copyWith(pass: false));
      final response = await _userInfoRepository.logout();
      if (response != null) {
        emit(state.copyWith(pass: true));
      }
    } catch (e) {
      emit(state.copyWith(error: e));
      rethrow;
    }
  }

  Future<void> getInfo() async {
    try {
      emit(state.copyWith(initDone: false));
      final user = await _userInfoRepository.getUserInfo();
      emit(state.copyWith(user: user, initDone: true));
    } catch (e) {
      rethrow;
    }
  }
}
