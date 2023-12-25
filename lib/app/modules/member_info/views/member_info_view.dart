import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:genealogy_management/app/main_router.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:genealogy_management/app/modules/member_info/cubit/member_info_cubit.dart';
import 'package:genealogy_management/app/modules/member_info/cubit/member_info_state.dart';
import 'package:genealogy_management/app/modules/member_info/repository/member_info_repository.dart';

import '../../../core/values/app_colors.dart';
import '../../../core/values/text_styles.dart';
import '../../../core/widgets/button/button_icon_right.dart';
import '../../scan_QR/scan_qr_view.dart';

class MemberInfoView extends StatefulWidget {
  const MemberInfoView(
      {super.key,
      required this.idJafa,
      required this.idMember,
      required this.roleId});
  final int idJafa;
  final int idMember;
  final int roleId;
  @override
  State<MemberInfoView> createState() => _MemberInfoViewState();
}

class _MemberInfoViewState extends State<MemberInfoView> {
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
    return BlocProvider(
        create: (context) => MemberInfoCubit(
            context.read<MemberInfoRepository>(),
            widget.idJafa,
            widget.idMember,
            widget.roleId)
          ..initData(),
        child: BlocBuilder<MemberInfoCubit, MemberInfoState>(
            builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              leading: SizedBox(
                width: 16,
                height: 21,
                child: IconButton(
                  iconSize: 40,
                  onPressed: () async {
                    await context.router.pop();
                  },
                  icon: SvgPicture.asset(
                    "assets/images/back_icon.svg",
                  ),
                ),
              ),
              actions: [
                state.showModalmenu
                    ? IconButton(
                        iconSize: 40,
                        onPressed: () async {
                          await context.router.push(const ScanQRViewRoute());
                        },
                        icon: SvgPicture.asset(
                          "assets/images/dots_three.svg",
                        ),
                      )
                    : Container()
              ],
              title: Text(
                'Thông tin nhánh',
                style: TextStyles.medium16LineHeight24Sur
                    .copyWith(color: AppColors.colorFFFBEFEF),
              ),
              backgroundColor: AppColors.colorFF940000,
            ),
            backgroundColor: const Color.fromRGBO(251, 239, 239, 1),
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: Center(
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 30,
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 20, 20, 0),
                                  child: Wrap(
                                    spacing: 8.0,
                                    runSpacing: 8.0,
                                    alignment: WrapAlignment.spaceEvenly,
                                    children: [
                                      showButton(widget.roleId),
                                      state.showSeeBranch
                                          ? ButtonIconRight(
                                              width: 110,
                                              bgColor: AppColors.colorFFB20000,
                                              icon: 'ic_edit',
                                              name: 'Xem nhánh',
                                              onTap: () => {},
                                            )
                                          : Container(),
                                      state.showChooseBranch
                                          ? ButtonIconRight(
                                              width: 115,
                                              bgColor: AppColors.colorFFB20000,
                                              icon: 'ic_edit',
                                              name: 'Chọn nhánh',
                                              onTap: () => {},
                                            )
                                          : Container(),
                                    ],
                                  ),
                                ),
                                infoUser(
                                    "Họ và tên", state.memberInfo!.name ?? ''),
                                infoUser("Tên gọi khác",
                                    state.memberInfo!.otherName ?? ''),
                                infoUser("Nghề nghiệp",
                                    state.memberInfo!.jobName ?? ''),
                                infoUser("Giới tính",
                                    state.memberInfo!.gender ?? ''),
                                infoUser("Ngày tháng năm sinh",
                                    state.memberInfo!.birthday ?? ''),
                                const SizedBox(
                                  height: 20,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Positioned.fill(
                    top: 85,
                    child: Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          width: 70,
                          height: 70,
                          decoration: const BoxDecoration(
                              // border: Border.all(),
                              color: AppColors.cE4E4E4_divider,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(100))),
                          child: Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: state.memberInfo!.avatar != null
                                        ? NetworkImage(
                                            state.memberInfo!.avatar!)
                                        : const AssetImage(
                                                "assets/images/user.png")
                                            as ImageProvider<Object>)),
                          ),
                        )),
                  ),
                ],
              ),
            ),
          );
        }));
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

  Widget showButton(int idRole) {
    debugPrint('------------id role: $idRole');
    switch (idRole) {
      case 1:
        return ButtonIconRight(
          width: 100,
          bgColor: AppColors.c000000_black,
          // icon: 'ic_edit',
          name: 'Quản trị viên',
          onTap: () => {},
        );
      case 2:
        return ButtonIconRight(
          bgColor: AppColors.c000000_black,
          icon: 'ic_edit',
          name: 'Người biên soạn',
          onTap: () => {},
        );
      case 3:
        return ButtonIconRight(
          width: 160,
          bgColor: AppColors.colorFFFBEFEF,
          icon: 'ic_edit',
          name: 'Thành viên gia tộc',
          colorTextIcon: AppColors.colorFFB20000,
          onTap: () => {},
        );
      case 4:
        return ButtonIconRight(
          bgColor: AppColors.colorFFFBEFEF,
          icon: 'ic_edit',
          name: 'Người xem',
          colorTextIcon: AppColors.color4B000000,
          onTap: () => {},
        );
      default:
        return ButtonIconRight(
          bgColor: AppColors.c000000_black,
          icon: 'ic_edit',
          name: 'Người biên soạn',
          onTap: () => {},
        );
    }
  }
}
