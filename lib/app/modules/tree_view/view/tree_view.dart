import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase/app/main_router.dart';
import 'package:flutter_firebase/app/modules/tree_view/cubit/tree_view_state.dart';
import 'package:flutter_firebase/app/modules/tree_view/repository/tree_view_repository.dart';
import 'package:flutter_firebase/app/modules/tree_view/widgets/search_popup.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graphview/GraphView.dart';
import '../../../core/values/app_colors.dart';
import '../../../core/values/string_constants.dart';
import '../../../core/widgets/appBar/custom_appbar.dart';
import '../../../core/widgets/popup/popup_list_actions.dart';
import '../../../core/widgets/popup/popup_notice.dart';
import '../../../data/model/tree_view_model.dart';
import '../cubit/tree_view_cubit.dart';
import '../widgets/alone_user.dart';
import '../widgets/list_sub_user.dart';
import '../widgets/modal_menu.dart';
import '../widgets/single_user.dart';

class TreeView extends StatefulWidget {
  const TreeView(
      {Key? key,
      required this.idTree,
      required this.roleId,
      required this.nameJafa})
      : super(key: key);
  final String idTree;
  final int roleId;
  final String nameJafa;
  @override
  State<TreeView> createState() => _TreeViewState();
}

class _TreeViewState extends State<TreeView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) =>
            TreeViewCubit(context.read<TreeViewRepository>(), widget.idTree)
              ..initData(),
        child: TreeViewPage(
          idTree: widget.idTree,
          roleId: widget.roleId,
          nameJafa: widget.nameJafa,
        ));
  }
}

class TreeViewPage extends StatefulWidget {
  const TreeViewPage(
      {Key? key,
      required this.idTree,
      required this.roleId,
      required this.nameJafa})
      : super(key: key);
  final String idTree;
  final int roleId;
  final String nameJafa;
  @override
  State<TreeViewPage> createState() => _TreeViewPageState();
}

