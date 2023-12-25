import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:genealogy_management/app/core/extension/date_format_extension.dart';
import 'package:genealogy_management/app/main_router.dart';
import '../../../core/values/app_colors.dart';
import '../../../core/values/text_styles.dart';
import '../../../core/widgets/appBar/custom_appbar.dart';
import '../../../data/model/user.dart';
import '../../scan_QR/scan_qr_view.dart';

class UserDetailView extends StatefulWidget {
  const UserDetailView({super.key, required this.user});
  final User user;
  @override
  State<UserDetailView> createState() => _UserDetailViewState();
}

class _UserDetailViewState extends State<UserDetailView> {
  bool haveJaFa = true;
  void openScan() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const ScanQRView()));
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        leadingWidth: 49,
        leading: Row(
          children: [
            const SizedBox(width: 9),
            CustomAppbarItem(
              icon: Icons.arrow_back,
              onPressed: () {
                context.router.pop();
              },
            ),
          ],
        ),
        actions: [
          CustomAppbarItem(
            icon: Icons.edit_square,
            onPressed: () async {
              await context.router.push(EditUserInfoViewRoute(user: widget.user));
            },
          ),
          const SizedBox(width: 9),
        ],
        title: 'Thông tin cá nhân',
      ),
      backgroundColor: AppColors.colorFFFBEFEF,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 100,
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Container(
                    decoration: const BoxDecoration(
                        color: AppColors.colorFFFFFFFF,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Center(
                      child: Column(
                        children: [
                          const SizedBox(height: 50),
                          infoUser("Họ và tên",
                              widget.user.name ?? "Chưa có thông tin"),
                          infoUser("Tên gọi khác",
                              widget.user.otherName ?? "Chưa có thông tin"),
                          infoUser("Nghề nghiệp",
                              widget.user.jobName ?? "Chưa có thông tin"),
                          infoUser("Giới tính",
                              widget.user.gender ?? "Chưa có thông tin"),
                          infoUser(
                              "Ngày tháng năm sinh",
                              widget.user.birthday?.toFormattedDate() ??
                                  "Chưa có thông tin"),
                          infoUser("Số điện thoại",
                              widget.user.phone ?? "Chưa có thông tin"),
                          infoUser("Email",
                              widget.user.email ?? "Chưa có thông tin"),
                          const SizedBox(height: 50),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Positioned.fill(
              top: 60,
              child: Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      color: AppColors.cE4E4E4_divider,
                      shape: BoxShape.circle,
                      image: widget.user.avatar != null
                          ? DecorationImage(
                              image: NetworkImage(widget.user.avatar!),
                              fit: BoxFit.cover,
                            )
                          : null,
                    ),
                    child: widget.user.avatar == null
                        ? const Icon(
                            Icons.person,
                            size: 100,
                            color: Colors.white,
                          )
                        : null,
                  )),
            ),
          ],
        ),
      ),
    );
  }

  Widget infoUser(String title, String info) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyles.boldBlackS16,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              info,
              style: TextStyles.size14,
            )
          ],
        ),
      ),
    );
  }
}
