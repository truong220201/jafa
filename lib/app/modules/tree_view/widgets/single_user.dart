import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase/app/main_router.dart';

import '../../../core/values/string_constants.dart';
import '../../../core/widgets/asset_image/asset_image_view.dart';
import '../../../data/model/tree_view_model.dart';
import '../cubit/tree_view_cubit.dart';
import '../cubit/tree_view_state.dart';

class SingleUser extends StatelessWidget {
  const SingleUser(
      {super.key,
      required this.id,
      required this.roleId,
      required this.genealogyId});
  final String id;
  final int roleId;
  final String genealogyId;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<TreeViewCubit, TreeViewState, List<TreeViewModel>?>(
        selector: (state) => state.treeViewModel,
        builder: (context, state) {
          TreeViewModel user = context.read<TreeViewCubit>().getinfPerSon(id);
          return Container(
              padding: const EdgeInsets.all(16),
              // decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(4), border: Border.all()),
              child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        const SizedBox(
                          width: 45,
                        ),
                        SizedBox(
                          //alignment: Alignment.center,
                          width: 150,
                          child: Stack(children: [
                            SizedBox(
                                width: 100,
                                height: 100,
                                child: Container(
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: user.image != null
                                              ? NetworkImage(user.image!)
                                              : const AssetImage(
                                                      "assets/images/user.png")
                                                  as ImageProvider<Object>)),
                                )),
                            Positioned(
                                top: 30,
                                left: 75,
                                child: Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: GestureDetector(
                                    onTap: () async {
                                      await context.router.push(
                                          CreateBranchViewRoute(
                                              user: user,
                                              name: user.name,
                                              avatar: user.image,
                                              genealogyId: genealogyId,
                                              isRoot: user.isRoot,
                                              roleId: roleId,
                                              userGenealogyId: id));
                                    },
                                    child: const AssetImageView(
                                      fileName: 'ic_add.svg',
                                    ),
                                  ),
                                ))
                          ]),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(user.name ?? StringConstants.nullName)
                  ]));
        });
  }
}
