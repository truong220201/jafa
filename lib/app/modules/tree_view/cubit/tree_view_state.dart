import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:graphview/GraphView.dart';
import '../../../data/model/tree_view_model.dart';

part 'tree_view_state.freezed.dart';

@freezed
class TreeViewState with _$TreeViewState {
  const TreeViewState._();

  const factory TreeViewState({
    Object? showUserListError,
    List<TreeViewModel>? treeViewModel,
    @Default(false) bool isLoading,
    @Default(false) bool hasData,
    @Default(false) bool showModal,
    @Default(false) bool showSearch,
    @Default(true) bool aloneUser,
    List<Node>? arrTree,
    List<Couple>? arrCouple,
    String? messageTreeRequest,
    @Default(false) bool requestDone,
    List<TreeViewModel>? listName,
    Object? error,
    Node? userPosition,
    Offset? searchPosition,
    List<UserNode>? nodeList,
  }) = _TreeViewState;
}

@freezed
class UserNode with _$UserNode {
  const UserNode._();

  const factory UserNode({
    Offset? userPosition,
    String? userId,
  }) = _UserNode;
}
