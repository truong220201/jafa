import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:genealogy_management/app/modules/tree_view/cubit/tree_view_state.dart';
import 'package:genealogy_management/app/modules/tree_view/repository/tree_view_repository.dart';
import 'package:graphview/GraphView.dart';
import '../../../core/values/string_constants.dart';
import '../../../core/widgets/appBar/custom_appbar.dart';
import '../../../core/widgets/asset_image/asset_image_view.dart';
import '../../../core/widgets/popup/popup_list_actions.dart';
import '../../../core/widgets/popup/popup_notice.dart';
import '../../../data/model/tree_view_model.dart';
import '../../../main_router.dart';
import '../cubit/tree_view_cubit.dart';
import '../widgets/modal_menu.dart';

class TreeView extends StatefulWidget {
  const TreeView({Key? key, required this.idTree, required this.roleId})
      : super(key: key);
  final int idTree;
  final int roleId;
  @override
  State<TreeView> createState() => _TreeViewState();
}

class _TreeViewState extends State<TreeView> {
  @override
  void initState() {
    super.initState();

    builder
      ..siblingSeparation = (100)
      ..levelSeparation = (150)
      ..subtreeSeparation = (150)
      ..orientation = (BuchheimWalkerConfiguration.ORIENTATION_TOP_BOTTOM);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: CustomAppBar(
              leadingWidth: 70,
              leading: SizedBox(
                width: 16,
                height: 16,
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
              title: StringConstants.phoenix,
              actions: [
                IconButton(
                  iconSize: 40,
                  onPressed: () async {
                    await context.router.push(const ScanQRViewRoute());
                  },
                  icon: SvgPicture.asset(
                    "assets/images/ic_search.svg",
                  ),
                ),
                IconButton(
                  iconSize: 40,
                  onPressed: () async {
                    await context.router.push(const ScanQRViewRoute());
                  },
                  icon: SvgPicture.asset(
                    "assets/images/ic_filter.svg",
                  ),
                )
              ],
            ),
            body: BlocProvider(
                create: (context) => TreeViewCubit(
                    context.read<TreeViewRepository>(), widget.idTree)
                  ..initData(),
                child: MultiBlocListener(
                  listeners: [
                    BlocListener<TreeViewCubit, TreeViewState>(
                      listenWhen: (previous, current) =>
                          previous.requestDone != current.requestDone,
                      listener: (context, state) async {
                        if (state.requestDone) {
                          await showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return PopupNotice(
                                  title: StringConstants.requestAdmin2,
                                  content: state.messageTreeRequest,
                                  textButton: StringConstants.close,
                                );
                              });
                        }
                      },
                    ),
                  ],
                  child: Stack(
                    children: [
                      BlocBuilder<TreeViewCubit, TreeViewState>(
                          builder: (context, state) {
                        if (state.treeViewModel!.isNotEmpty) {
                          // context.read<TreeViewCubit>().changeData();
                          // List<Couple> arrCouple = [];
                          for (int i = 0;
                              i < state.treeViewModel!.length;
                              i++) {
                            if (state
                                .treeViewModel![i].childrenParrent.isNotEmpty) {
                              // context.read<TreeViewCubit>().changeAloneUser();
                              for (int j = 0;
                                  j <
                                      state.treeViewModel![i].childrenParrent
                                          .length;
                                  j++) {
                                if (state.treeViewModel![i].childrenParrent[j]
                                        .relationType ==
                                    'dad') {
                                  //debugPrint(listTreeView[i].childrenParrent![j].id.toString());

                                  graph.addEdge(
                                      Node.Id(state.treeViewModel![i].id),
                                      Node.Id(state.treeViewModel![i]
                                          .childrenParrent[j].id));
                                  Node.Id(state
                                      .treeViewModel![i].childrenParrent[j].id);
                                } else if (state.treeViewModel![i]
                                        .childrenParrent[j].relationType ==
                                    'couple') {}
                              }
                            }
                          }
                          //context.read<TreeViewCubit>().setArrCouple(arrCouple);
                          // debugPrint(arrCouple.toString());
                        }
                        return state.hasData
                            ? !state.aloneUser
                                ? InteractiveViewer(
                                    constrained: false,
                                    boundaryMargin: const EdgeInsets.all(10000),
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    minScale: 0.05,
                                    maxScale: 50,
                                    child: GraphView(
                                      graph: graph,
                                      algorithm: BuchheimWalkerAlgorithm(
                                          builder, TreeEdgeRenderer(builder)),
                                      paint: Paint()
                                        ..color = const Color.fromARGB(
                                            255, 33, 33, 33)
                                        ..strokeWidth = 2
                                        ..style = PaintingStyle.stroke,
                                      builder: (Node node) {
                                        // I can decide what widget should be shown here based on the id
                                        var a = node.key!.value as int;
                                        return rectangleWidget(a);
                                      },
                                    ))
                                : Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      AloneUser(
                                          genealogyId: widget.idTree,
                                          id: state.treeViewModel![0].id!,
                                          name: state.treeViewModel![0].name!,
                                          avatar: state
                                                  .treeViewModel![0].avatar ??
                                              'https://antimatter.vn/wp-content/uploads/2022/10/hinh-anh-gai-xinh-de-thuong.jpg'),
                                    ],
                                  )
                            : const Center(child: CircularProgressIndicator());
                      }),
                      BlocBuilder<TreeViewCubit, TreeViewState>(
                          builder: (context, state) {
                        return state.showModal
                            ? const Positioned(
                                child: Align(
                                    alignment: Alignment.topRight,
                                    child: ModalMenu()),
                              )
                            : Container();
                      }),
                    ],
                  ),
                ))));
  }

  Widget rectangleWidget(int a) {
    return BlocSelector<TreeViewCubit, TreeViewState, List<Couple>?>(
        selector: (state) => state.arrCouple!,
        builder: (context, state) {
          for (int i = 0; i < state!.length; i++) {
            if (a == state[i].idaPerson) {
//debugPrint('-----------$i${state[i].listIdvk}');
              return InkWell(
                onTap: () {
                  if (widget.roleId < 4) {
                    _showModalTreeDetail(
                        context,
                        widget.idTree,
                        a,
                        widget.roleId,
                        context.read<TreeViewCubit>().getinfPerSon(a).name,
                        context.read<TreeViewCubit>().getinfPerSon(a).avatar,
                        context.read<TreeViewCubit>().getinfPerSon(a).isRoot);
                  } else {
                    _showModalTreeViewRequest(context,
                        context.read<TreeViewCubit>(), widget.idTree, a);
                  }
                },
                child: ListSubUser(
                    userInfo: state[i],
                    roleId: widget.roleId,
                    genealogyId: widget.idTree),
              );
            }
          }
          return InkWell(
              onTap: () {
                if (widget.roleId < 4) {
                  _showModalTreeDetail(
                      context,
                      widget.idTree,
                      a,
                      widget.roleId,
                      context.read<TreeViewCubit>().getinfPerSon(a).name,
                      context.read<TreeViewCubit>().getinfPerSon(a).avatar,
                      context.read<TreeViewCubit>().getinfPerSon(a).isRoot);
                } else {
                  _showModalTreeViewRequest(
                      context, context.read<TreeViewCubit>(), widget.idTree, a);
                }
              },
              child: SingleUser(
                id: a,
                genealogyId: widget.idTree,
                roleId: widget.roleId,
              ));
        });
  }

  final Graph graph = Graph()..isTree = true;

  BuchheimWalkerConfiguration builder = BuchheimWalkerConfiguration();

  Widget createNode(String nodeText) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.red,
        border: Border.all(color: Colors.white, width: 1),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Center(
        child: Text(
          nodeText,
          style: const TextStyle(fontSize: 10),
        ),
      ),
    );
  }
}

