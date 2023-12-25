import 'package:flutter/material.dart';

import '../../values/app_colors.dart';
import '../../values/text_styles.dart';
import '../button/primary_button.dart';

class PopupPrimary extends StatelessWidget {
  const PopupPrimary(
      {super.key,
      required this.title,
      required this.titleButton1,
      this.titleButton2 = 'Cancel',
      required this.onTap,
      required this.content});
  final String title;
  final String content;
  final String titleButton1;
  final String titleButton2;
  final void Function() onTap;

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
      content: Text(
        content,
        textAlign: TextAlign.center,
        style: TextStyles.size14,
      ),
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        Column(
          children: [
            PrimaryButton(
              onTap: onTap,
              title: titleButton1,
              backgroundColor: AppColors.colorFF940000,
              textColor: AppColors.colorFFFFFFFF,
              textSize: 16,
              borderColor: AppColors.colorFF940000,
              textWeight: FontWeight.w600,
            ),
            const SizedBox(
              height: 12,
            ),
            PrimaryButton(
              onTap: () {
                Navigator.of(context).pop();
              },
              title: titleButton2,
              borderColor: AppColors.colorFFD0D5DD,
              backgroundColor: AppColors.colorFFFFFFFF,
              textColor: AppColors.colorFF344054,
              textSize: 16,
              textWeight: FontWeight.w600,
            ),
          ],
        ),
      ],
    );
  }
}
