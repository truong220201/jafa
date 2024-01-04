import 'package:flutter_firebase/app/data/model/tree.dart';
import 'package:flutter_firebase/app/data/model/tree_view_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_branch_state.freezed.dart';

@freezed
class CreateBranchState with _$CreateBranchState {
  const CreateBranchState._();
  const factory CreateBranchState({
    String? name,
    String? avatar,
    String? createType,
    String? userGenealogyId,
    String? genealogyId,
    int? roleId,
    String? message,
    @Default(TreeViewModel()) TreeViewModel user,
    @Default(false) bool saveDone,
    Object? error,
  }) = _CreateBranchState;
}