class AloneUser extends StatelessWidget {
  const AloneUser(
      {super.key,
      required this.id,
      required this.name,
      this.avatar,
      required this.genealogyId});
  final int id;
  final String name;
  final String? avatar;
  final int genealogyId;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(16),
        // decoration: BoxDecoration(
        //     borderRadius: BorderRadius.circular(4), border: Border.all()),
        child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 20),
                    width: 150,
                    child: Stack(children: [
                      SizedBox(
                          width: 100,
                          height: 100,
                          child: InkWell(
                            onTap: () {
                              _showModalTreeDetail(context, genealogyId, id, 1,
                                  name, avatar, true);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: avatar != null
                                          ? NetworkImage(avatar!)
                                          : const AssetImage(
                                                  "assets/images/user.png")
                                              as ImageProvider<Object>)),
                            ),
                          )),
                      Positioned(
                          top: 30,
                          left: 75,
                          child: InkWell(
                            onTap: () async {
                              await context.router.push(CreateBranchViewRoute(
                                  name: name,
                                  avatar: avatar,
                                  genealogyId: genealogyId,
                                  isRoot: true,
                                  roleId: 1,
                                  userGenealogyId: id));
                            },
                            child: Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
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
              Text(name)
            ]));
  }
}

class SingleUser extends StatelessWidget {
  const SingleUser(
      {super.key,
      required this.id,
      required this.roleId,
      required this.genealogyId});
  final int id;
  final int roleId;
  final int genealogyId;

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
                        Container(
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
                                          image: user.avatar != null
                                              ? NetworkImage(user.avatar!)
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
                                  child: InkWell(
                                    onTap: () async => await context.router
                                        .push(CreateBranchViewRoute(
                                            name: user.name,
                                            avatar: user.avatar,
                                            genealogyId: genealogyId,
                                            isRoot: user.isRoot,
                                            roleId: roleId,
                                            userGenealogyId: id)),
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
                    Text('${user.name}')
                  ]));
        });
  }
}

