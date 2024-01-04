import 'package:flutter/material.dart';

import '../../values/app_colors.dart';
import '../../values/text_styles.dart';

class SecondButton extends StatelessWidget {
  const SecondButton(
      {super.key,
      this.onTap,
      this.width = 106,
      this.height = 36,
      this.background = AppColors.colorFFB20000,
      required this.text,
      required this.icon});
  final void Function()? onTap;
  final double width;
  final double height;
  final Color background;
  final String text;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            color: background, borderRadius: BorderRadius.circular(18)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: TextStyles.mediumWhiteS14,
            ),
            const SizedBox(
              width: 7.25,
            ),
            icon,
          ],
        ),
      ),
    );
  }
}
