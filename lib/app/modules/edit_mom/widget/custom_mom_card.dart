import 'package:flutter/material.dart';

import '../../../core/values/app_colors.dart';

class CustomMomCard extends StatelessWidget {
  const CustomMomCard(
      {super.key,
      this.onTap,
      this.avatar,
      required this.title,
      required this.subTitle,
      required this.value,
      this.groupValue,
      this.onChanged});
  final void Function()? onTap;
  final String? avatar;
  final String title;
  final String subTitle;
  final Object value;
  final Object? groupValue;
  final void Function(Object?)? onChanged;

  @override
  Widget build(BuildContext context) {
    const activeColor = AppColors.colorFF940000;
    return InkWell(
      onTap: () {
        onChanged?.call(value);
      },
      child: Column(
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
              Container(
                padding: const EdgeInsets.all(4),
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppColors.colorFFC5C5C5,
                    width: 1,
                  ),
                ),
                child: Container(
                  alignment: Alignment.center,
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color:
                        groupValue == value ? activeColor : Colors.transparent,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 18)
        ],
      ),
    );
  }
}