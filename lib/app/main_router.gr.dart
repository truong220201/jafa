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
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const ConfirmView(),
      );
    },
    RegisterInfoViewRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const RegisterInfoView(),
      );
    },
    RegisterPhoneViewRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const RegisterPhoneView(),
      );
    },
    WelcomeViewRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const WelcomeView(),
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
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const TreeDetailView(),
      );
    },
    ScanQRViewRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: ScanQRView(),
      );
    },
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          ConfirmViewRoute.name,
          path: '/confirm-view',
        ),
        RouteConfig(
          RegisterInfoViewRoute.name,
          path: '/register-info-view',
        ),
        RouteConfig(
          RegisterPhoneViewRoute.name,
          path: '/register-phone-view',
        ),
        RouteConfig(
          WelcomeViewRoute.name,
          path: '/welcome-view',
        ),
        RouteConfig(
          HomeViewRoute.name,
          path: '/',
        ),
        RouteConfig(
          TreeCreateViewRoute.name,
          path: '/tree-create-view',
        ),
        RouteConfig(
          TreeDetailViewRoute.name,
          path: '/tree-detail-view',
        ),
        RouteConfig(
          ScanQRViewRoute.name,
          path: '/scan-qr-view',
        ),
      ];
}

/// generated route for
/// [ConfirmView]
class ConfirmViewRoute extends PageRouteInfo<void> {
  const ConfirmViewRoute()
      : super(
          ConfirmViewRoute.name,
          path: '/confirm-view',
        );

  static const String name = 'ConfirmViewRoute';
}

/// generated route for
/// [RegisterInfoView]
class RegisterInfoViewRoute extends PageRouteInfo<void> {
  const RegisterInfoViewRoute()
      : super(
          RegisterInfoViewRoute.name,
          path: '/register-info-view',
        );

  static const String name = 'RegisterInfoViewRoute';
}

/// generated route for
/// [RegisterPhoneView]
class RegisterPhoneViewRoute extends PageRouteInfo<void> {
  const RegisterPhoneViewRoute()
      : super(
          RegisterPhoneViewRoute.name,
          path: '/register-phone-view',
        );

  static const String name = 'RegisterPhoneViewRoute';
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

/// generated route for
/// [HomeView]
class HomeViewRoute extends PageRouteInfo<void> {
  const HomeViewRoute()
      : super(
          HomeViewRoute.name,
          path: '/',
        );

  static const String name = 'HomeViewRoute';
}

/// generated route for
/// [TreeCreateView]
class TreeCreateViewRoute extends PageRouteInfo<void> {
  const TreeCreateViewRoute()
      : super(
          TreeCreateViewRoute.name,
          path: '/tree-create-view',
        );

  static const String name = 'TreeCreateViewRoute';
}

/// generated route for
/// [TreeDetailView]
class TreeDetailViewRoute extends PageRouteInfo<void> {
  const TreeDetailViewRoute()
      : super(
          TreeDetailViewRoute.name,
          path: '/tree-detail-view',
        );

  static const String name = 'TreeDetailViewRoute';
}

/// generated route for
/// [ScanQRView]
class ScanQRViewRoute extends PageRouteInfo<void> {
  const ScanQRViewRoute()
      : super(
          ScanQRViewRoute.name,
          path: '/scan-qr-view',
        );

  static const String name = 'ScanQRViewRoute';
}