class _TreeViewPageState extends State<TreeViewPage> {
  //late BuchheimWalkerConfiguration builder;
  BuchheimWalkerConfiguration builder = BuchheimWalkerConfiguration();
  List<UserNode> listNode = [];
  @override
  void initState() {
    super.initState();

    builder
      ..siblingSeparation = (100)
      ..levelSeparation = (150)
      ..subtreeSeparation = (150)
      ..orientation = (BuchheimWalkerConfiguration.ORIENTATION_TOP_BOTTOM);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Gọi hàm sau khi widget đã được render
      //context.read<TreeViewCubit>().addToNode(listNode);
      // Di chuyen toi user
    });
  }

  void addToNode(UserNode node) {
    listNode.add(node);
  }

  final Graph graph = Graph()..isTree = true;

  //--------------------------------------------------------------------------------------
  final TransformationController _transformationController =
      TransformationController();
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      key: _scaffoldKey,
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
        title: widget.nameJafa,
        actions: [
          BlocBuilder<TreeViewCubit, TreeViewState>(builder: (context, state) {
            return IconButton(
              iconSize: 40,
              onPressed: () {
                context.read<TreeViewCubit>().addToNode(listNode);
                context.read<TreeViewCubit>().changeShowSearch();
              },
              icon: SvgPicture.asset(
                "assets/images/ic_search.svg",
              ),
            );
          }),
          BlocBuilder<TreeViewCubit, TreeViewState>(builder: (context, state) {
            return IconButton(
              iconSize: 40,
              onPressed: () {
                context.read<TreeViewCubit>().changeModal();
              },
              icon: SvgPicture.asset(
                "assets/images/ic_filter.svg",
              ),
            );
          })
        ],
      ),
      body: MultiBlocListener(
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
                for (int i = 0; i < state.treeViewModel!.length; i++) {
                  if (state.treeViewModel![i].childrenParrent.isNotEmpty) {
                    // context.read<TreeViewCubit>().changeAloneUser();
                    for (int j = 0;
                        j < state.treeViewModel![i].childrenParrent.length;
                        j++) {
                      if (state.treeViewModel![i].childrenParrent[j]
                              .relationType ==
                          'dad') {
                        //debugPrint(listTreeView[i].childrenParrent![j].id.toString());
                        Node.Id(state.treeViewModel![i].childrenParrent[j].id);
                        graph.addEdge(
                            Node.Id(state.treeViewModel![i].id),
                            Node.Id(
                                state.treeViewModel![i].childrenParrent[j].id));
                      }
                    }
                  }
                }
              }
              if (state.searchPosition != null) {
                context.read<TreeViewCubit>().zoomToPosition(
                    state.searchPosition!, _transformationController);
              }
              return state.hasData
                  ? !state.aloneUser
                      ? InteractiveViewer(
                          transformationController: _transformationController,
                          constrained: false,
                          boundaryMargin: const EdgeInsets.all(1000),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          //boundaryMargin: EdgeInsets.all(20.0),
                          minScale: 0.1,
                          maxScale: 2.0,
                          child: GraphView(
                            graph: graph,
                            algorithm: BuchheimWalkerAlgorithm(
                                builder, TreeEdgeRenderer(builder)),
                            paint: Paint()
                              ..color = const Color.fromARGB(255, 33, 33, 33)
                              ..strokeWidth = 2
                              ..style = PaintingStyle.stroke,
                            builder: (Node node) {
                              UserNode a = UserNode(
                                  userId: node.key!.value,
                                  userPosition: node.position);
                              // debugPrint('a:' + a.toString());
                              addToNode(a);
                              // debugPrint('node----------' + node.toString());
                              return rectangleWidget(node);
                            },
                          ))
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            AloneUser(
                                user: state.treeViewModel![0],
                                genealogyId: widget.idTree,
                                id: state.treeViewModel![0].id!,
                                name: state.treeViewModel![0].name!,
                                onTap: () async => await showModalTreeDetail(
                                      context,
                                      widget.idTree,
                                      state.treeViewModel![0].id!,
                                      1,
                                      state.treeViewModel![0].name!,
                                      state.treeViewModel![0].image!,
                                      state.treeViewModel![0].gender!,
                                      widget.nameJafa,
                                      true,
                                    ),
                                avatar: state.treeViewModel![0].image ??
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
                          alignment: Alignment.topRight, child: ModalMenu()),
                    )
                  : Container();
            }),
            BlocBuilder<TreeViewCubit, TreeViewState>(
                builder: (context, state) {
              return state.showSearch
                  ? Positioned(
                      child: Align(
                          child: SearchPopup(
                        transformationController: _transformationController,
                      )),
                    )
                  : Container();
            }),
            Positioned(
                top: 670,
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  width: 500,
                  decoration:
                      const BoxDecoration(color: AppColors.colorFFFFFFFF),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 80,
                      ),
                      const Text('Chạm để quay về vị trí bản thân'),
                      IconButton(
                        iconSize: 40,
                        onPressed: () {
                          context.read<TreeViewCubit>().addToNode(listNode);
                          context
                              .read<TreeViewCubit>()
                              .getMainUserLocation(_transformationController);
                        },
                        icon: SvgPicture.asset(
                          "assets/images/ic_scan.svg",
                        ),
                      ),
                    ],
                  ),
                ))
          ],
        ),
      ),
    ));
  }

  Widget rectangleWidget(Node node) {
    String a = node.key!.value as String;
    return BlocSelector<TreeViewCubit, TreeViewState, List<Couple>?>(
        selector: (state) => state.arrCouple!,
        builder: (context, state) {
          for (int i = 0; i < state!.length; i++) {
            if (a == state[i].idaPerson) {
//debugPrint('-----------$i${state[i].listIdvk}');
              return InkWell(
                onTap: () {
                  if (widget.roleId < 4) {
                    showModalTreeDetail(
                      context,
                      widget.idTree,
                      a,
                      widget.roleId,
                      widget.nameJafa,
                      context.read<TreeViewCubit>().getinfPerSon(a).name,
                      context.read<TreeViewCubit>().getinfPerSon(a).image,
                      context.read<TreeViewCubit>().getinfPerSon(a).gender,
                      context.read<TreeViewCubit>().getinfPerSon(a).isRoot,
                    );
                  } else {
                    showModalTreeViewRequest(context,
                        context.read<TreeViewCubit>(), widget.idTree, a);
                  }
                },
                child: ListSubUser(
                    nameJafa: widget.nameJafa,
                    userInfo: state[i],
                    roleId: widget.roleId,
                    genealogyId: widget.idTree),
              );
            }
          }
          return InkWell(
              onTap: () {
                if (widget.roleId < 4) {
                  showModalTreeDetail(
                      context,
                      widget.idTree,
                      a,
                      widget.roleId,
                      widget.nameJafa,
                      context.read<TreeViewCubit>().getinfPerSon(a).name,
                      context.read<TreeViewCubit>().getinfPerSon(a).gender,
                      context.read<TreeViewCubit>().getinfPerSon(a).image,
                      context.read<TreeViewCubit>().getinfPerSon(a).isRoot);
                } else {
                  showModalTreeViewRequest(
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

Future<void> showModalTreeViewRequest(BuildContext context, TreeViewCubit cubit,
    String genealogyId, String userGenealogyId) async {
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

Future<void> showModalTreeDetail(
    BuildContext context,
    String genealogyId,
    String userGenealogyId,
    int roleId,
    String nameJafa,
    String? name,
    String? avatar,
    String? gender,
    bool isRoot) async {
  final type = await showDialog<PopupListActionType>(
    context: context,
    builder: (BuildContext context) {
      return PopupListActions(
        actions: PopupListActionType.values
            .map((e) => PopupListActionsItem(
                  icon: e.icon,
                  title: e.title,
                  iconWidget: e.iconWidget,
                  onTap: () => Navigator.of(context).pop(e),
                ))
            .toList(),
        title: name ?? StringConstants.doSomething,
        content: Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.colorFFD9D9D9,
            image: avatar != null
                ? DecorationImage(
                    image: NetworkImage(avatar),
                    // fit: BoxFit.fill,
                  )
                : null,
          ),
          child: avatar == null
              ? const Icon(
                  Icons.person,
                  size: 100,
                  color: Colors.white,
                )
              : null,
        ),
      );
    },
  );

  if (type == null) return;

  switch (type) {
    case PopupListActionType.edit:
      // ignore: use_build_context_synchronously
      await context.router.push(EditBranchViewRoute(
          roleId: roleId,
          genealogyId: genealogyId,
          userGenealogyId: userGenealogyId));
      // ignore: use_build_context_synchronously
      // context.read<TreeViewCubit>().initData();
      break;
    case PopupListActionType.addMeber:
      // ignore: use_build_context_synchronously
      await context.router.push(SelectMemberToBranchViewRoute(
        idJafa: genealogyId,
        roleId: roleId,
        nameJafa: nameJafa,
      ));
      // ignore: use_build_context_synchronously
      // context.read<TreeViewCubit>().initData();
      break;
    case PopupListActionType.addBranch:
      break;
    case PopupListActionType.deleteBranch:
      break;
  }
}

// [
//           PopupListActionsItem(
//             icon: Icons.edit_square,
//             title: StringConstants.editBranch,
//             onTap: () async {
//               Navigator.of(context).pop();
//               // await context.router.push(EditMemberRoleViewRoute(
//               //     userId: userGenealogyId,
//               //     roleId: roleId,
//               //     genealogyId: genealogyId));
//               await context.router.push(EditBranchViewRoute(
//                   roleId: roleId,
//                   genealogyId: genealogyId,
//                   userGenealogyId: userGenealogyId));
//             },
//           ),
//           PopupListActionsItem(
//             icon: Icons.share,
//             title: StringConstants.addMember,
//             onTap: () async {
//               Navigator.of(context).pop();
//               // await Future.delayed(const Duration(seconds: 2));
//               // cubit.changeShowInviteFriends(userGenealogyId);
//               Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                       builder: (context) => SelectMemberToBranchView(
//                             idJafa: genealogyId,
//                             roleId: roleId,
//                             nameJafa: nameJafa,
//                           )));
//             },
//           ),
//           PopupListActionsItem(
//             iconWidget: SvgPicture.asset(
//               "assets/images/ic_path.svg",
//             ),
//             icon: Icons.edit_square,
//             title: StringConstants.addBranch,
//             onTap: () async {
//               Navigator.of(context).pop();
//               await context.router.push(CreateBranchViewRoute(
//                   name: name,
//                   avatar: avatar,
//                   genealogyId: genealogyId,
//                   isRoot: isRoot,
//                   roleId: roleId,
//                   userGenealogyId: userGenealogyId,
//                   gender: gender));
//             },
//           ),
//           PopupListActionsItem(
//             icon: Icons.delete,
//             title: StringConstants.deleteBranch,
//             onTap: () {},
//           ),
//         ]

enum PopupListActionType { edit, addMeber, addBranch, deleteBranch }

extension PopupListActionTypeX on PopupListActionType {
  IconData get icon {
    switch (this) {
      case PopupListActionType.edit:
        return Icons.edit_square;
      case PopupListActionType.addMeber:
        return Icons.share;
      case PopupListActionType.addBranch:
        return Icons.edit_square;
      case PopupListActionType.deleteBranch:
        return Icons.delete;
    }
  }

  String get title {
    switch (this) {
      case PopupListActionType.edit:
        return StringConstants.editBranch;
      case PopupListActionType.addMeber:
        return StringConstants.addMember;
      case PopupListActionType.addBranch:
        return StringConstants.addBranch;
      case PopupListActionType.deleteBranch:
        return StringConstants.deleteBranch;
    }
  }

  Widget? get iconWidget {
    switch (this) {
      case PopupListActionType.edit:
      case PopupListActionType.addMeber:
      case PopupListActionType.deleteBranch:
        return null;
      case PopupListActionType.addBranch:
        return SvgPicture.asset(
          "assets/images/ic_path.svg",
        );
    }
  }
}