class ListSubUser extends StatelessWidget {
  const ListSubUser(
      {super.key,
      required this.userInfo,
      required this.roleId,
      required this.genealogyId});
  final Couple userInfo;
  final int roleId;
  final int genealogyId;

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
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  image: DecorationImage(
                                                      fit: BoxFit.cover,
                                                      image: user.avatar != null
                                                          ? NetworkImage(
                                                              user.avatar!)
                                                          : const AssetImage(
                                                                  "assets/images/user.png")
                                                              as ImageProvider<
                                                                  Object>)),
                                            )),
                                        Positioned(
                                            top: 30,
                                            left: 75,
                                            child: InkWell(
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
                                Text(' ${user.name}')
                              ])),
                      for (int i = 0; i < numberUser; i++)
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
                                      //vo
                                      SizedBox(
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
                                              )),
                                          Positioned(
                                              top: 30,
                                              left: 75,
                                              child: InkWell(
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
                                                        BorderRadius.circular(
                                                            50),
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
                                  Text('${listSubUser[i].name}')
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
              Navigator.of(context).pop();
              cubit.treeRequest(
                  userGenealogyId: userGenealogyId, genealogyId: genealogyId);
            },
          )
        ],
        title: StringConstants.doSomething,
      );
    },
  );
}

Future<void> _showModalTreeDetail(
    BuildContext context,
    int genealogyId,
    int userGenealogyId,
    int roleId,
    String? name,
    String? avatar,
    bool isRoot) async {
  await showDialog(
    context: context,
    builder: (BuildContext context) {
      return PopupListActions(
        actions: [
          PopupListActionsItem(
            icon: Icons.edit_square,
            title: StringConstants.editBranch,
            onTap: () async {
              Navigator.of(context).pop();
              await context.router.push(EditBranchViewRoute(
                  roleId: roleId,
                  genealogyId: genealogyId,
                  userGenealogyId: userGenealogyId));
            },
          ),
          PopupListActionsItem(
            icon: Icons.share,
            title: StringConstants.addMember,
            onTap: () {},
          ),
          PopupListActionsItem(
            iconWidget: SvgPicture.asset(
              "assets/images/ic_path.svg",
            ),
            icon: Icons.edit_square,
            title: StringConstants.addBranch,
            onTap: () async {
              Navigator.of(context).pop();
              await context.router.push(CreateBranchViewRoute(
                  name: name,
                  avatar: avatar,
                  genealogyId: genealogyId,
                  isRoot: isRoot,
                  roleId: roleId,
                  userGenealogyId: userGenealogyId));
            },
          ),
          PopupListActionsItem(
            icon: Icons.delete,
            title: StringConstants.deleteBranch,
            onTap: () {},
          ),
        ],
        title: StringConstants.doSomething,
      );
    },
  );
}
