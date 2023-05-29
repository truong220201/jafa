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
          registrationState: args.registrationState,
        ),
      );
    },
    RegisterInfoViewRoute.name: (routeData) {
      final args = routeData.argsAs<RegisterInfoViewRouteArgs>();
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: RegisterInfoView(
          key: args.key,
          registrationState: args.registrationState,
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
          HomeViewRoute.name,
          path: '/home-view',
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
        RouteConfig(
          WelcomeViewRoute.name,
          path: '/',
        ),
      ];
}

/// generated route for
/// [ConfirmView]
class ConfirmViewRoute extends PageRouteInfo<ConfirmViewRouteArgs> {
  ConfirmViewRoute({
    Key? key,
    required RegistrationState registrationState,
  }) : super(
          ConfirmViewRoute.name,
          path: '/confirm-view',
          args: ConfirmViewRouteArgs(
            key: key,
            registrationState: registrationState,
          ),
        );

  static const String name = 'ConfirmViewRoute';
}

class ConfirmViewRouteArgs {
  const ConfirmViewRouteArgs({
    this.key,
    required this.registrationState,
  });

  final Key? key;

  final RegistrationState registrationState;

  @override
  String toString() {
    return 'ConfirmViewRouteArgs{key: $key, registrationState: $registrationState}';
  }
}

/// generated route for
/// [RegisterInfoView]
class RegisterInfoViewRoute extends PageRouteInfo<RegisterInfoViewRouteArgs> {
  RegisterInfoViewRoute({
    Key? key,
    required RegistrationState registrationState,
  }) : super(
          RegisterInfoViewRoute.name,
          path: '/register-info-view',
          args: RegisterInfoViewRouteArgs(
            key: key,
            registrationState: registrationState,
          ),
        );

  static const String name = 'RegisterInfoViewRoute';
}

class RegisterInfoViewRouteArgs {
  const RegisterInfoViewRouteArgs({
    this.key,
    required this.registrationState,
  });

  final Key? key;

  final RegistrationState registrationState;

  @override
  String toString() {
    return 'RegisterInfoViewRouteArgs{key: $key, registrationState: $registrationState}';
  }
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
/// [HomeView]
class HomeViewRoute extends PageRouteInfo<void> {
  const HomeViewRoute()
      : super(
          HomeViewRoute.name,
          path: '/home-view',
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

/// generated route for
/// [WelcomeView]
class WelcomeViewRoute extends PageRouteInfo<void> {
  const WelcomeViewRoute()
      : super(
          WelcomeViewRoute.name,
          path: '/',
        );

  static const String name = 'WelcomeViewRoute';
}
