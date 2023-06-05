import 'dart:io';

import 'package:flutter/material.dart';

import '../../values/app_colors.dart';

class SelectImageButton extends StatelessWidget {
  const SelectImageButton({super.key, this.onTap, this.avatar});
  final void Function()? onTap;
  final String? avatar;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: (avatar == null || avatar!.isEmpty)
          ? Container(
              decoration: const BoxDecoration(
                  color: AppColors.colorFFEFF1F3, shape: BoxShape.circle),
              height: 100,
              child: const Icon(
                Icons.camera_alt,
                color: AppColors.colorFF606060,
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
