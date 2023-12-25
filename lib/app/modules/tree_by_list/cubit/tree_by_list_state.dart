import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/model/province.dart';
import '../../../data/model/time_line_model.dart';

part 'tree_by_list_state.freezed.dart';

@freezed
class TreeByListState with _$TreeByListState {
  const TreeByListState._();
  const factory TreeByListState({
    int? idJafa,
    List<TimeLine>? timeLine,
    Object? error,
    @Default(false) bool isLoading,
  }) = _TreeByListState;
}
