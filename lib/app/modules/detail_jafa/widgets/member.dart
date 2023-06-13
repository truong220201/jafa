import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:genealogy_management/app/core/values/string_constants.dart';
import 'package:genealogy_management/app/modules/detail_jafa/widgets/cart.dart';

import '../../tree_view/tree_view.dart';
import '../cubit/tree_detail_cubit.dart';
import '../cubit/tree_detail_state.dart';

class MemberWidget extends StatelessWidget {
  const MemberWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(20.0),
        decoration: const BoxDecoration(
            color: Color.fromARGB(255, 255, 255, 255),
            borderRadius: BorderRadius.all(Radius.circular(8))),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(StringConstants.member),
          BlocSelector<TreeDetailCubit, TreeDetailState, int?>(
              selector: (state) => state.treeDetail.totalMember ?? 0,
              builder: (context, state) {
                return CartWidget(
                    icon: SvgPicture.asset(
                      "assets/images/nguoi_dung_lk.svg",
                    ),
                    title: StringConstants.seeListJafa,
                    content: '${state.toString()} thành viên',
                    onTap: () => {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const TreeView()))
                        });
              }),
          BlocSelector<TreeDetailCubit, TreeDetailState, int?>(
              selector: (state) => state.treeDetail.totalUser ?? 0,
              builder: (context, state) {
                return CartWidget(
                    icon: SvgPicture.asset(
                      "assets/images/nguoi_dung_lk.svg",
                    ),
                    title: StringConstants.seeMemberHasJoin,
                    content: '${state.toString()} thành viên',
                    onTap: () => {});
              })
        ]));
  }
}
