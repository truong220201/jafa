import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:genealogy_management/app/core/values/string_constants.dart';
import 'package:genealogy_management/app/core/values/text_styles.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:genealogy_management/app/modules/detail_jafa/widgets/domicile.dart';
import 'package:genealogy_management/app/modules/detail_jafa/widgets/family_info.dart';
import 'package:genealogy_management/app/modules/detail_jafa/widgets/if_none.dart';
import 'package:genealogy_management/app/modules/detail_jafa/widgets/member.dart';
import 'package:genealogy_management/app/modules/detail_jafa/widgets/modal_menu.dart';
import 'package:genealogy_management/app/modules/detail_jafa/widgets/relation_ship.dart';

import '../../../core/values/app_colors.dart';
import '../../../main_router.dart';
import '../cubit/tree_detail_cubit.dart';
import '../cubit/tree_detail_state.dart';
import '../repository/tree_detail_repository.dart';
import '../widgets/show_qr.dart';

class TreeDetailView extends StatefulWidget {
  const TreeDetailView({super.key, required this.idJafa});
  final int idJafa;

  @override
  State<TreeDetailView> createState() => _TreeDetailViewState();
}

class _TreeDetailViewState extends State<TreeDetailView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          TreeDetailCubit(context.read<TreeDetailRepository>(), widget.idJafa)
            ..initData(),
      child: TreeDetailPage(
        idJafa: widget.idJafa,
      ),
    );
  }
}

class TreeDetailPage extends StatefulWidget {
  const TreeDetailPage({super.key, required this.idJafa});
  final int idJafa;

  @override
  State<TreeDetailPage> createState() => _TreeDetailPageState();
}

class _TreeDetailPageState extends State<TreeDetailPage> {
  bool haveJaFa = true;

  @override
  Widget build(BuildContext context) {
    return BlocListener<TreeDetailCubit, TreeDetailState>(
        listenWhen: (previous, current) =>
            previous.statusDeleteJafa != current.statusDeleteJafa,
        listener: (contexta, state) async {
          if (state.statusDeleteJafa != null) {
            // final name = widget.name ?? "Node này";
            _showOverlay(contexta, state.statusDeleteJafa!);
            return;
          }
          await context.router.pop();
        },
        child: Scaffold(
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
              StringConstants.detailJafa,
              style: TextStyles.medium16LineHeight24Sur
                  .copyWith(color: AppColors.colorFFFBEFEF),
            ),
            actions: [
              BlocBuilder<TreeDetailCubit, TreeDetailState>(
                  builder: (context, state) {
                return IconButton(
                  iconSize: 40,
                  onPressed: () {
                    context.read<TreeDetailCubit>().changeShowInviteFriends();
                  },
                  icon: SvgPicture.asset(
                    "assets/images/share_network.svg",
                  ),
                );
              }),
              BlocBuilder<TreeDetailCubit, TreeDetailState>(
                  builder: (context, state) {
                return IconButton(
                  iconSize: 40,
                  onPressed: () {
                    context.read<TreeDetailCubit>().changeModal();
                  },
                  icon: SvgPicture.asset(
                    "assets/images/dots_three.svg",
                  ),
                );
              })
            ],
            backgroundColor: AppColors.colorFF940000,
          ),
          backgroundColor: const Color.fromRGBO(251, 239, 239, 1),
          body: Stack(
            children: <Widget>[
              haveJaFa
                  ? SingleChildScrollView(child:
                      BlocBuilder<TreeDetailCubit, TreeDetailState>(
                          builder: (context, state) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 13, vertical: 16.0),
                        child: Column(children: [
                          const FamilyWidget(),
                          const SizedBox(
                            height: 10,
                          ),
                          MemberWidget(
                              idJafa: state.treeDetail!.id ?? -1,
                              roleMySelf: state.treeDetail!.roleId ?? 4),
                          const SizedBox(
                            height: 10,
                          ),
                          const DomicileWidget(),
                          const SizedBox(
                            height: 10,
                          ),
                          const RelationshipWidget()
                          //_listCard(context)
                        ]),
                      );
                    }))
                  : const IfNone(),
              BlocBuilder<TreeDetailCubit, TreeDetailState>(
                  builder: (context, state) {
                return state.showModal!
                    ? Positioned(
                        child: Align(
                            alignment: Alignment.topRight,
                            child: ModalMenu(
                              callbackFunc: _handleModalMenuSelected,
                            )),
                      )
                    : Container();
              }),
              BlocBuilder<TreeDetailCubit, TreeDetailState>(
                  builder: (context, state) {
                return state.showInviteFriends!
                    ? const Positioned(
                        child: Align(
                            alignment: Alignment.center,
                            child: ModalInviteFriends()),
                      )
                    : Container();
              })
            ],
          ),
        ));
  }

  void _handleModalMenuSelected(ModalMenuType type) {
    final cubit = context.read<TreeDetailCubit>();
    switch (type) {
      case ModalMenuType.leave:
        cubit.leaveJafaFunc(widget.idJafa);
        break;
      case ModalMenuType.delete:
        cubit.deleteJafaFunc(widget.idJafa);
        break;
      case ModalMenuType.edit:
        context.router.push(const TreeEditViewRoute());
        break;
    }
  }

  void _showOverlay(BuildContext context, String message) {
    OverlayEntry overlayEntry;
    overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: MediaQuery.of(context).size.height * 0.15,
        left: MediaQuery.of(context).size.width * 0.1,
        width: MediaQuery.of(context).size.width * 0.8,
        child: Material(
          color: Colors.transparent,
          child: Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(64)),
                color: Color.fromARGB(255, 238, 236, 236)),
            padding: const EdgeInsets.symmetric(
              horizontal: 40,
              vertical: 20,
            ),
            child: Text(
              message,
              style: TextStyles.mediumRedS20,
            ),
          ),
        ),
      ),
    );

    Overlay.of(context).insert(overlayEntry);

    Future.delayed(const Duration(seconds: 2), () {
      overlayEntry.remove();
    });
  }
}
