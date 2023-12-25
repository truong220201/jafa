import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/model/user.dart';
part 'edit_couple_state.freezed.dart';

@freezed
class EditCoupleState with _$EditCoupleState {
  const EditCoupleState._();
  const factory EditCoupleState({
    List<User>? couples,
    @Default(false) bool saveDone,
    Object? error,
  }) = _EditCoupleState;
}
