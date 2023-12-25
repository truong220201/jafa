import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/model/user.dart';
part 'edit_relasionship_state.freezed.dart';

@freezed
class EditRelationShipState with _$EditRelationShipState {
  const EditRelationShipState._();
  const factory EditRelationShipState({
    User? dad,
    List<User>? wifesOfDad,
    User? mainWife,
    List<User>? siblings,
    List<User>? couple,
    List<User>? children,
    List<User>? others,
    int? selectedId,
    @Default(false) bool initDone,
    @Default(false) bool saveDone,
    Object? error,
  }) = _EditRelationShipState;
}
