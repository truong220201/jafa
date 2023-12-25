import 'package:freezed_annotation/freezed_annotation.dart';

part 'edit_member_role_state.freezed.dart';

@freezed
class EditMemberRoleState with _$EditMemberRoleState {
  const EditMemberRoleState._();
  const factory EditMemberRoleState({
    @Default(1) int roleId,
    @Default(false) bool saveDone,
    Object? error,
  }) = _EditMemberRoleState;
}
