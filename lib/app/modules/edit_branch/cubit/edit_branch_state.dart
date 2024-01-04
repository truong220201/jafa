import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/model/gender.dart';

part 'edit_branch_state.freezed.dart';

@freezed
class EditBranchState with _$EditBranchState {
  const EditBranchState._();
  const factory EditBranchState({
    String? avatar,
    String? role,
    @Default('') String name,
    String? otherName,
    String? job,
    @Default(Gender.man) Gender gender,
    String? birthday,
    @Default(true) bool isAlive,
    String? death,
    String? worship,
    String? graves,
    @Default(false) bool pass,
    @Default(true) bool relationship,
    @Default(false) bool initDone,
    @Default(false) bool saveDone,
    Object? error,
  }) = _EditBranchState;
}
