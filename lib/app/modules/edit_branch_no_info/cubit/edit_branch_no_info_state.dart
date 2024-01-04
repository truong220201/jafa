import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/model/gender.dart';

part 'edit_branch_no_info_state.freezed.dart';

@freezed
class EditBranchNoInfoState with _$EditBranchNoInfoState {
  const EditBranchNoInfoState._();
  const factory EditBranchNoInfoState({
    String? avatar,
    String? role,
    @Default('') String name,
    String? otherName,
    String? job,
    @Default(Gender.man)Gender gender,
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
  }) = _EditBranchNoInfoState;
}

