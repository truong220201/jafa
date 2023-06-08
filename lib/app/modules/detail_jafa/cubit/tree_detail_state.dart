import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/model/tree_detail_model.dart';

part 'tree_detail_state.freezed.dart';

@freezed
class TreeDetailState with _$TreeDetailState {
  const TreeDetailState._();

  const factory TreeDetailState({
    Object? showUserListError,
    bool? hasInfoJaFa,
    bool? showModal,
    bool? showInviteFriends,
    @Default(TreeDetailModel()) TreeDetailModel treeDetail,
    int? countDown,
    bool? startCountDownLeftJafa,
    bool? startCountDownDeleteJafa,
    @Default('') String statusLeftJafa,
    @Default('') String statusDeleteJafa,
  }) = _TreeDetailState;
}
