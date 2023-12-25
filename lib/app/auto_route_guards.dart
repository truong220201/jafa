import 'package:auto_route/auto_route.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'app_routes.dart';
import 'core/values/secure_key_constant.dart';

class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    final accessToken =
        await FlutterSecureStorage().read(key: SecureKeyConstants.accessToken);

    if (accessToken == null) {
      router.replaceNamed(Routes.welcome);
    } else {
      resolver.next(true);
    }
  }
}
