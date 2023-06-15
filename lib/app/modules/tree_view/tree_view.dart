import 'dart:math';

import 'package:flutter/material.dart';
import 'package:genealogy_management/app/core/values/app_colors.dart';
import 'package:graphview/GraphView.dart';

import '../../core/widgets/asset_image/asset_image_view.dart';
import '../../data/model/tree_view_model.dart';
import 'create_branch_view.dart';

class MockTreeDetailRepository {
  List<TreeViewModel> _treeDetail = [];
  List<TreeViewModel> getTreeViewModel() {
    _treeDetail = [
      const TreeViewModel(
        id: 128,
        name: 'a',
        avatar: '',
        childrenParrent: [
          Parrent(id: 99, relationType: 'dad'),
          Parrent(id: 129, relationType: 'dad')
        ],
      ),
      const TreeViewModel(
        id: 99,
        name: 'a',
        avatar: '',
        childrenParrent: [
          Parrent(id: 127, relationType: 'dad'),
          Parrent(id: 130, relationType: 'couple'),
          Parrent(id: 131, relationType: 'couple'),
          Parrent(id: 132, relationType: 'dad')
        ],
      ),
      const TreeViewModel(
        id: 127,
        name: 'a',
        avatar: '',
        childrenParrent: [],
      ),
      const TreeViewModel(
        id: 129,
        name: 'a',
        avatar: '',
        childrenParrent: [],
      ),
      const TreeViewModel(
        id: 130,
        name: 'a',
        avatar: '',
        childrenParrent: [],
      ),
      const TreeViewModel(
        id: 131,
        name: 'a',
        avatar: '',
        childrenParrent: [],
      ),
      const TreeViewModel(
        id: 132,
        name: 'a',
        avatar: '',
        childrenParrent: [],
      ),
    ];
    return _treeDetail;
  }
}

class TreeView extends StatefulWidget {
  const TreeView({
    Key? key,
  }) : super(key: key);

  @override
  State<TreeView> createState() => _TreeViewState();
}

class _TreeViewState extends State<TreeView> {
  List arr = [];
  List<Couple> arrCouple = [];
  void initArray(int lengthArray) {
    final List<TreeViewModel> listTreeView =
        MockTreeDetailRepository().getTreeViewModel();

    for (int i = 0; i < listTreeView.length; i++) {
      arr.add(Node.Id(listTreeView[i].id));
    }
    for (int i = 0; i < listTreeView.length; i++) {
      if (listTreeView[i].childrenParrent!.isNotEmpty) {
        for (int j = 0; j < listTreeView[i].childrenParrent!.length; j++) {
          if (listTreeView[i].childrenParrent![j].relationType == 'dad') {
            //debugPrint(listTreeView[i].childrenParrent![j].id.toString());
            graph.addEdge(Node.Id(listTreeView[i].id),
                Node.Id(listTreeView[i].childrenParrent![j].id));
          } else if (listTreeView[i].childrenParrent![j].relationType ==
              'couple') {
            for (int q = 0; q < arrCouple.length; q++) {
              if (arrCouple[q].idaPerson == listTreeView[i].id) {
                // arrCouple[q]
                //     .listIdvk!
                //     .add(listTreeView[i].childrenParrent![j].id!);
                continue;
              }
            }
            arrCouple.add(Couple(idaPerson: listTreeView[i].id, listIdvk: [
              listTreeView[i].id!,
              listTreeView[i].childrenParrent![j].id!
            ]));
          }
        }
      }
    }
  }

  @override
  void initState() {
    super.initState();

    initArray(13);

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
        body: InteractiveViewer(
            constrained: false,
            boundaryMargin: const EdgeInsets.all(10000),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            minScale: 0.05,
            maxScale: 50,
            child: GraphView(
              graph: graph,
              algorithm:
                  BuchheimWalkerAlgorithm(builder, TreeEdgeRenderer(builder)),
              paint: Paint()
                ..color = const Color.fromARGB(255, 33, 33, 33)
                ..strokeWidth = 2
                ..style = PaintingStyle.stroke,
              builder: (Node node) {
                // I can decide what widget should be shown here based on the id
                var a = node.key!.value as int;

                return rectangleWidget(a);
              },
            )),
      ),
    );
  }

  Widget rectangleWidget(int a) {
    debugPrint('int a = ' + a.toString());
    for (int i = 0; i < arrCouple.length; i++) {
      if (a == arrCouple[i].idaPerson) {
        debugPrint(arrCouple[i].listIdvk.toString());
        return InkWell(
          onTap: () {
            print('clicked');
          },
          child: ListSubUser(
            userInfo: arrCouple[i].listIdvk!,
          ),
        );
      }
    }
    return InkWell(
        onTap: () {
          print('clicked');
        },
        child: SingleUser(
          name: a.toString(),
        ));
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

class SingleUser extends StatelessWidget {
  const SingleUser({super.key, required this.name});
  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Row(
            children: [
              const SizedBox(
                width: 30,
              ),
              SizedBox(
                width: 150,
                child: Stack(children: [
                  SizedBox(
                    width: 100,
                    height: 100,
                    child: CircleAvatar(
                      backgroundColor: Colors.grey,
                      child: FadeInImage.assetNetwork(
                        placeholder: "assets/images/user.png",
                        image:
                            'https://haycafe.vn/wp-content/uploads/2022/02/Anh-gai-xinh-cap-2-3-606x600.jpg',
                      ),
                    ),
                  ),
                  Positioned(
                      top: 30,
                      left: 75,
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: const AssetImageView(
                          fileName: 'ic_add.svg',
                        ),
                      ))
                ]),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Text('Node $name')
        ]));
  }
}

class ListSubUser extends StatelessWidget {
  const ListSubUser({super.key, required this.userInfo});
  final List<int> userInfo;

  @override
  Widget build(BuildContext context) {
    final int numberUser = userInfo.length;
    return Container(
        width: 150 + 150 * (numberUser - 1) * 2,
        //decoration: BoxDecoration(border: Border.all(width: 1)),
        alignment: Alignment.centerRight,
        child: SizedBox(
          // decoration: BoxDecoration(border: Border.all(width: 1)),
          width: numberUser * 150,
          child: Stack(
            children: [
              Row(children: <SizedBox>[
                for (int i = 0; i < numberUser; i++)
                  SizedBox(
                    width: 150,
                    // decoration: BoxDecoration(border: Border.all(width: 1)),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 100,
                            height: 100,
                            child: CircleAvatar(
                              backgroundColor: Colors.grey,
                              child: FadeInImage.assetNetwork(
                                placeholder: "assets/images/user.png",
                                image:
                                    'https://haycafe.vn/wp-content/uploads/2022/02/Anh-gai-xinh-cap-2-3-606x600.jpg',
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text('Node ${userInfo[i]}')
                        ]),
                  ),
              ]),
            ],
          ),
        ));
  }
}
