import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:genealogy_management/app/core/values/app_colors.dart';

import '../../../core/values/text_styles.dart';

// ignore: must_be_immutable
class CartWidget extends StatelessWidget {
  CartWidget(
      {super.key,
      required this.icon,
      required this.title,
      this.content,
      required this.onTap});
  SvgPicture? icon;
  String? title;
  String? content;
  Function onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        //onTap
        decoration: BoxDecoration(
            border: Border.all(width: 0, color: AppColors.colorFFFFFFFF)),
        padding: const EdgeInsets.symmetric(vertical: 10),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: icon,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                title != null
                    ? Text(
                        title!,
                        style: TextStyles.medium16LineHeight24Sur,
                      )
                    : Container(),
                content != null
                    ? Text(
                        content!,
                        style: TextStyles.small12LineHeight18BlackSur,
                      )
                    : Container()
              ],
            ),
          ),
          SvgPicture.asset(
            "assets/images/iconMore.svg",
          ),
        ]),
      ),
    );
  }
}
