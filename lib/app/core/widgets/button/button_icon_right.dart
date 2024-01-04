import 'package:flutter/material.dart';
import 'package:flutter_firebase/app/core/values/app_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../values/text_styles.dart';

class ButtonIconRight extends StatelessWidget {
  const ButtonIconRight({
    super.key,
    this.icon,
    required this.name,
    required this.onTap,
    this.colorTextIcon = AppColors.colorFFFFFFFF,
    this.bgColor,
    this.width = 140,
    this.height = 36,
    this.sizeText = 12,
    this.sizeIcon = 12,
    this.hasBorder = false,
    this.borderColor = AppColors.colorFFB20000,
  });
  final String? icon;
  final String name;
  final Function onTap;
  final Color colorTextIcon;
  final Color? bgColor;
  final double width;
  final double height;
  final double sizeText;
  final double sizeIcon;
  final bool hasBorder;
  final Color borderColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(50)),
          border:
              hasBorder ? Border.all(color: borderColor) : Border.all(width: 0),
          color: bgColor),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: InkWell(
            onTap: () => onTap(),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    name,
                    style: TextStyles.small12LineHeight18BlackSur
                        .copyWith(color: colorTextIcon, fontSize: sizeText),
                  ),
                  icon != null
                      ? Row(children: [
                          const SizedBox(
                            width: 5,
                          ),
                          SvgPicture.asset("assets/images/$icon.svg",
                              width: sizeIcon,
                              height: sizeIcon,
                              colorFilter: ColorFilter.mode(
                                  colorTextIcon, BlendMode.srcIn))
                        ])
                      : Container(),
                ])),
      ),
    );
  }
}
