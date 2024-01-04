import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase/app/data/model/tree_view_model.dart';
import 'package:flutter_firebase/app/main_router.dart';
import 'package:flutter_firebase/app/modules/tree_view/cubit/tree_view_cubit.dart';

import '../../../core/widgets/asset_image/asset_image_view.dart';

class AloneUser extends StatelessWidget {
  const AloneUser(
      {super.key,
      required this.id,
      required this.name,
      this.avatar,
      required this.genealogyId,
      this.gender,
      this.onTap,
      required this.user});
  final String id;
  final String name;
  final String? avatar;
  final String? gender;
  final String genealogyId;
  final Function? onTap;
  final TreeViewModel user;
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
                          child: GestureDetector(
                            onTap: () {
                              onTap!();
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
                          child: GestureDetector(
                            onTap: () async {
                              await context.router.push(CreateBranchViewRoute(
                                  user: user,
                                  name: name,
                                  avatar: avatar,
                                  genealogyId: genealogyId,
                                  isRoot: true,
                                  roleId: 1,
                                  userGenealogyId: id));
                              await context.read<TreeViewCubit>().loadData();
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
