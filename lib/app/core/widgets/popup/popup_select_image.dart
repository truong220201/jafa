import 'package:flutter/material.dart';

import '../../values/app_colors.dart';
import '../../values/string_constants.dart';
import '../button/custom_buttom.dart';

class PopupSelectImage extends StatelessWidget {
  const PopupSelectImage(
      {super.key, required this.onTap1, required this.onTap2});
  final void Function() onTap1;
  final void Function() onTap2;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButton(
              width: 120,
              backgroundColor: AppColors.colorFFFFFFFF,
              onTap: onTap1,
              textColor: AppColors.colorFF000000,
              textSize: 16,
              title: StringConstants.selectImage,
              icon: const Icon(Icons.image),
            ),
            const SizedBox(
              width: 40,
            ),
            CustomButton(
              width: 120,
              icon: const Icon(Icons.camera_alt),
              backgroundColor: AppColors.colorFFFFFFFF,
              onTap: onTap2,
              textColor: AppColors.colorFF000000,
              textSize: 16,
              title: StringConstants.takeImage,
            ),
          ],
        ),
        const SizedBox(
          height: 40,
        ),
      ],
    );
  }
}
