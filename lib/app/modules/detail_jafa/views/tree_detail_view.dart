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
  bool haveJaFa = true;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) =>
            TreeDetailCubit(context.read<TreeDetailRepository>(), widget.idJafa)
              ..initData(),
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
                      return const Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 13, vertical: 16.0),
                        child: Column(children: [
                          FamilyWidget(),
                          SizedBox(
                            height: 10,
                          ),
                          MemberWidget(),
                          SizedBox(
                            height: 10,
                          ),
                          DomicileWidget(),
                          SizedBox(
                            height: 10,
                          ),
                          RelationshipWidget()
                          //_listCard(context)
                        ]),
                      );
                    }))
                  : const IfNone(),
              BlocBuilder<TreeDetailCubit, TreeDetailState>(
                  builder: (context, state) {
                return state.showModal!
                    ? const Positioned(
                        child: Align(
                            alignment: Alignment.topRight, child: ModalMenu()),
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
}
