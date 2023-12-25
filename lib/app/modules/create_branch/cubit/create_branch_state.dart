import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_branch_state.freezed.dart';

@freezed
class CreateBranchState with _$CreateBranchState {
  const CreateBranchState._();
  const factory CreateBranchState({
    String? name,
    String? avatar,
    String? createType,
    int? userGenealogyId,
    int? genealogyId,
    int? roleId,
    String? message,
    @Default(false) bool saveDone,
    Object? error,
  }) = _CreateBranchState;
}
