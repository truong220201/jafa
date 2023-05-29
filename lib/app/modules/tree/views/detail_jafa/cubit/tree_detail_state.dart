import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../data/model/tree_detail_model.dart';
part 'tree_detail_state.freezed.dart';

@freezed
class TreeDetailState with _$TreeDetailState {
  const TreeDetailState._();

  const factory TreeDetailState({
    Object? showUserListError,
    @Default(false) bool hasInfoJaFa,
    @Default(false) bool showModal,
    @Default(false) bool showInviteFriends,
    @Default(TreeDetailModel()) TreeDetailModel treeDetail,
  }) = _TreeDetailState;
}
