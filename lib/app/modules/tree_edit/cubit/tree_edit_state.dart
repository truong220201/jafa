import 'package:freezed_annotation/freezed_annotation.dart';

part 'tree_edit_state.freezed.dart';

@freezed
class TreeEditState with _$TreeEditState {
  const TreeEditState._();
  const factory TreeEditState({
    @Default('') String avatar,
    @Default('') String name,
    @Default('') String history,
    @Default('') String address,
    @Default('') String relationship,
    @Default(false) bool pass,
    Object? error,
  }) = _TreeEditState;
}
