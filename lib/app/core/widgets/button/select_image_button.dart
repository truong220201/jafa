import 'dart:io';

import 'package:flutter/material.dart';

import '../../values/app_colors.dart';

class SelectImageButton extends StatelessWidget {
  const SelectImageButton(
      {super.key,
      this.onTap,
      this.avatar,
      this.backgroundColor = AppColors.colorFFEFF1F3,
      this.iconColor = AppColors.colorFF606060});
  final void Function()? onTap;
  final String? avatar;
  final Color backgroundColor;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: (avatar == null || avatar!.isEmpty)
          ? Container(
              decoration:
                  BoxDecoration(color: backgroundColor, shape: BoxShape.circle),
              height: 100,
              child: Icon(
                Icons.camera_alt,
                color: iconColor,
                size: 32,
              ),
            )
          : Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: FileImage(
                    File(avatar!),
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
    );
  }
}
