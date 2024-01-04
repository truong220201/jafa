import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase/app/core/values/app_colors.dart';
import 'package:flutter_firebase/app/modules/create_branch/api/create_branch_api.dart';
import 'package:flutter_firebase/app/modules/create_branch/repository/create_branch_repository.dart';
import 'package:flutter_firebase/app/modules/detail_jafa/api/tree_detail_api.dart';
import 'package:flutter_firebase/app/modules/detail_jafa/repository/tree_detail_repository.dart';
import 'package:flutter_firebase/app/modules/edit_branch/api/edit_branch_api.dart';
import 'package:flutter_firebase/app/modules/edit_branch/repository/edit_branch_repository.dart';
import 'package:flutter_firebase/app/modules/edit_branch/view/edit_branch_view.dart';
import 'package:flutter_firebase/app/modules/edit_branch_no_info/api/edit_branch_no_info_api.dart';
import 'package:flutter_firebase/app/modules/edit_branch_no_info/repository/edit_branch_no_info_repository.dart';
import 'package:flutter_firebase/app/modules/home/api/home_api.dart';
import 'package:flutter_firebase/app/modules/home/cubit/home_cubit.dart';
import 'package:flutter_firebase/app/modules/home/repository/home_repository.dart';
import 'package:flutter_firebase/app/modules/select_member_to_branch/api/select_member_to_branch_api.dart';
import 'package:flutter_firebase/app/modules/select_member_to_branch/repository/select_member_to_branch_repository.dart';
import 'package:flutter_firebase/app/modules/select_member_to_branch/view/select_member_to_branch_view.dart';
import 'package:flutter_firebase/app/modules/tree_create/api/tree_create_api.dart';
import 'package:flutter_firebase/app/modules/tree_create/repository/tree_create_repository.dart';
import 'package:flutter_firebase/app/modules/tree_view/api/tree_detail_api.dart';
import 'package:flutter_firebase/app/modules/tree_view/repository/tree_view_repository.dart';
import 'main_router.dart';

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
        RepositoryProvider(
          create: (context) => TreeCreateRepository(TreeCreateApi()),
        ),
        RepositoryProvider<TreeViewRepository>(
          create: (context) => TreeViewRepository(TreeViewApi()),
        ),
        RepositoryProvider<EditBranchRepository>(
          create: (context) => EditBranchRepository(EditBranchApi()),
        ),
        RepositoryProvider<EditBranchNoInfoRepository>(
          create: (context) =>
              EditBranchNoInfoRepository(EditBranchNoInfoApi()),
        ),
        RepositoryProvider<SelectMemberToBranchRepository>(
          create: (context) =>
              SelectMemberToBranchRepository(SelectMemberToBranchApi()),
        ),
        RepositoryProvider<CreateBranchRepository>(
          create: (context) => CreateBranchRepository(CreateBranchApi()),
        ),
        RepositoryProvider<HomeCubit>(
          create: (context) => HomeCubit(HomeRepository(
              HomeApi())), // Thay HomeCubit() bằng constructor hoặc initializer của Cubit của bạn
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

final appTheme = ThemeData(
  primarySwatch: AppColors.colorPrimarySwatch,
  appBarTheme: const AppBarTheme(backgroundColor: AppColors.c359EC7_primary),
  visualDensity: VisualDensity.adaptivePlatformDensity,
  brightness: Brightness.light,
  primaryColor: AppColors.c359EC7_primary,
  colorScheme: const ColorScheme.light(
    background: AppColors.cFFFFFF_surface,
    surface: AppColors.cFFFFFF_surface,
  ),
  dividerColor: AppColors.cE4E4E4_divider,
  dialogTheme: const DialogTheme(
    shape: BeveledRectangleBorder(),
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    sizeConstraints: BoxConstraints.tight(const Size(70, 70)),
  ),
);
