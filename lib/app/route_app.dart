import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:genealogy_management/app/modules/register/repository/registration_repository.dart';
import 'core/values/app_theme.dart';
import 'main_router.dart';
import 'modules/detail_jafa/repository/mock_tree_detail_repository.dart';
import 'modules/home/repository/mock_home_repository.dart';
import 'modules/tree_create/repository/tree_create_repository.dart';

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
        RepositoryProvider<MockHomeRepository>(
            create: (context) => MockHomeRepository()),
        RepositoryProvider<MockTreeDetailRepository>(
            create: (context) => MockTreeDetailRepository()),
        RepositoryProvider(
          create: (context) => RegistrationRepository(),
        ),
        RepositoryProvider(
          create: (context) => TreeCreateRepository(),
        ),
        RepositoryProvider<MockHomeRepository>(
            create: (context) => MockHomeRepository()),
        RepositoryProvider<MockTreeDetailRepository>(
            create: (context) => MockTreeDetailRepository()),
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
