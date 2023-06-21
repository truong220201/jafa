// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'main_router.dart';

class _$MainRouter extends RootStackRouter {
  _$MainRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    ConfirmViewRoute.name: (routeData) {
      final args = routeData.argsAs<ConfirmViewRouteArgs>();
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: ConfirmView(
          key: args.key,
          cubit: args.cubit,
        ),
      );
    },
    RegisterInfoViewRoute.name: (routeData) {
      final args = routeData.argsAs<RegisterInfoViewRouteArgs>();
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: RegisterInfoView(
          key: args.key,
          cubit: args.cubit,
        ),
      );
    },
    RegisterPhoneViewRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const RegisterPhoneView(),
      );
    },
    HomeViewRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const HomeView(),
      );
    },
    TreeCreateViewRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const TreeCreateView(),
      );
    },
    TreeDetailViewRoute.name: (routeData) {
      final args = routeData.argsAs<TreeDetailViewRouteArgs>();
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: TreeDetailView(
          key: args.key,
          idJafa: args.idJafa,
        ),
      );
    },
    TreeEditViewRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const TreeEditView(),
      );
    },
    ScanQRViewRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const ScanQRView(),
      );
    },
    TreeViewRoute.name: (routeData) {
      final args = routeData.argsAs<TreeViewRouteArgs>();
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: TreeView(
          key: args.key,
          idTree: args.idTree,
        ),
      );
    },
    WelcomeViewRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const WelcomeView(),
      );
    },
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          '/#redirect',
          path: '/',
          redirectTo: 'home',
          fullMatch: true,
        ),
        RouteConfig(
          ConfirmViewRoute.name,
          path: 'confirm',
        ),
        RouteConfig(
          RegisterInfoViewRoute.name,
          path: 'register',
        ),
        RouteConfig(
          RegisterPhoneViewRoute.name,
          path: 'phone',
        ),
        RouteConfig(
          HomeViewRoute.name,
          path: 'home',
        ),
        RouteConfig(
          TreeCreateViewRoute.name,
          path: 'create_tree',
        ),
        RouteConfig(
          TreeDetailViewRoute.name,
          path: 'tree_detail',
        ),
        RouteConfig(
          TreeEditViewRoute.name,
          path: 'tree_detail',
        ),
        RouteConfig(
          ScanQRViewRoute.name,
          path: 'scan_qr',
        ),
        RouteConfig(
          TreeViewRoute.name,
          path: 'treeView',
        ),
        RouteConfig(
          WelcomeViewRoute.name,
          path: '/welcome-view',
        ),
      ];
}

/// generated route for
/// [ConfirmView]
class ConfirmViewRoute extends PageRouteInfo<ConfirmViewRouteArgs> {
  ConfirmViewRoute({
    Key? key,
    required RegistrationCubit cubit,
  }) : super(
          ConfirmViewRoute.name,
          path: 'confirm',
          args: ConfirmViewRouteArgs(
            key: key,
            cubit: cubit,
          ),
        );

  static const String name = 'ConfirmViewRoute';
}

class ConfirmViewRouteArgs {
  const ConfirmViewRouteArgs({
    this.key,
    required this.cubit,
  });

  final Key? key;

  final RegistrationCubit cubit;

  @override
  String toString() {
    return 'ConfirmViewRouteArgs{key: $key, cubit: $cubit}';
  }
}

/// generated route for
/// [RegisterInfoView]
class RegisterInfoViewRoute extends PageRouteInfo<RegisterInfoViewRouteArgs> {
  RegisterInfoViewRoute({
    Key? key,
    required RegistrationCubit cubit,
  }) : super(
          RegisterInfoViewRoute.name,
          path: 'register',
          args: RegisterInfoViewRouteArgs(
            key: key,
            cubit: cubit,
          ),
        );

  static const String name = 'RegisterInfoViewRoute';
}

class RegisterInfoViewRouteArgs {
  const RegisterInfoViewRouteArgs({
    this.key,
    required this.cubit,
  });

  final Key? key;

  final RegistrationCubit cubit;

  @override
  String toString() {
    return 'RegisterInfoViewRouteArgs{key: $key, cubit: $cubit}';
  }
}

/// generated route for
/// [RegisterPhoneView]
class RegisterPhoneViewRoute extends PageRouteInfo<void> {
  const RegisterPhoneViewRoute()
      : super(
          RegisterPhoneViewRoute.name,
          path: 'phone',
        );

  static const String name = 'RegisterPhoneViewRoute';
}

/// generated route for
/// [HomeView]
class HomeViewRoute extends PageRouteInfo<void> {
  const HomeViewRoute()
      : super(
          HomeViewRoute.name,
          path: 'home',
        );

  static const String name = 'HomeViewRoute';
}

/// generated route for
/// [TreeCreateView]
class TreeCreateViewRoute extends PageRouteInfo<void> {
  const TreeCreateViewRoute()
      : super(
          TreeCreateViewRoute.name,
          path: 'create_tree',
        );

  static const String name = 'TreeCreateViewRoute';
}

/// generated route for
/// [TreeDetailView]
class TreeDetailViewRoute extends PageRouteInfo<TreeDetailViewRouteArgs> {
  TreeDetailViewRoute({
    Key? key,
    required int idJafa,
  }) : super(
          TreeDetailViewRoute.name,
          path: 'tree_detail',
          args: TreeDetailViewRouteArgs(
            key: key,
            idJafa: idJafa,
          ),
        );

  static const String name = 'TreeDetailViewRoute';
}

class TreeDetailViewRouteArgs {
  const TreeDetailViewRouteArgs({
    this.key,
    required this.idJafa,
  });

  final Key? key;

  final int idJafa;

  @override
  String toString() {
    return 'TreeDetailViewRouteArgs{key: $key, idJafa: $idJafa}';
  }
}

/// generated route for
/// [TreeEditView]
class TreeEditViewRoute extends PageRouteInfo<void> {
  const TreeEditViewRoute()
      : super(
          TreeEditViewRoute.name,
          path: 'tree_detail',
        );

  static const String name = 'TreeEditViewRoute';
}

/// generated route for
/// [ScanQRView]
class ScanQRViewRoute extends PageRouteInfo<void> {
  const ScanQRViewRoute()
      : super(
          ScanQRViewRoute.name,
          path: 'scan_qr',
        );

  static const String name = 'ScanQRViewRoute';
}

/// generated route for
/// [TreeView]
class TreeViewRoute extends PageRouteInfo<TreeViewRouteArgs> {
  TreeViewRoute({
    Key? key,
    required int idTree,
  }) : super(
          TreeViewRoute.name,
          path: 'treeView',
          args: TreeViewRouteArgs(
            key: key,
            idTree: idTree,
          ),
        );

  static const String name = 'TreeViewRoute';
}

class TreeViewRouteArgs {
  const TreeViewRouteArgs({
    this.key,
    required this.idTree,
  });

  final Key? key;

  final int idTree;

  @override
  String toString() {
    return 'TreeViewRouteArgs{key: $key, idTree: $idTree}';
  }
}

/// generated route for
/// [WelcomeView]
class WelcomeViewRoute extends PageRouteInfo<void> {
  const WelcomeViewRoute()
      : super(
          WelcomeViewRoute.name,
          path: '/welcome-view',
        );

  static const String name = 'WelcomeViewRoute';
}
