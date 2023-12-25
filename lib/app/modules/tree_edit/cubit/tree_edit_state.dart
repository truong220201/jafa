import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/model/province.dart';

part 'tree_edit_state.freezed.dart';

@freezed
class TreeEditState with _$TreeEditState {
  const TreeEditState._();
  const factory TreeEditState({
    @Default(0) int id,
    @Default('') String avatar,
    @Default('') String name,
    @Default('') String history,
    String? province,
    String? district,
    String? address,
    @Default('') String relationship,
    @Default(false) bool pass,
    List<Province>? provinces,
    Object? error,
    @Default(false) bool update,
    String? message,
  }) = _TreeEditState;
}
