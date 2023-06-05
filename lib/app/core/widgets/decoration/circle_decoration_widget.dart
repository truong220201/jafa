import 'package:flutter/material.dart';
import '../../values/app_colors.dart';

class CircleDecorationWidget extends StatelessWidget {
  const CircleDecorationWidget(
      {super.key,
      this.top,
      this.bottom,
      this.left,
      this.right,
      this.width,
      this.height,
      this.color = AppColors.colorFFFBEFEF,
      this.borderRadius = const BorderRadius.all(Radius.circular(17))});
  final double? top;
  final double? bottom;
  final double? left;
  final double? right;
  final double? width;
  final double? height;
  final Color? color;
  final BorderRadiusGeometry? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: top,
        bottom: bottom,
        right: right,
        left: left,
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: color,
            borderRadius: borderRadius,
          ),
        ));
  }
}
