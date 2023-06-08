import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:genealogy_management/app/modules/detail_jafa/api/tree_detail_api.dart';
import 'package:genealogy_management/app/modules/home/repository/home_repository.dart';
import 'package:genealogy_management/app/modules/register/repository/registration_repository.dart';
import 'core/values/app_theme.dart';
import 'main_router.dart';
import 'modules/detail_jafa/repository/tree_detail_repository.dart';
import 'modules/home/api/home_api.dart';
import 'modules/tree_create/repository/tree_create_repository.dart';
import 'modules/tree_edit/repository/tree_edit_repository.dart';

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
      navigatorKey: navigatorKey,
    );
  }

  late MainRouter _appRouter;
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<HomeRepository>(
            create: (context) => HomeRepository(HomeApi())),
        RepositoryProvider<TreeDetailRepository>(
            create: (context) => TreeDetailRepository(TreeDetailApi())),
        RepositoryProvider(create: (context) => RegistrationRepository()),
        RepositoryProvider(create: (context) => TreeCreateRepository()),
        RepositoryProvider(create: (context) => TreeEditRepository()),
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
