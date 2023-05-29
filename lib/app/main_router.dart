import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'modules/register/views/home/registration_info.dart';
import 'modules/register/views/login/confirm.dart';
import 'modules/register/views/login/registration_phone.dart';
import 'modules/register/views/login/welcome.dart';
import 'modules/tree/views/detail_jafa/views/tree_detail_view.dart';
import 'modules/tree/views/home/views/home_default.dart';
import 'modules/tree/views/scan_QR/scan_qr_view.dart';
import 'modules/tree/views/tree_creat.dart';
part 'main_router.gr.dart';

@MaterialAutoRouter(routes: <AutoRoute>[
  MaterialRoute(page: ConfirmView),
  MaterialRoute(page: RegisterInfoView),
  MaterialRoute(page: RegisterPhoneView),
  MaterialRoute(
    page: WelcomeView,
  ),
  MaterialRoute(page: HomeView, initial: true),
  MaterialRoute(
    page: TreeCreateView,
  ),
  MaterialRoute(
    page: TreeDetailView,
  ),
  MaterialRoute(
    page: ScanQRView,
  ),
])
class MainRouter extends _$MainRouter {
  MainRouter({GlobalKey<NavigatorState>? navigatorKey}) : super(navigatorKey);
}
