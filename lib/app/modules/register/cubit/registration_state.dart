import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/model/gender.dart';
import '../models/user_model.dart';

part 'registration_state.freezed.dart';

@freezed
class RegistrationState with _$RegistrationState {
  const RegistrationState._();
  const factory RegistrationState({
    @Default('') String phone,
    @Default(true) bool phonePass,
    @Default('') String confirmCode,
    @Default(true) bool confirmCodePass,
    String? avatar,
    @Default('') String name,
    @Default(Gender.woman)Gender gender,
    String? birthday,
    @Default('')  String fUid,
    String? verificationId,
    UserCredential? userCredential,
    @Default(true) bool checkOtp,
    @Default(false) bool expireOtp,
    @Default(false) bool hasUser,
    @Default(true) bool showHomePage,
    @Default(false) bool isLoading,
    UserModel? userModel,
    Object? error,
  }) = _RegistrationState;

}
