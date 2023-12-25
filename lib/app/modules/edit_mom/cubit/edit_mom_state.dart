import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/model/user.dart';
part 'edit_mom_state.freezed.dart';

@freezed
class EditMomState with _$EditMomState {
  const EditMomState._();
  const factory EditMomState({
    List<User>? wifesOfDad,
    User? selectedMom,
    @Default(false) bool saveDone,
    Object? error,
  }) = _EditMomState;
}
