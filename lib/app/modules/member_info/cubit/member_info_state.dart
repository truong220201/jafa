import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:genealogy_management/app/data/model/member_info_model.dart';

import '../../../data/model/jafa_model.dart';

part 'member_info_state.freezed.dart';

@freezed
class MemberInfoState with _$MemberInfoState {
  const MemberInfoState._();

  const factory MemberInfoState({
    Object? showUserListError,
    MemberInfoModel? memberInfo,
    @Default(false) bool isLoading,
    @Default(true) bool showSeeBranch,
    @Default(false) bool showChooseBranch,
    @Default(false) bool showModal,
    @Default(false) bool showModalmenu,
    bool? isAdmin,
  }) = _MemberInfoState;
}
