import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/values/string_constants.dart';
import '../../../core/widgets/asset_image/asset_image_view.dart';
import '../../../core/widgets/popup/popup_list_actions.dart';
import '../../../data/model/tree_view_model.dart';
import '../../../main_router.dart';
import '../cubit/tree_view_cubit.dart';
import '../cubit/tree_view_state.dart';
import '../view/tree_view.dart';

class ListSubUser extends StatelessWidget {
  const ListSubUser({
    super.key,
    required this.userInfo,
    required this.roleId,
    required this.genealogyId,
    required this.nameJafa,
  });
  final Couple userInfo;
  final int roleId;
  final int genealogyId;
  final String nameJafa;
  @override
  Widget build(BuildContext context) {
    final int numberUser = userInfo.listIdvk!.length;
    // debugPrint('couple:--------$userInfo');
    return BlocSelector<TreeViewCubit, TreeViewState, List<TreeViewModel>?>(
        selector: (state) => state.treeViewModel,
        builder: (context, state) {
          TreeViewModel user =
              context.read<TreeViewCubit>().getinfPerSon(userInfo.idaPerson!);
          List<TreeViewModel> listSubUser = context
              .read<TreeViewCubit>()
              .getinfListPerSon(userInfo.listIdvk!);
          return Container(
              width: 190 + 190 + 190 + 190 * (numberUser - 1) * 2,
              //decoration: BoxDecoration(border: Border.all(width: 1)),
              alignment: Alignment.centerRight,
              child: SizedBox(
                // decoration: BoxDecoration(border: Border.all(width: 1)),
                width: 190 + numberUser * 190,
                child: Stack(
                  children: [
                    Row(children: <SizedBox>[
                      SizedBox(
                          width: 190,
                          // decoration: BoxDecoration(border: Border.all(width: 1)),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      width: 40,
                                    ),
                                    SizedBox(
                                      width: 150,
                                      child: Stack(children: [
                                        SizedBox(
                                            width: 100,
                                            height: 100,
                                            child: InkWell(
                                              onTap: () {
                                                if (roleId < 4) {
                                                  showModalTreeDetail(
                                                    context,
                                                    genealogyId,
                                                    user.id ?? -1,
                                                    roleId,
                                                    nameJafa,
                                                    user.name,
                                                    user.avatar,
                                                    user.gender,
                                                    user.isRoot,
                                                  );
                                                } else {
                                                  _showModalTreeViewRequest(
                                                    context,
                                                    context
                                                        .read<TreeViewCubit>(),
                                                    genealogyId,
                                                    user.id ?? -1,
                                                  );
                                                }
                                              },
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    image: DecorationImage(
                                                        fit: BoxFit.cover,
                                                        image: user.avatar !=
                                                                null
                                                            ? NetworkImage(
                                                                user.avatar!)
                                                            : const AssetImage(
                                                                    "assets/images/user.png")
                                                                as ImageProvider<
                                                                    Object>)),
                                              ),
                                            )),
                                        Positioned(
                                            top: 30,
                                            left: 75,
                                            child: GestureDetector(
                                              onTap: () async {
                                                await context.router.push(
                                                    CreateBranchViewRoute(
                                                        name: user.name,
                                                        avatar: user.avatar,
                                                        genealogyId:
                                                            genealogyId,
                                                        isRoot: user.isRoot,
                                                        roleId: roleId,
                                                        userGenealogyId:
                                                            user.id ?? -1));
                                              },
                                              child: Container(
                                                width: 40,
                                                height: 40,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(50),
                                                ),
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
                              ])),
                      for (int i = 0; i < numberUser; i++)
                        SizedBox(
                            width: 190,
                            // decoration: BoxDecoration(border: Border.all(width: 1)),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Stack(children: [
                                    SizedBox(
                                        width: 100,
                                        height: 100,
                                        child: InkWell(
                                          onTap: () {
                                            if (roleId < 4) {
                                              showModalTreeDetail(
                                                context,
                                                genealogyId,
                                                listSubUser[i].id ?? -1,
                                                roleId,
                                                nameJafa,
                                                listSubUser[i].name,
                                                listSubUser[i].avatar,
                                                listSubUser[i].gender,
                                                listSubUser[i].isRoot,
                                              );
                                            } else {
                                              _showModalTreeViewRequest(
                                                context,
                                                context.read<TreeViewCubit>(),
                                                genealogyId,
                                                listSubUser[i].id ?? -1,
                                              );
                                            }
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                image: DecorationImage(
                                                    fit: BoxFit.cover,
                                                    image: listSubUser[i]
                                                                .avatar !=
                                                            null
                                                        ? NetworkImage(
                                                            listSubUser[i]
                                                                .avatar!)
                                                        : const AssetImage(
                                                                "assets/images/user.png")
                                                            as ImageProvider<
                                                                Object>)),
                                          ),
                                        )),
                                    // Positioned(
                                    //     top: 30,
                                    //     left: 75,
                                    //     child: GestureDetector(
                                    //       onTap: () async {
                                    //         await context.router.push(
                                    //             CreateBranchViewRoute(
                                    //                 name: listSubUser[i]
                                    //                     .name,
                                    //                 avatar: listSubUser[i]
                                    //                     .avatar,
                                    //                 genealogyId:
                                    //                     genealogyId,
                                    //                 isRoot: listSubUser[i]
                                    //                     .isRoot,
                                    //                 roleId: roleId,
                                    //                 userGenealogyId:
                                    //                     listSubUser[i]
                                    //                             .id ??
                                    //                         -1));
                                    //       },
                                    //       child: Container(
                                    //         width: 40,
                                    //         height: 40,
                                    //         decoration: BoxDecoration(
                                    //           borderRadius:
                                    //               BorderRadius.circular(
                                    //                   50),
                                    //         ),
                                    //         child: const AssetImageView(
                                    //           fileName: 'ic_add.svg',
                                    //         ),
                                    //       ),
                                    //     ))
                                  ]),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(listSubUser[i].name ??
                                      StringConstants.nullName)
                                ])),
                    ]),
                  ],
                ),
              ));
        });
  }
}

Future<void> _showModalTreeViewRequest(BuildContext context,
    TreeViewCubit cubit, int genealogyId, int userGenealogyId) async {
  await showDialog(
    context: context,
    builder: (BuildContext context) {
      return PopupListActions(
        actions: [
          PopupListActionsItem(
            icon: Icons.share,
            title: StringConstants.requestAdmin,
            onTap: () async {
              // Navigator.of(context).pop();
              // cubit.treeRequest(
              //     userGenealogyId: userGenealogyId, genealogyId: genealogyId);
            },
          )
        ],
        title: StringConstants.doSomething,
      );
    },
  );
}
