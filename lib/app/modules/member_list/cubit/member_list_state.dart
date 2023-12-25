import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:genealogy_management/app/data/model/member_model.dart';

part 'member_list_state.freezed.dart';

@freezed
class MemberListState with _$MemberListState {
  const MemberListState._();

  const factory MemberListState({
    Object? showUserListError,
    @Default([]) List<MemberModel> allUser,
    @Default([]) List<MemberModel> adminlist,
    @Default(false) bool? showInviteFriends,
    @Default([]) List<MemberModel> memberJafaList,
    @Default([]) List<MemberModel> userViewlist,
    @Default([]) List<MemberModel> searchList,
    int? idJafa,
    @Default(false) bool isLoading,
  }) = _MemberListState;
}
