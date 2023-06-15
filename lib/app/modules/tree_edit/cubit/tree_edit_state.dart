import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/values/province_info.dart';

part 'tree_edit_state.freezed.dart';

@freezed
class TreeEditState with _$TreeEditState {
  const TreeEditState._();
  const factory TreeEditState({
    @Default('') String avatar,
    @Default('') String name,
    @Default('') String history,
    int? province,
    int? district,
    @Default('') String relationship,
    @Default(false) bool pass,
    List<Province>? provinces,
    Object? error,
  }) = _TreeEditState;
}
