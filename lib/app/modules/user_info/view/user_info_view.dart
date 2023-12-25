import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:genealogy_management/app/main_router.dart';
import 'package:genealogy_management/app/modules/user_info/cubit/user_info_state.dart';
import '../../../core/values/app_colors.dart';
import '../../../core/values/secure_key_constant.dart';
import '../../../core/widgets/appBar/custom_appbar.dart';
import '../../../core/widgets/bottom/bottomTab.dart';
import '../cubit/user_info_cubit.dart';
import '../repository/user_info_repository.dart';

class UserInfoView extends StatefulWidget {
  const UserInfoView({super.key});

  @override
  State<UserInfoView> createState() => _UserInfoViewState();
}

class _UserInfoViewState extends State<UserInfoView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          UserInfoCubit(context.read<UserInfoRepository>())..getInfo(),
      child: _buildPage(context),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget _buildPage(BuildContext context) {
    return BlocListener<UserInfoCubit, UserInfoState>(
      listenWhen: (previous, current) => previous.pass != current.pass,
      listener: (context, state) async {
        if (state.pass) {
          final secureStorage = FlutterSecureStorage();
          await secureStorage.delete(key: SecureKeyConstants.accessToken);
          context.router.pushAndPopUntil(const WelcomeViewRoute(),
              predicate: (route) => false);
        }
      },
      child: BlocBuilder<UserInfoCubit, UserInfoState>(
        builder: (context, state) {
          final cubit = context.read<UserInfoCubit>();
          return state.initDone
              ? Scaffold(
                  appBar: CustomAppBar(
                    leadingWidth: 59,
                    leading: Row(
                      children: [
                        const SizedBox(width: 9),
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.colorFFD9D9D9,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: state.user != null &&
                                      state.user!.avatar != null
                                  ? NetworkImage(state.user!.avatar!)
                                  : const AssetImage("assets/images/user.png")
                                      as ImageProvider<Object>,
                            ),
                          ),
                          alignment: Alignment.center,
                        ),
                      ],
                    ),
                    title: "Xin chào ${state.user?.name ?? ""}",
                  ),
                  bottomNavigationBar: const BottomTab(),
                  body: Container(
                    padding:
                        const EdgeInsets.only(left: 25, right: 25, top: 25),
                    child: Column(
                      children: [
                        UserInfoCard(
                          title: 'Hồ sơ của bạn',
                          children: [
                            CustomItem(
                              icon: Icons.person,
                              text: 'Thông tin cá nhân',
                              onTap: () async {
                                await context.router.push(
                                    UserDetailViewRoute(user: state.user!));
                              },
                              subIcon: const Icon(Icons.keyboard_arrow_right),
                            ),
                          ],
                        ),
                        UserInfoCard(
                          title: 'Về ứng dụng',
                          children: [
                            CustomItem(
                              icon: Icons.info_outline,
                              text: 'Về ứng dụng',
                              onTap: () {},
                              subIcon: const Icon(Icons.keyboard_arrow_right),
                            ),
                            CustomItem(
                              icon: Icons.handyman_sharp,
                              text: 'Đánh giá ứng dụng trên cửa hàng',
                              onTap: () {},
                              subIcon: const Icon(Icons.keyboard_arrow_right),
                            ),
                            CustomItem(
                              icon: Icons.handshake,
                              text: 'Góp ý và khiếu nại',
                              onTap: () {},
                              subIcon: const Icon(Icons.keyboard_arrow_right),
                            ),
                          ],
                        ),
                        UserInfoCard(
                          title: 'Chung',
                          children: [
                            CustomItem(
                              icon: Icons.ring_volume,
                              text: 'Nhận thông báo',
                              onTap: () {},
                            ),
                            CustomItem(
                              icon: Icons.logout,
                              text: 'Đăng xuất',
                              onTap: () {
                                cubit.logout();
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              : const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

class UserInfoCard extends StatelessWidget {
  const UserInfoCard({super.key, required this.title, required this.children});
  final String title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 12,
              color: AppColors.colorFFADADAD),
        ),
        const SizedBox(height: 16),
        Column(
          children: children,
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}

class CustomItem extends StatelessWidget {
  const CustomItem({
    super.key,
    this.onTap,
    required this.text,
    required this.icon,
    this.subIcon,
  });
  final void Function()? onTap;
  final String text;
  final IconData icon;
  final Widget? subIcon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(icon),
                  const SizedBox(width: 8),
                  Text(
                    text,
                    style: const TextStyle(
                        fontWeight: FontWeight.w500, fontSize: 16),
                  ),
                ],
              ),
              subIcon ?? const SizedBox(width: 1)
            ],
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
