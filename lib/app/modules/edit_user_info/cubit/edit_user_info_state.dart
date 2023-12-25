import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/model/gender.dart';
import '../../../data/model/user.dart';

part 'edit_user_info_state.freezed.dart';

@freezed
class EditUserInfoState with _$EditUserInfoState {
  const EditUserInfoState._();
  const factory EditUserInfoState({
    User? user,
    String? avatar,
    @Default('') String name,
    String? otherName,String? phone,
    String? job,
    @Default(Gender.woman)Gender gender,
    String? birthday,
    String? email,
    @Default(false) bool validateDone,
    @Default(false) bool initDone,
    @Default(false) bool saveDone,
    Object? error,
  }) = _EditUserInfoState;

}
