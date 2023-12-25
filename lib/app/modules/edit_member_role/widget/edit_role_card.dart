import 'package:flutter/material.dart';

import '../../../core/values/app_colors.dart';

class EditRoleCard extends StatelessWidget {
  const EditRoleCard(
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
  final List<Widget> subTitle;
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
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: subTitle,
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

class EditRoleCardItem extends StatelessWidget {
  const EditRoleCardItem({super.key, required this.title, required this.check});
  final String title;
  final bool check;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        check ? const Icon(Icons.done) : const Icon(Icons.close),
        const SizedBox(width: 8),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.6,
          child: Text(
            title,
            style: const TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w400,
                color: AppColors.colorFF313131),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
        )
      ],
    );
  }
}
