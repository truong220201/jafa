import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/values/string_constants.dart';
import '../../../core/values/text_styles.dart';
import '../../../core/widgets/asset_image/asset_image_view.dart';
import '../../../core/widgets/popup/popup_list_actions.dart';

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
                              // await context.router.push(CreateBranchViewRoute(
                              //     name: name,
                              //     avatar: avatar,
                              //     genealogyId: genealogyId,
                              //     isRoot: true,
                              //     roleId: 1,
                              //     userGenealogyId: id));
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
              Text(
                name ?? StringConstants.nullName,
                style: TextStyles.mediumBlackS20,
              )
            ]));
  }
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
              // Navigator.of(context).pop();
              // await context.router.push(EditBranchViewRoute(
              //     roleId: roleId,
              //     genealogyId: genealogyId,
              //     userGenealogyId: userGenealogyId));
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
              // await context.router.push(CreateBranchViewRoute(
              //     name: name,
              //     avatar: avatar,
              //     genealogyId: genealogyId,
              //     isRoot: isRoot,
              //     roleId: roleId,
              //     userGenealogyId: userGenealogyId));
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
