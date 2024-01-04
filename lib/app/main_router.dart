import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_firebase/app/app_routers.dart';
import 'package:flutter_firebase/app/data/model/tree_view_model.dart';
import 'package:flutter_firebase/app/modules/create_branch/view/create_branch_view.dart';
import 'package:flutter_firebase/app/modules/detail_jafa/views/tree_detail_view.dart';
import 'package:flutter_firebase/app/modules/edit_branch/view/edit_branch_view.dart';
import 'package:flutter_firebase/app/modules/edit_branch_no_info/view/edit_branch_no_info_view.dart';
import 'package:flutter_firebase/app/modules/home/views/home_default_view.dart';
import 'package:flutter_firebase/app/modules/select_member_to_branch/view/select_member_to_branch_view.dart';
import 'package:flutter_firebase/app/modules/tree_create/view/tree_create_view.dart';
import 'package:flutter_firebase/app/modules/tree_view/view/tree_view.dart';
part 'main_router.gr.dart';

@MaterialAutoRouter(routes: <AutoRoute>[
  MaterialRoute(page: HomeView, path: Routes.home, initial: true),
  MaterialRoute(
    page: TreeDetailView,
    path: Routes.treeDetail,
  ),
  MaterialRoute(
    page: TreeCreateView,
    path: Routes.createTree,
  ),
  MaterialRoute(
    page: TreeView,
    path: Routes.treeView,
  ),
  MaterialRoute(page: EditBranchView, path: Routes.editBranch),
  MaterialRoute(page: EditBranchNoInfoView),
  MaterialRoute(
      page: SelectMemberToBranchView, path: Routes.selectMemberToBranch),
  MaterialRoute(page: CreateBranchView, path: Routes.createBranch),
])
class MainRouter extends _$MainRouter {
  MainRouter({
    GlobalKey<NavigatorState>? navigatorKey,
  }) : super(navigatorKey);
}
