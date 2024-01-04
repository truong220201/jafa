import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/model/province.dart';

part 'tree_create_state.freezed.dart';

@freezed
class TreeCreateState with _$TreeCreateState {
  const TreeCreateState._();
  const factory TreeCreateState({
    String? avatar,
    @Default('') String name,
    String? history,
    String? address,
    String? relationship,
    List<Province>? provinces,
    @Default(false) bool pass,
    Object? error,
  }) = _TreeCreateState;
}
