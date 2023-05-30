import 'package:freezed_annotation/freezed_annotation.dart';

import '../models/user_model.dart';

part 'registration_state.freezed.dart';

@freezed
class RegistrationState with _$RegistrationState {
  const RegistrationState._();
  const factory RegistrationState({
    @Default('') String phone,
    @Default(false) bool phonePass,
    @Default('') String confirmCode,
    @Default(false) bool confirmCodePass,
    @Default('') String avatar,
    @Default('') String name,
    @Default('') String gender,
    @Default('') String birthday,
    @Default(false) bool showHomePage,
    // @Default(false) bool showImageLoading,
    UserModel? userModel,
    // List<String>? imageList,
    Object? error,
  }) = _RegistrationState;

}
