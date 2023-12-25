import 'package:flutter/material.dart';

import '../../../core/values/app_colors.dart';

class CustomCoupleCard extends StatelessWidget {
  const CustomCoupleCard(
      {super.key,
      this.onTap,
      this.avatar,
      required this.title,
      required this.subTitle,});
  final void Function()? onTap;
  final String? avatar;
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: avatar != null
                          ? DecorationImage(
                              image: NetworkImage(avatar!),
                              fit: BoxFit.cover,
                            )
                          : null,
                      color: AppColors.colorFFD9D9D9),
                  child: avatar == null
                      ? const Icon(
                          Icons.person_2,
                          size: 24,
                          color: Colors.white,
                        )
                      : null,
                ),
                const SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w500),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      subTitle,
                      style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: AppColors.colorFF313131),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 18)
      ],
    );
  }
}