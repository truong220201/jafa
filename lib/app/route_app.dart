import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:genealogy_management/app/modules/detail_jafa/api/tree_detail_api.dart';
import 'package:genealogy_management/app/modules/home/repository/home_repository.dart';
import 'package:genealogy_management/app/modules/member_info/api/member_info_api.dart';
import 'package:genealogy_management/app/modules/member_info/repository/member_info_repository.dart';
import 'package:genealogy_management/app/modules/member_list/api/member_list_api.dart';
import 'package:genealogy_management/app/modules/member_list/repository/member_list_repository.dart';
import 'package:genealogy_management/app/modules/register/repository/registration_repository.dart';
import 'package:genealogy_management/app/modules/select_member_to_branch/api/select_member_to_branch_api.dart';
import 'package:genealogy_management/app/modules/select_member_to_branch/repository/select_member_to_branch_repository.dart';
import 'package:genealogy_management/app/modules/tree_by_list/api/tree_by_list_api.dart';
import 'package:genealogy_management/app/modules/tree_by_list/repository/tree_by_list_repository.dart';
import 'package:genealogy_management/app/modules/tree_edit/api/tree_edit_api.dart';
import 'package:genealogy_management/app/modules/tree_view/api/tree_detail_api.dart';
import 'package:genealogy_management/app/modules/tree_view/repository/tree_view_repository.dart';
import 'core/values/app_theme.dart';
import 'main_router.dart';
import 'modules/create_branch/api/create_branch_api.dart';
import 'modules/create_branch/repository/create_branch_repository.dart';
import 'modules/detail_jafa/repository/tree_detail_repository.dart';
import 'modules/edit_branch/api/edit_branch_api.dart';
import 'modules/edit_branch/repository/edit_branch_repository.dart';
import 'modules/edit_branch_no_info/api/edit_branch_no_info_api.dart';
import 'modules/edit_branch_no_info/repository/edit_branch_no_info_repository.dart';
import 'modules/edit_couple/api/edit_couple_api.dart';
import 'modules/edit_couple/repository/edit_couple_repository.dart';
import 'modules/edit_member_role/api/edit_member_role_api.dart';
import 'modules/edit_member_role/repository/edit_member_role_repository.dart';
import 'modules/edit_mom/api/edit_mom_api.dart';
import 'modules/edit_mom/repository/edit_mom_repository.dart';
import 'modules/edit_relasionship/api/edit_relasionship_api.dart';
import 'modules/edit_relasionship/repository/edit_relasionship_repository.dart';
import 'modules/edit_user_info/api/edit_user_info_api.dart';
import 'modules/edit_user_info/repository/edit_user_info_repository.dart';
import 'modules/home/api/home_api.dart';
import 'modules/register/api/login_api.dart';
import 'modules/register/api/register_api.dart';
import 'modules/tree_create/api/tree_create_api.dart';
import 'modules/tree_create/repository/tree_create_repository.dart';
import 'modules/tree_edit/repository/tree_edit_repository.dart';
import 'modules/user_info/api/user_info_api.dart';
import 'modules/user_info/repository/user_info_repository.dart';

final navigatorKey = GlobalKey<NavigatorState>();

class RouteApp extends StatefulWidget {
  const RouteApp({super.key});

  @override
  State<RouteApp> createState() => _RouteAppState();
}

class _RouteAppState extends State<RouteApp> {
  @override
  void initState() {
    super.initState();
    _appRouter = MainRouter(
      // authGuard: AuthGuard(),
      navigatorKey: navigatorKey,
    );
  }

  late MainRouter _appRouter;
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<HomeRepository>(
          create: (context) => HomeRepository(HomeApi()),
        ),
        RepositoryProvider<TreeDetailRepository>(
          create: (context) => TreeDetailRepository(TreeDetailApi()),
        ),
        RepositoryProvider<TreeViewRepository>(
          create: (context) => TreeViewRepository(TreeViewApi()),
        ),
        RepositoryProvider(
          create: (context) =>
              RegistrationRepository(LoginApi(), RegisterApi()),
        ),
        RepositoryProvider(
          create: (context) => TreeCreateRepository(TreeCreateApi()),
        ),
        RepositoryProvider(
          create: (context) => TreeEditRepository(TreeEditApi()),
        ),
        RepositoryProvider(
          create: (context) => MemberListRepository(MemberListApi()),
        ),
        RepositoryProvider(
          create: (context) => MemberInfoRepository(MemberInfoApi()),
        ),
        RepositoryProvider<UserInfoRepository>(
          create: (context) => UserInfoRepository(UserInfoApi()),
        ),
        RepositoryProvider<EditMomRepository>(
          create: (context) => EditMomRepository(EditMomApi()),
        ),
        RepositoryProvider<EditCoupleRepository>(
          create: (context) => EditCoupleRepository(EditCoupleApi()),
        ),
        RepositoryProvider<EditMemberRoleRepository>(
          create: (context) => EditMemberRoleRepository(EditMemberRoleApi()),
        ),
        RepositoryProvider<EditUserInfoRepository>(
          create: (context) => EditUserInfoRepository(EditUserInfoApi()),
        ),
        RepositoryProvider<EditBranchRepository>(
          create: (context) => EditBranchRepository(EditBranchApi()),
        ),
        RepositoryProvider<EditBranchNoInfoRepository>(
          create: (context) =>
              EditBranchNoInfoRepository(EditBranchNoInfoApi()),
        ),
        RepositoryProvider<EditRelationShipRepository>(
          create: (context) =>
              EditRelationShipRepository(EditRelationShipApi()),
        ),
        RepositoryProvider<CreateBranchRepository>(
          create: (context) => CreateBranchRepository(CreateBranchApi()),
        ),
        RepositoryProvider<SelectMemberToBranchRepository>(
          create: (context) =>
              SelectMemberToBranchRepository(SelectMemberToBranchApi()),
        ),
        RepositoryProvider<TreeByListRepository>(
          create: (context) => TreeByListRepository(TreeByListApi()),
        ),
      ],
      child: MaterialApp.router(
        routeInformationParser: _appRouter.defaultRouteParser(),
        routerDelegate: _appRouter.delegate(
          navigatorObservers: () => [
            AutoRouteObserver(),
          ],
        ),
        theme: appTheme,
        localizationsDelegates: const [],
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
