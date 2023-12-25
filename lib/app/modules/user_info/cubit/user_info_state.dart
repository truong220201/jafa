import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/model/user.dart';

part 'user_info_state.freezed.dart';


@freezed
class UserInfoState with _$UserInfoState {
  const UserInfoState._();
  const factory UserInfoState({
    User? user,
    @Default(false) bool initDone,
    @Default(false) bool pass,
    Object? error,
  }) = _UserInfoState;

}
