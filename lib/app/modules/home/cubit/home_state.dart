import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/model/user_model.dart';


part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const HomeState._();

  const factory HomeState({
    Object? showUserListError,
    @Default(false) bool hasInfoJaFa,
    @Default([]) List<UserModel> userList,
  }) = _HomeState;
}
