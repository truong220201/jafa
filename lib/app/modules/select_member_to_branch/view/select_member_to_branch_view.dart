import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase/app/core/widgets/search/grey_search.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_firebase/app/modules/select_member_to_branch/cubit/select_member_to_branch_cubit.dart';
import 'package:flutter_firebase/app/modules/select_member_to_branch/cubit/select_member_to_branch_state.dart';
import 'package:flutter_firebase/app/modules/select_member_to_branch/repository/select_member_to_branch_repository.dart';

import '../../../core/values/app_colors.dart';
import '../../../core/values/text_styles.dart';
import '../../../core/widgets/button/button_icon_right.dart';
import '../widgets/show_qr.dart';

class SelectMemberToBranchView extends StatefulWidget {
  const SelectMemberToBranchView(
      {super.key,
      required this.idJafa,
      required this.roleId,
      required this.nameJafa});
  final String idJafa;
  final int roleId;
  final String nameJafa;
  @override
  State<SelectMemberToBranchView> createState() =>
      _SelectMemberToBranchViewState();
}

class _SelectMemberToBranchViewState extends State<SelectMemberToBranchView> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
          title: Text(
            'Chọn thành viên vào nhánh',
            style: TextStyles.medium16LineHeight24Sur
                .copyWith(color: AppColors.colorFFFBEFEF),
          ),
          backgroundColor: AppColors.colorFF940000,
        ),
        backgroundColor: AppColors.colorFFFFFFFF,
        body: BlocProvider(
            create: (context) => SelectMemberToBranchCubit(
                context.read<SelectMemberToBranchRepository>(), widget.idJafa)
              ..initData(),
            child: BlocBuilder<SelectMemberToBranchCubit,
                SelectMemberToBranchState>(builder: (context, state) {
              return Stack(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: double.infinity,
                          child: state.indexChoose != null
                              ? ButtonIconRight(
                                  width: 201,
                                  height: 40,
                                  bgColor: AppColors.colorFFFFFFFF,
                                  sizeText: 16,
                                  sizeIcon: 20,
                                  colorTextIcon: AppColors.colorFFB20000,
                                  hasBorder: true,
                                  icon: 'ic_scan',
                                  name: 'Mời bằng QR Code',
                                  onTap: () => {
                                    context
                                        .read<SelectMemberToBranchCubit>()
                                        .changeShowInviteFriends()
                                  },
                                )
                              : ButtonIconRight(
                                  width: 201,
                                  height: 40,
                                  bgColor: AppColors.colorFFFFFFFF,
                                  borderColor: AppColors.colorFFADADAD,
                                  sizeText: 16,
                                  sizeIcon: 20,
                                  colorTextIcon: AppColors.colorFFADADAD,
                                  hasBorder: true,
                                  icon: 'ic_scan',
                                  name: 'Mời bằng QR Code',
                                  onTap: () => {},
                                ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: GreySearch(
                            kOptions: const [],
                            isBorder: false,
                            idJafa: widget.idJafa,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 15, vertical: 15),
                          child: Text(
                            'Chọn từ danh sách người xem',
                            style: TextStyles.boldBlackS16,
                          ),
                        ),
                        MemberList(
                          idJafa: widget.idJafa,
                          roleId: widget.roleId,
                          nameJafa: widget.nameJafa,
                        )
                      ],
                    ),
                  ),
                  state.showInviteFriends
                      ? Positioned(
                          child: Align(
                              alignment: Alignment.center,
                              child: ModalInviteFriends(
                                idMember: state.idMemberChoose!,
                                idJafa: widget.idJafa,
                                onTap: () => context
                                    .read<SelectMemberToBranchCubit>()
                                    .changeShowInviteFriends(),
                              )),
                        )
                      : Container(),
                ],
              );
            })));
  }
}

class MemberList extends StatefulWidget {
  const MemberList(
      {super.key,
      required this.idJafa,
      required this.roleId,
      required this.nameJafa});
  final String idJafa;
  final int roleId;
  final String nameJafa;

  @override
  State<MemberList> createState() => _MemberListState();
}

class _MemberListState extends State<MemberList> {
  // final List<MemberModel>? listMember;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SelectMemberToBranchCubit, SelectMemberToBranchState>(
        builder: (context, state) {
      return state.allUser.isNotEmpty
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 500,
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: state.allUser.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                          title: CartMemberToSetectWidget(
                              icon: state.allUser[index].avatar,
                              title: state.allUser[index].name,
                              content: state.allUser[index].roleId,
                              colorContainer: state.indexChoose != index
                                  ? AppColors.colorFFFFFFFF
                                  : AppColors.colorFFFBEFEF,
                              isLoading: isLoading,
                              onTap: () async {
                                setState(() {
                                  isLoading = true;
                                });
                                await context
                                    .read<SelectMemberToBranchCubit>()
                                    .invMemberToTree(
                                      index,
                                      state.allUser[index].id!,
                                    );
                                setState(() {
                                  isLoading = false;
                                });
                              }));
                    },
                  ),
                ),
              ],
            )
          : const SizedBox(
              height: 500,
              child: Center(
                child: Text(
                  'Chưa có dữ liệu',
                  style: TextStyles.small12LineHeight18Sur,
                ),
              ),
            );
    });
  }
}

// ignore: must_be_immutable
class CartMemberToSetectWidget extends StatefulWidget {
  CartMemberToSetectWidget(
      {super.key,
      required this.icon,
      required this.title,
      this.isLoading = false,
      this.colorContainer = AppColors.colorFFFFFFFF,
      this.content,
      required this.onTap});
  String? icon;
  String? title;
  int? content;
  Color colorContainer;
  Function onTap;
  bool isLoading;
  @override
  State<CartMemberToSetectWidget> createState() =>
      _CartMemberToSetectWidgetState();
}

class _CartMemberToSetectWidgetState extends State<CartMemberToSetectWidget> {
  bool showIconCheck = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onTap();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        decoration: BoxDecoration(
          color: widget.colorContainer,
        ),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: widget.icon != null
                          ? NetworkImage(widget.icon!)
                          : const AssetImage("assets/images/user.png")
                              as ImageProvider<Object>)),
            ),
          ),
          Expanded(
            child: SizedBox(
              height: 47,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  widget.title != null
                      ? Text(
                          widget.title!,
                          style: TextStyles.medium16LineHeight24Sur,
                        )
                      : Container(),
                  widget.content != null
                      ? Text(
                          _roleName(widget.content!),
                          style: TextStyles.small12LineHeight18BlackSur,
                        )
                      : Container()
                ],
              ),
            ),
          ),
          widget.colorContainer != AppColors.colorFFFFFFFF
              ? !widget.isLoading
                  ? Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: SvgPicture.asset(
                        "assets/images/ic_check.svg",
                      ),
                    )
                  : const CircularProgressIndicator()
              : Container(),
        ]),
      ),
    );
  }

  String _roleName(int idRole) {
    String roleName = '';
    if (idRole == 1) {
      roleName = 'Quản trị viên';
    } else if (idRole == 2) {
      roleName = 'Người biên soạn';
    } else if (idRole == 3) {
      roleName = 'Được chỉnh sửa';
    } else if (idRole == 4) {
      roleName = 'Chỉ xem';
    }
    return roleName;
  }
}
