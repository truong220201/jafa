import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/model/jafa_model.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const HomeState._();

  const factory HomeState({
    Object? showUserListError,
    @Default([]) List<JafaModel> userList,
    @Default(false) bool isLoading,
  }) = _HomeState;
}
