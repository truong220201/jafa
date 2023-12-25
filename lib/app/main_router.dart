import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:genealogy_management/app/data/model/user.dart';
import 'package:genealogy_management/app/modules/member_list/view/member_list_view.dart';
import 'package:genealogy_management/app/modules/tree_by_list/view/tree_by_list_view.dart';
import 'package:genealogy_management/app/modules/tree_view/view/tree_view.dart';
import 'app_routes.dart';
import 'auto_route_guards.dart';
// import 'data/model/user.dart';
import 'modules/create_branch/view/create_branch_view.dart';
import 'modules/detail_jafa/views/tree_detail_view.dart';
import 'modules/edit_branch/view/edit_branch_view.dart';
import 'modules/edit_branch_no_info/view/edit_branch_no_info_view.dart';
import 'modules/edit_couple/view/edit_couple_view.dart';
import 'modules/edit_member_role/view/edit_member_role_view.dart';
import 'modules/edit_mom/view/edit_mom_view.dart';
import 'modules/edit_relasionship/view/edit_relasionship_view.dart';
import 'modules/edit_user_info/views/edit_user_info_view.dart';
import 'modules/home/views/home_default_view.dart';
import 'modules/member_info/views/member_info_view.dart';
import 'modules/register/cubit/registration_cubit.dart';
import 'modules/register/views/home/registration_info_view.dart';
import 'modules/register/views/login/confirm_view.dart';
import 'modules/register/views/login/registration_phone_view.dart';
import 'modules/register/views/login/welcome_view.dart';
import 'modules/scan_QR/scan_qr_view.dart';
import 'modules/select_member_to_branch/view/select_member_to_branch_view.dart';
import 'modules/tree_create/view/tree_create_view.dart';
import 'modules/tree_edit/view/tree_edit_view.dart';
import 'modules/user_info/view/user_detail_view.dart';
import 'modules/user_info/view/user_info_view.dart';
part 'main_router.gr.dart';

@MaterialAutoRouter(routes: <AutoRoute>[
  MaterialRoute(page: ConfirmView, path: Routes.confirm),
  MaterialRoute(page: RegisterInfoView, path: Routes.register),
  MaterialRoute(page: RegisterPhoneView, path: Routes.phone),
  MaterialRoute(
    page: HomeView,
    path: Routes.home,
    initial: true,
    // guards: [AuthGuard],
  ),
  MaterialRoute(page: TreeCreateView, path: Routes.createTree),
  MaterialRoute(page: TreeDetailView, path: Routes.treeDetail),
  MaterialRoute(page: TreeEditView, path: Routes.treeDetail),
  MaterialRoute(page: ScanQRView, path: Routes.scanQR),
  MaterialRoute(page: TreeView, path: Routes.treeView),
  MaterialRoute(page: MemberListView, path: Routes.memberList),
  MaterialRoute(page: MemberInfoView, path: Routes.memberInfo),
  MaterialRoute(page: EditBranchView, path: Routes.editBranch),
  MaterialRoute(page: CreateBranchView, path: Routes.createBranch),
  MaterialRoute(page: EditRelationShipView),
  MaterialRoute(page: EditBranchNoInfoView),
  MaterialRoute(page: UserInfoView),
  MaterialRoute(page: EditMomView),
  MaterialRoute(page: EditCoupleView),
  MaterialRoute(page: EditMemberRoleView),
  MaterialRoute(page: UserDetailView),
  MaterialRoute(page: EditUserInfoView),
  MaterialRoute(page: WelcomeView, path: Routes.welcome),
  MaterialRoute(
      page: SelectMemberToBranchView, path: Routes.selectMemberToBranch),
  MaterialRoute(page: TreeByListView, path: Routes.treeByList),
])
class MainRouter extends _$MainRouter {
  MainRouter({
    GlobalKey<NavigatorState>? navigatorKey,
  }) : super(navigatorKey);
}
