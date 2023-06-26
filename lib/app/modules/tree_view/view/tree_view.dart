import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:genealogy_management/app/core/values/text_styles.dart';
import 'package:genealogy_management/app/modules/tree_view/cubit/tree_view_state.dart';
import 'package:genealogy_management/app/modules/tree_view/repository/tree_view_repository.dart';
import 'package:genealogy_management/app/modules/tree_view/widgets/search_popup.dart';
import 'package:graphview/GraphView.dart';
import '../../../core/values/string_constants.dart';
import '../../../core/widgets/appBar/custom_appbar.dart';
import '../../../core/widgets/asset_image/asset_image_view.dart';
import '../../../core/widgets/popup/popup_list_actions.dart';
import '../../../core/widgets/popup/popup_notice.dart';
import '../../../data/model/tree_view_model.dart';
import '../../../main_router.dart';
import '../cubit/tree_view_cubit.dart';
import '../widgets/alone_user.dart';
import '../widgets/list_sub_user.dart';
import '../widgets/modal_menu.dart';
import '../widgets/single_user.dart';

class CustomBuchheimWalkerConfiguration extends BuchheimWalkerConfiguration {
  late Node _focusedNode;

  void setFocusedNode(Node node) {
    _focusedNode = node;
  }

  // Ghi đè phương thức getNodeSize() nếu cần thiết
}

class TreeView extends StatefulWidget {
  const TreeView(
      {Key? key,
      required this.idTree,
      required this.roleId,
      required this.nameJafa})
      : super(key: key);
  final int idTree;
  final int roleId;
  final String nameJafa;
  @override
  State<TreeView> createState() => _TreeViewState();
}

class _TreeViewState extends State<TreeView> {
  //late BuchheimWalkerConfiguration builder;
  @override
  void initState() {
    super.initState();

    builder
      ..siblingSeparation = (100)
      ..levelSeparation = (150)
      ..subtreeSeparation = (150)
      ..orientation = (BuchheimWalkerConfiguration.ORIENTATION_TOP_BOTTOM);
    //  onPanUpdate: (details) {
    //   var x = details.globalPosition.dx;
    //   var y = details.globalPosition.dy;
    //   setState(() {
    //     builder.setFocusedNode(graph.getNodeAtPosition(i));
    //     graph.getNodeAtPosition(i).position = Offset(x,y);
    //   });
    // },
  }

  final Graph graph = Graph()..isTree = true;

  CustomBuchheimWalkerConfiguration builder =
      CustomBuchheimWalkerConfiguration();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) =>
            TreeViewCubit(context.read<TreeViewRepository>(), widget.idTree)
              ..initData(),
        child: SafeArea(
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
                  title: widget.nameJafa,
                  actions: [
                    BlocBuilder<TreeViewCubit, TreeViewState>(
                        builder: (context, state) {
                      return GestureDetector(
                        onPanUpdate: (details) {
                          var x = details.globalPosition.dx;
                          var y = details.globalPosition.dy;
                          setState(() {
                            builder.setFocusedNode(graph.getNodeAtPosition(0));
                            graph.getNodeAtPosition(0).position = Offset(x, y);
                          });
                        },
                        child: IconButton(
                          iconSize: 40,
                          onPressed: () {
                            context.read<TreeViewCubit>().changeShowSearch();
                          },
                          icon: SvgPicture.asset(
                            "assets/images/ic_search.svg",
                          ),
                        ),
                      );
                    }),
                    BlocBuilder<TreeViewCubit, TreeViewState>(
                        builder: (context, state) {
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
                                }
                              }
                            }
                          }
                        }
                        return state.hasData
                            ? !state.aloneUser
                                ? InteractiveViewer(
                                    onInteractionStart: (details) {},
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
                            ? Positioned(
                                child: Align(
                                    alignment: Alignment.topRight,
                                    child: ModalMenu()),
                              )
                            : Container();
                      }),
                      BlocBuilder<TreeViewCubit, TreeViewState>(
                          builder: (context, state) {
                        return state.showSearch
                            ? const Positioned(
                                child: Align(child: SearchPopup()),
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
                  // if (widget.roleId < 4) {
                  //   _showModalTreeDetail(
                  //       context,
                  //       widget.idTree,
                  //       a,
                  //       widget.roleId,
                  //       context.read<TreeViewCubit>().getinfPerSon(a).name,
                  //       context.read<TreeViewCubit>().getinfPerSon(a).avatar,
                  //       context.read<TreeViewCubit>().getinfPerSon(a).isRoot);
                  // } else {
                  //   _showModalTreeViewRequest(context,
                  //       context.read<TreeViewCubit>(), widget.idTree, a);
                  // }
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
                // if (widget.roleId < 4) {
                //   _showModalTreeDetail(
                //       context,
                //       widget.idTree,
                //       a,
                //       widget.roleId,
                //       context.read<TreeViewCubit>().getinfPerSon(a).name,
                //       context.read<TreeViewCubit>().getinfPerSon(a).avatar,
                //       context.read<TreeViewCubit>().getinfPerSon(a).isRoot);
                // } else {
                //   _showModalTreeViewRequest(
                //       context, context.read<TreeViewCubit>(), widget.idTree, a);
                // }
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
