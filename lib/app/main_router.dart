import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'app_routes.dart';
import 'modules/detail_jafa/views/tree_detail_view.dart';
import 'modules/home/views/home_default_view.dart';
import 'modules/register/cubit/registration_cubit.dart';
import 'modules/register/cubit/registration_state.dart';
import 'modules/register/views/home/registration_info_view.dart';
import 'modules/register/views/login/confirm_view.dart';
import 'modules/register/views/login/registration_phone_view.dart';
import 'modules/register/views/login/welcome_view.dart';
import 'modules/scan_QR/scan_qr_view.dart';
import 'modules/tree_create/view/tree_create_view.dart';
import 'modules/tree_edit/view/tree_edit_view.dart';
part 'main_router.gr.dart';

@MaterialAutoRouter(routes: <AutoRoute>[
  MaterialRoute(page: ConfirmView, path: Routes.confirm),
  MaterialRoute(page: RegisterInfoView, path: Routes.register),
  MaterialRoute(page: RegisterPhoneView, path: Routes.phone),
  MaterialRoute(page: HomeView, path: Routes.home, initial: true),
  MaterialRoute(page: TreeCreateView, path: Routes.createTree),
  MaterialRoute(page: TreeDetailView, path: Routes.treeDetail),
  MaterialRoute(page: TreeEditView, path: Routes.treeDetail),
  MaterialRoute(page: ScanQRView, path: Routes.scanQR),
  MaterialRoute(
    page: WelcomeView,
  ),
])
class MainRouter extends _$MainRouter {
  MainRouter({GlobalKey<NavigatorState>? navigatorKey}) : super(navigatorKey);
}
