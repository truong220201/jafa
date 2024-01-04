import 'package:flutter/material.dart';

import '../../values/app_colors.dart';
import '../../values/text_styles.dart';

class PopupListActions extends StatelessWidget {
  const PopupListActions({
    super.key,
    required this.title,
    required this.actions,
    this.content,
  });
  final String title;
  final List<Widget> actions;
  final Widget? content;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      title: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyles.mediumMBlackS18,
      ),
      content: content,
      actions: actions,
    );
  }
}

class PopupListActionsItem extends StatelessWidget {
  const PopupListActionsItem({
    super.key,
    required this.icon,
    this.onTap,
    required this.title,
    this.iconWidget,
  });

  final IconData icon;
  final Widget? iconWidget;
  final void Function()? onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Row(children: [
          iconWidget ??
              Icon(
                icon,
                size: 24,
                color: AppColors.colorFF000000,
              ),
          const SizedBox(width: 8),
          SizedBox(
            width: 200,
            child: Text(
              title,
              style: TextStyles.boldBlackS16.copyWith(
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          const SizedBox(width: 8),
          const Icon(
            Icons.arrow_forward_ios,
            size: 18,
            color: AppColors.colorFF313131,
          ),
        ]),
      ),
    );
  }
}
