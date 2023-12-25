import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:genealogy_management/app/modules/member_info/views/member_info_view.dart';
import 'package:genealogy_management/app/modules/member_list/cubit/member_list_cubit.dart';
import 'package:genealogy_management/app/modules/member_list/cubit/member_list_state.dart';
import 'package:genealogy_management/app/modules/member_list/repository/member_list_repository.dart';
import 'package:genealogy_management/app/modules/member_list/widgets/cart_member.dart';

import '../../../core/values/app_colors.dart';
import '../../../core/values/text_styles.dart';
import '../../../core/widgets/button/button_icon_right.dart';
import '../widgets/grey_search.dart';
import '../../../data/model/member_model.dart';
import '../widgets/show_qr.dart';

class MemberListView extends StatefulWidget {
  const MemberListView({super.key, required this.idJafa});
  final int idJafa;
  @override
  // ignore: library_private_types_in_public_api
  _MemberListViewState createState() => _MemberListViewState();
}

class _MemberListViewState extends State<MemberListView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.colorFFFFFFFF,
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
            'Danh sách thành viên',
            style: TextStyles.medium16LineHeight24Sur
                .copyWith(color: AppColors.colorFFFBEFEF),
          ),
          backgroundColor: AppColors.colorFF940000,
        ),
        body: BlocProvider(
            create: (context) => MemberListCubit(
                context.read<MemberListRepository>(), widget.idJafa)
              ..initData(),
            child: BlocBuilder<MemberListCubit, MemberListState>(
                builder: (context, state) {
              return state.allUser.length >= 2
                  ? SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          GreySearch(
                            kOptions: state.searchList,
                            isBorder: false,
                            idJafa: widget.idJafa,
                          ),
                          _tabSection(context, widget.idJafa),
                        ],
                      ),
                    )
                  : Stack(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height,
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Chưa có thành viên',
                                style: TextStyles.medium14LineHeight21Sur,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              ButtonIconRight(
                                width: 75,
                                bgColor: AppColors.colorFFB20000,
                                name: 'Mời ngay',
                                onTap: () => {
                                  context
                                      .read<MemberListCubit>()
                                      .changeShowInviteFriends()
                                },
                              )
                            ],
                          ),
                        ),
                        state.showInviteFriends!
                            ? Positioned(
                                child: Align(
                                    alignment: Alignment.center,
                                    child: ModalInviteFriends(
                                      idJafa: widget.idJafa,
                                      onTap: () => context
                                          .read<MemberListCubit>()
                                          .changeShowInviteFriends(),
                                    )),
                              )
                            : Container(),
                      ],
                    );
            })));
  }
}

Widget _totalMember(int total) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
    child: Text(
      '$total Thành Viên',
      style: TextStyles.boldBlackS16,
    ),
  );
}

Widget _tabSection(BuildContext contextn, int idJafa) {
  return DefaultTabController(
      length: 4,
      child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
        const PreferredSize(
            preferredSize: Size.fromHeight(30.0),
            child: TabBar(
                isScrollable: true,
                unselectedLabelColor: Color.fromARGB(255, 0, 0, 0),
                labelColor: Colors.red,
                indicatorColor: Colors.red,
                tabs: [
                  Tab(
                    child: Text('Tất cả'),
                  ),
                  Tab(
                    child: Text('Người biên soạn'),
                  ),
                  Tab(
                    child: Text('Thành viên gia tộc'),
                  ),
                  Tab(
                    child: Text('Người xem'),
                  ),
                ])),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlocBuilder<MemberListCubit, MemberListState>(
                builder: (context, state) {
              return SingleChildScrollView(
                child: SizedBox(
                    height: 500,
                    child: TabBarView(
                      children: <Widget>[
                        MemberList(
                          listMember: state.allUser,
                          idJafa: idJafa,
                        ),
                        MemberList(
                          listMember: state.adminlist,
                          idJafa: idJafa,
                        ),
                        MemberList(
                          listMember: state.memberJafaList,
                          idJafa: idJafa,
                        ),
                        MemberList(
                          listMember: state.userViewlist,
                          idJafa: idJafa,
                        ),
                      ],
                    )),
              );
            })
          ],
        )
      ]));
}

class MemberList extends StatelessWidget {
  const MemberList({super.key, this.listMember, required this.idJafa});
  final List<MemberModel>? listMember;
  final int idJafa;
  @override
  Widget build(BuildContext context) {
    context.read<MemberListCubit>().changeSearch(listMember!);
    debugPrint('change Search');
    return listMember!.isNotEmpty
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _totalMember(listMember!.length),
              SizedBox(
                height: 450,
                child: ListView.builder(
                  itemCount: listMember!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                        title: GestureDetector(
                      onTap: () async {
                        //context.read<HomeCubit>().getConservations();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MemberInfoView(
                                      roleId: listMember![index].roleId!,
                                      idJafa: idJafa,
                                      idMember:
                                          listMember![index].userGenealogyId!,
                                    )));
                      },
                      child: Container(
                          padding: const EdgeInsets.all(10.0),
                          decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 255, 255, 255),
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                          ),
                          child: CartMemberWidget(
                              icon: listMember![index].avatar,
                              title: listMember![index].name,
                              content: listMember![index].roleId,
                              onTap: () => {
                                    // debugPrint('idjafa:-----------' +
                                    //     listMember![index]
                                    //         .userGenealogyId!
                                    //         .toString()),
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                MemberInfoView(
                                                  roleId: listMember![index]
                                                      .roleId!,
                                                  idJafa: idJafa,
                                                  idMember: listMember![index]
                                                      .userGenealogyId!,
                                                )))
                                  })),
                    ));
                  },
                ),
              ),
            ],
          )
        : const Center(
            child: Text(
              'Chưa có dữ liệu',
              style: TextStyles.small12LineHeight18Sur,
            ),
          );
  }
}
