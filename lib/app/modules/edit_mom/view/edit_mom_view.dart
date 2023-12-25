import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/values/app_colors.dart';
import '../../../core/widgets/appBar/custom_appbar.dart';
import '../../../data/model/user.dart';
import '../cubit/edit_mom_cubit.dart';
import '../cubit/edit_mom_state.dart';
import '../repository/edit_mom_repository.dart';
import '../widget/custom_mom_card.dart';

class EditMomView extends StatefulWidget {
  const EditMomView({super.key, this.wifesOfDad, required this.genealogyId});

  final List<User>? wifesOfDad;
  final int genealogyId;

  @override
  State<EditMomView> createState() => _EditMomViewState();
}

class _EditMomViewState extends State<EditMomView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return EditMomCubit(context.read<EditMomRepository>())
          ..initData(widget.wifesOfDad);
      },
      child: _buildPage(context),
    );
  }

  Widget _buildPage(BuildContext context) {
    return BlocListener<EditMomCubit, EditMomState>(
      listenWhen: (previous, current) => previous.saveDone != current.saveDone,
      listener: (context, state) {
        if (state.saveDone) {
          context.router.pop();
        }
      },
      child: BlocBuilder<EditMomCubit, EditMomState>(
        builder: (context, state) {
          final cubit = context.read<EditMomCubit>();
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
              title: "Chỉnh sửa mẹ",
              actions: [
                CustomAppbarItem(
                  icon: Icons.done,
                  onPressed: () {
                    if (state.selectedMom != null) {
                      cubit.saveData(
                          state.selectedMom?.id ?? -1, widget.genealogyId);
                    }
                  },
                ),
                const SizedBox(width: 9),
              ],
            ),
            backgroundColor: AppColors.colorFFFBEFEF,
            body: SingleChildScrollView(
              child: Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 22, vertical: 24),
                padding: const EdgeInsets.only(top: 18, left: 20, right: 20),
                decoration: const BoxDecoration(
                  color: AppColors.colorFFFFFFFF,
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                child: state.wifesOfDad != null && state.wifesOfDad!.isNotEmpty
                    ? Column(
                        children: [
                          for (var item in state.wifesOfDad!)
                            CustomMomCard(
                              avatar: item.avatar,
                              title: item.name ?? "Chưa có thông tin",
                              subTitle: (item.isAlive ?? true)
                                  ? "Còn sống"
                                  : "Đã mất",
                              value: item,
                              groupValue: state.selectedMom,
                              onChanged: (value) {
                                cubit.setMom(value as User);
                              },
                            ),
                        ],
                      )
                    : const Center(child: Text("Không có mẹ")),
              ),
            ),
          );
        },
      ),
    );
  }
}
