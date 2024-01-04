import 'package:flutter_firebase/app/data/model/member_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'select_member_to_branch_state.freezed.dart';

@freezed
class SelectMemberToBranchState with _$SelectMemberToBranchState {
  const SelectMemberToBranchState._();

  const factory SelectMemberToBranchState({
    Object? showUserListError,
    @Default([]) List<MemberModel> allUser,
    @Default(false) bool showInviteFriends,
    @Default(false) bool isLoading,
    int? idMemberChoose,
    int? indexChoose,
    String? showContentJoinSuccess,
  }) = _SelectMemberToBranchState;
}
