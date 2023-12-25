import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/values/app_colors.dart';
import '../../../main_router.dart';
import '../cubit/edit_relasionship_cubit.dart';

class EditRelationItem extends StatelessWidget {
  const EditRelationItem(
      {super.key, required this.title, required this.cards, this.icon});

  final String title;
  final List<Widget> cards;
  final Widget? icon;

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.colorFF940000),
                  ),
                  const SizedBox(width: 14),
                  icon ?? const SizedBox()
                ],
              ),
              const SizedBox(height: 20),
              Column(
                children: cards,
              )
            ],
          ),
        ),
        const SizedBox(height: 18),
      ],
    );
  }
}

class EditRelationCard extends StatelessWidget {
  const EditRelationCard(
      {super.key,
      this.avatar,
      required this.title,
      required this.subTitle,
      required this.memberId,
      required this.genealogyId,
      required this.memberCurrentId});
  final String title;
  final String subTitle;
  final String? avatar;
  final int memberCurrentId;
  final int memberId;
  final int genealogyId;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        title.isNotEmpty
            ? InkWell(
                onTap: () async {
                  await context.router.push(EditBranchNoInfoViewRoute(
                      genealogyId: genealogyId,
                      memberId: memberId,
                      memberRootId: memberCurrentId));
                  context.read<EditRelationShipCubit>().getAllRelasionship(
                      genealogyId: genealogyId, memberId: memberCurrentId);
                },
                child: Row(
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
                    const Icon(Icons.keyboard_arrow_right)
                  ],
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Chưa có thông tin",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColors.colorFF313131),
                  ),
                  InkWell(
                    onTap: () async {
                      await context.router.push(EditBranchNoInfoViewRoute(
                          genealogyId: genealogyId,
                          memberId: memberId,
                          memberRootId: memberCurrentId));
                      context.read<EditRelationShipCubit>().getAllRelasionship(
                          genealogyId: genealogyId, memberId: memberCurrentId);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: 56,
                      height: 36,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(24)),
                          color: AppColors.colorFFB20000),
                      child: const Text(
                        "Sửa",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: AppColors.colorFFFFFFFF,
                        ),
                      ),
                    ),
                  )
                ],
              ),
        const SizedBox(height: 14)
      ],
    );
  }
}