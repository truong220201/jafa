import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:genealogy_management/app/core/values/string_constants.dart';

import '../cubit/tree_detail_cubit.dart';
import '../cubit/tree_detail_state.dart';
import 'cart.dart';

class RelationshipWidget extends StatelessWidget {
  const RelationshipWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<TreeDetailCubit, TreeDetailState, String?>(
        selector: (state) => state.treeDetail!.relationName,
        builder: (context, state) {
          return Container(
              padding: const EdgeInsets.all(20.0),
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(StringConstants.yourRelationshipWithJafa),
                  CartWidget(
                      icon: SvgPicture.asset(
                        "assets/images/path.svg",
                      ),
                      title: state,
                      onTap: () {}),
                ],
              ));
        });
  }
}
