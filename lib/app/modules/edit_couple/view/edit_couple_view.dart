import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/values/app_colors.dart';
import '../../../core/widgets/appBar/custom_appbar.dart';
import '../../../data/model/user.dart';
import '../cubit/edit_couple_cubit.dart';
import '../cubit/edit_couple_state.dart';
import '../repository/edit_couple_repository.dart';
import '../widget/custom_couple_card.dart';

class EditCoupleView extends StatefulWidget {
  const EditCoupleView(
      {super.key,
      this.couple,
      required this.genealogyId,
      required this.userGenealogyId});

  final List<User>? couple;
  final int genealogyId;
  final int userGenealogyId;

  @override
  State<EditCoupleView> createState() => _EditCoupleViewState();
}

class _EditCoupleViewState extends State<EditCoupleView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return EditCoupleCubit(context.read<EditCoupleRepository>())
          ..initData(widget.couple);
      },
      child: _buildPage(context),
    );
  }

  Widget _buildPage(BuildContext context) {
    return BlocListener<EditCoupleCubit, EditCoupleState>(
      listenWhen: (previous, current) => previous.saveDone != current.saveDone,
      listener: (context, state) {
        if (state.saveDone) {
          context.router.pop();
        }
      },
      child: BlocBuilder<EditCoupleCubit, EditCoupleState>(
        builder: (context, state) {
          final cubit = context.read<EditCoupleCubit>();
          final couples = state.couples;
          return Scaffold(
            appBar: CustomAppBar(
              leadingWidth: 49,
              leading: Row(
                children: [
                  const SizedBox(width: 9),
                  CustomAppbarItem(
                    icon: Icons.arrow_back_outlined,
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
              title: "Chỉnh sửa Vợ/Chổng",
              actions: [
                CustomAppbarItem(
                  icon: Icons.done,
                  onPressed: () {
                    cubit.saveData(widget.userGenealogyId, widget.genealogyId);
                  },
                ),
                const SizedBox(width: 9),
              ],
            ),
            backgroundColor: AppColors.colorFFFBEFEF,
            body: Container(
              margin: const EdgeInsets.symmetric(horizontal: 22, vertical: 24),
              padding: const EdgeInsets.only(top: 18, left: 20, right: 20),
              decoration: const BoxDecoration(
                color: AppColors.colorFFFFFFFF,
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
              child: couples != null && couples.isNotEmpty
                  ? ReorderableListView(
                      onReorder: (int oldIndex, int newIndex) {
                        setState(() {
                          if (oldIndex < newIndex) {
                            newIndex--;
                          }
                        });
                        cubit.changeCouple(oldIndex, newIndex, couples);
                      },
                      children: [
                        for (final item in couples)
                          ListTile(
                            key: ValueKey(item),
                            trailing: const Icon(
                              Icons.menu_sharp,
                              color: AppColors.colorFF940000,
                            ),
                            title: CustomCoupleCard(
                              avatar: item.avatar,
                              title: item.name ?? "Chưa có thông tin",
                              subTitle: (item.isAlive ?? true)
                                  ? "Còn sống"
                                  : "Đã mất",
                            ),
                          ),
                      ],
                    )
                  : const Center(child: Text("Không có Vợ/Chồng")),
            ),
          );
        },
      ),
    );
  }
}
