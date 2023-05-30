import 'package:freezed_annotation/freezed_annotation.dart';


part 'tree_create_state.freezed.dart';

@freezed
class TreeCreateState with _$TreeCreateState {
  const TreeCreateState._();
  const factory TreeCreateState({
    @Default('') String avatar,
    @Default('') String name,
    @Default('') String history,
    @Default('') String address,
    @Default('') String province,
    @Default('') String district,
    @Default('') String relationship,
    @Default(false) bool pass,
    Object? error,
  }) = _TreeCreateState;

}
