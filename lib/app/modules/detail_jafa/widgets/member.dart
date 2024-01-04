import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase/app/core/values/string_constants.dart';
import 'package:flutter_firebase/app/modules/detail_jafa/widgets/cart.dart';
import 'package:flutter_svg/svg.dart';

import '../cubit/tree_detail_cubit.dart';
import '../cubit/tree_detail_state.dart';

class MemberWidget extends StatelessWidget {
  const MemberWidget(
      {super.key, required this.idJafa, required this.roleMySelf});
  final String idJafa;
  final int roleMySelf;
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
              selector: (state) => state.treeDetail!.totalMember ?? 0,
              builder: (context, state) {
                return CartWidget(
                    icon: SvgPicture.asset(
                      "assets/images/nguoi_dung_lk.svg",
                    ),
                    title: StringConstants.seeListJafa,
                    content: '${state.toString()} thành viên',
                    onTap: () async {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) =>
                      //             TreeByListView(idJafa: idJafa)));
                      // debugPrint('helloooooooooo');
                    });
              }),
          BlocSelector<TreeDetailCubit, TreeDetailState, int?>(
              selector: (state) => state.treeDetail!.totalUser ?? 0,
              builder: (context, state) {
                return CartWidget(
                    icon: SvgPicture.asset(
                      "assets/images/nguoi_dung_lk.svg",
                    ),
                    title: StringConstants.seeMemberHasJoin,
                    content: '${state.toString()} thành viên',
                    onTap: () async {
                      // await context.router.push(MemberListViewRoute(
                      //   idJafa: idJafa,
                      // ));
                    });
              })
        ]));
  }
}
