import 'package:flutter/material.dart';

import '../../../core/values/app_colors.dart';

class AddRelationItem extends StatelessWidget {
  const AddRelationItem({super.key, required this.title, this.onTap});

  final String title;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 15),
          decoration: const BoxDecoration(
            color: AppColors.colorFFFFFFFF,
            borderRadius: BorderRadius.all(Radius.circular(18)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Thông tin $title',
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.colorFF940000),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Chưa có $title',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.colorFF313131,
                    ),
                  )
                ],
              ),
              InkWell(
                onTap: onTap,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(24)),
                      color: AppColors.colorFFB20000),
                  child: Text(
                    "Thêm $title",
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppColors.colorFFFFFFFF,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 14)
      ],
    );
  }
}