import 'package:flutter/material.dart';

import '../../values/app_colors.dart';
import '../../values/text_styles.dart';

class FloatingTextButton extends StatelessWidget {
  const FloatingTextButton(
      {super.key,
      this.onPressed,
      this.text,
      this.style = TextStyles.boldRedS20,
      required this.icon,
      this.iconSize = 40,
      this.width = 160,
      this.height = 120,
      required this.pass,
      this.loading});
  final void Function()? onPressed;
  final String? text;
  final TextStyle style;
  final bool pass;
  final IconData icon;
  final double iconSize;
  final double width;
  final double height;
  final Widget? loading;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          (text != null)
              ? Text(
                  text!,
                  style: style,
                )
              : const SizedBox(),
          const SizedBox(
            height: 4,
          ),
          SizedBox(
            width: 68,
            height: 68,
            child: FloatingActionButton(
              onPressed: onPressed,
              backgroundColor:
                  (pass) ? AppColors.colorFFB20000 : AppColors.colorFFF5F5F5,
              foregroundColor:
                  (pass) ? AppColors.colorFFFFFFFF : AppColors.colorFFC2C2C2,
              mini: false,
              child: loading ??
                  Icon(
                    icon,
                    size: iconSize,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
