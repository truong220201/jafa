import 'dart:math';

import 'package:flutter/material.dart';
import 'package:genealogy_management/app/core/values/app_colors.dart';
import 'package:graphview/GraphView.dart';

import '../../core/widgets/asset_image/asset_image_view.dart';

class TreeView extends StatefulWidget {
  const TreeView({
    Key? key,
  }) : super(key: key);

  @override
  State<TreeView> createState() => _TreeViewState();
}

class _TreeViewState extends State<TreeView> {
  @override
  void initState() {
    final node1 = Node.Id(1);
    final node2 = Node.Id(2);
    final node3 = Node.Id(3);
    final node4 = Node.Id(4);
    final node5 = Node.Id(5);
    final node6 = Node.Id(6);
    final node8 = Node.Id(7);
    final node7 = Node.Id(8);
    final node9 = Node.Id(9);
    final node10 = Node.Id(10);
    final node11 = Node.Id(11);
    final node12 = Node.Id(12);

    graph.addEdge(node1, node2);
    graph.addEdge(node1, node3, paint: Paint()..color = Colors.red);
    graph.addEdge(node1, node4, paint: Paint()..color = Colors.blue);
    graph.addEdge(node2, node5);
    graph.addEdge(node2, node6);
    graph.addEdge(node6, node7, paint: Paint()..color = Colors.red);
    graph.addEdge(node6, node8, paint: Paint()..color = Colors.red);
    graph.addEdge(node4, node9);
    graph.addEdge(node4, node10, paint: Paint()..color = Colors.black);
    graph.addEdge(node4, node11, paint: Paint()..color = Colors.red);
    graph.addEdge(node11, node12);

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
        body: Container(
          child: InteractiveViewer(
              constrained: false,
              boundaryMargin: const EdgeInsets.all(100),
              minScale: 0.001,
              maxScale: 2.5,
              child: GraphView(
                graph: graph,
                algorithm:
                    BuchheimWalkerAlgorithm(builder, TreeEdgeRenderer(builder)),
                paint: Paint()
                  ..color = Colors.green
                  ..strokeWidth = 1
                  ..style = PaintingStyle.stroke,
                builder: (Node node) {
                  // I can decide what widget should be shown here based on the id
                  var a = node.key!.value as int;
                  return rectangleWidget(a);
                },
              )),
        ),
      ),
    );
  }

  Random r = Random();

  Widget rectangleWidget(int a) {
    return InkWell(
      onTap: () {
        print('clicked');
      },
      child: a % 2 != 0
          ? SingleUser()
          : ListSubUser(
              userInfo: ['a', 'b', 'c'],
            ),
    );
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
          const Text('Node name')
        ]));
  }
}

class ListSubUser extends StatelessWidget {
  const ListSubUser({super.key, required this.userInfo});
  final List<String> userInfo;

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
                          Text('Node $i')
                        ]),
                  ),
              ]),
            ],
          ),
        ));
  }
}
