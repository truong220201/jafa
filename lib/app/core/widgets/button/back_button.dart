import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../values/app_colors.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          backgroundColor: AppColors.colorFFFBEFEF,
          padding: const EdgeInsets.all(16),
        ),
        onPressed: () async {
          await context.router.pop();
        },
        child: const Icon(
          Icons.arrow_back_outlined,
          size: 46,
          color: AppColors.colorFF940000,
        ),
      ),
    );
  }
}
