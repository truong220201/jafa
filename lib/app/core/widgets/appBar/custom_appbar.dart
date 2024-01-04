// ignore: file_names
import 'package:flutter/material.dart';
import '../../values/app_colors.dart';
import '../../values/text_styles.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.leadingWidth = 40,
    this.leading,
    this.actions,
    required this.title,
    this.backgroundColor = AppColors.colorFF940000,
    this.titleStyle = TextStyles.mediumBlackS20,
  });
  final double leadingWidth;
  final String title;
  final Widget? leading;
  final List<Widget>? actions;
  final Color backgroundColor;
  final TextStyle titleStyle;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: leadingWidth,
      leading: leading,
      title: Text(
        title,
        style: titleStyle,
      ),
      actions: actions,
      backgroundColor: backgroundColor,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class CustomAppbarItem extends StatelessWidget {
  const CustomAppbarItem(
      {super.key,
      this.onPressed,
      this.background = AppColors.colorFFFBEFEF,
      this.iconSize,
      required this.icon,
      this.iconColor = AppColors.colorFF940000,
      this.width = 40});
  final void Function()? onPressed;
  final Color background;
  final Color iconColor;
  final double? iconSize;
  final IconData icon;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: background,
        ),
        child: IconButton(
          color: iconColor,
          onPressed: onPressed,
          icon: Icon(
            icon,
            size: iconSize,
          ),
        ));
  }
}
