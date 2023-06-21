import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:genealogy_management/app/core/values/string_constants.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../../core/values/text_styles.dart';
import '../../../core/widgets/asset_image/asset_image_view.dart';
import '../../../core/widgets/button/custom_close_button.dart';
import '../../../core/widgets/button/custom_icon_button.dart';
import '../cubit/tree_detail_cubit.dart';
import '../cubit/tree_detail_state.dart';

class ModalInviteFriends extends StatelessWidget {
  const ModalInviteFriends({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TreeDetailCubit, TreeDetailState>(
        builder: (context, state) {
      return GestureDetector(
        onTap: () => context.read<TreeDetailCubit>().changeShowInviteFriends(),
        child: Container(
            decoration:
                const BoxDecoration(color: Color.fromARGB(141, 133, 133, 133)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () => {},
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 255, 255, 255),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    width: 343,
                    height: 462,
                    child: Center(
                      child: Column(
                        children: [
                          Text(
                            StringConstants.invYourFriendToJafa,
                            style: TextStyles.medium16LineHeight24Sur,
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          RichText(
                            text: TextSpan(
                              text: '${StringConstants.showOrSendQrCode} ',
                              style: TextStyles.small12LineHeight18BlackSur,
                              children: <TextSpan>[
                                TextSpan(
                                    text: '${state.treeDetail!.name}',
                                    style:
                                        TextStyles.small12LineHeight18RedSur),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            height: 222,
                            alignment: Alignment.center,
                            padding: const EdgeInsets.all(16),
                            decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 237, 237, 237),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: QrImageView(
                                data: state.treeDetail!.id.toString(),
                                version: QrVersions.auto,
                                size: 190,
                                backgroundColor:
                                    const Color.fromARGB(255, 255, 255, 255)),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomIconButton(
                                icon: const AssetImageView(
                                  fileName: 'ic_copy_link.svg',
                                ),
                                name: StringConstants.copyLink,
                                onTap: () {},
                              ),
                              CustomIconButton(
                                icon: const AssetImageView(
                                  fileName: 'ic_share.svg',
                                ),
                                name: StringConstants.share,
                                onTap: () {},
                              ),
                              CustomIconButton(
                                icon: const AssetImageView(
                                  fileName: 'ic_download.svg',
                                ),
                                name: StringConstants.downLoad,
                                onTap: () {},
                              ),
                              CustomIconButton(
                                icon: const AssetImageView(
                                  fileName: 'ic_refresh.svg',
                                ),
                                name: StringConstants.reset,
                                onTap: () {},
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          const CustomCloseButton()
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )),
      );
    });
  }
}
