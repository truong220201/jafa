import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:genealogy_management/app/modules/edit_relasionship/cubit/edit_relasionship_state.dart';

import '../../../core/values/app_colors.dart';
import '../../../core/values/string_constants.dart';
import '../../../core/widgets/appBar/custom_appbar.dart';
import '../../../main_router.dart';
import '../cubit/edit_relasionship_cubit.dart';
import '../repository/edit_relasionship_repository.dart';
import '../widget/add_relation_item.dart';
import '../widget/edit_relation_item.dart';

class EditRelationShipView extends StatefulWidget {
  const EditRelationShipView(
      {super.key, required this.genealogyId, required this.memberId});
  final int genealogyId;
  final int memberId;

  @override
  State<EditRelationShipView> createState() => _EditRelationShipViewState();
}

class _EditRelationShipViewState extends State<EditRelationShipView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return EditRelationShipCubit(context.read<EditRelationShipRepository>())
          ..getAllRelasionship(
              genealogyId: widget.genealogyId, memberId: widget.memberId);
      },
      child: _buildPage(context),
    );
  }

  Widget _buildPage(BuildContext context) {
    return BlocListener<EditRelationShipCubit, EditRelationShipState>(
      listenWhen: (previous, current) => previous.saveDone != current.saveDone,
      listener: (context, state) async {
        if (state.saveDone) {
          await context.router.push(EditBranchNoInfoViewRoute(
              genealogyId: widget.genealogyId,
              memberId: state.selectedId ?? -1,
              memberRootId: widget.memberId));
          context.read<EditRelationShipCubit>().getAllRelasionship(
              genealogyId: widget.genealogyId, memberId: widget.memberId);
        }
      },
      child: Scaffold(
        appBar: CustomAppBar(
          leadingWidth: 49,
          leading: Row(
            children: [
              const SizedBox(width: 9),
              CustomAppbarItem(
                  icon: Icons.arrow_back_outlined,
                  onPressed: () {
                    Navigator.of(context).pop();
                  }),
            ],
          ),
          title: "Mối quan hệ",
        ),
        backgroundColor: AppColors.colorFFFBEFEF,
        body: BlocBuilder<EditRelationShipCubit, EditRelationShipState>(
            builder: (context, state) {
          final cubit = context.read<EditRelationShipCubit>();
          return Container(
            padding: const EdgeInsets.only(left: 18, right: 18, top: 36),
            child: state.initDone
                ? SingleChildScrollView(
                    child: Column(
                      children: [
                        state.dad != null
                            ? EditRelationItem(
                                title: "Thông tin bố",
                                cards: [
                                  EditRelationCard(
                                    title: state.dad?.name ?? "",
                                    subTitle: (state.dad?.isAlive ?? true)
                                        ? "Còn sống, ${state.wifesOfDad?.length ?? 0} vợ, ${state.children?.length ?? 0} con"
                                        : "Đã mất, ${state.wifesOfDad?.length ?? 0} vợ, ${state.children?.length ?? 0} con",
                                    avatar: state.dad?.avatar,
                                    genealogyId: widget.genealogyId,
                                    memberId: state.dad!.id!,
                                    memberCurrentId: widget.memberId,
                                  )
                                ],
                              )
                            : AddRelationItem(
                                title: "Bố",
                                onTap: () {
                                  cubit.createBranch(
                                      createType: StringConstants.dadE,
                                      genealogyId: widget.genealogyId,
                                      memberId: widget.memberId);
                                },
                              ),
                        (state.wifesOfDad?.isNotEmpty ?? false)
                            ? EditRelationItem(
                                title: "Thông tin mẹ",
                                icon: InkWell(
                                  onTap: () async {
                                    await context.pushRoute(EditMomViewRoute(
                                        wifesOfDad: state.wifesOfDad,
                                        genealogyId: widget.genealogyId));
                                    context
                                        .read<EditRelationShipCubit>()
                                        .getAllRelasionship(
                                            genealogyId: widget.genealogyId,
                                            memberId: widget.memberId);
                                  },
                                  child: const Icon(
                                    Icons.loop,
                                    color: AppColors.colorFF940000,
                                  ),
                                ),
                                cards: [
                                  EditRelationCard(
                                    title: state.mainWife?.name ?? "",
                                    subTitle: (state.mainWife?.isAlive ?? true)
                                        ? "Còn sống, Đích mẫu"
                                        : "Đã mất, Đích mẫu",
                                    avatar: state.mainWife?.avatar,
                                    genealogyId: widget.genealogyId,
                                    memberId: state.mainWife?.id ?? -1,
                                    memberCurrentId: widget.memberId,
                                  )
                                ],
                              )
                            : AddRelationItem(
                                title: "Mẹ",
                                onTap: () {
                                  cubit.createBranch(
                                      createType: StringConstants.momE,
                                      genealogyId: widget.genealogyId,
                                      memberId: widget.memberId);
                                },
                              ),
                        (state.siblings?.isNotEmpty ?? false)
                            ? EditRelationItem(
                                title: "Thông tin Anh Chị Em",
                                cards: [
                                  for (var sibling in state.siblings!)
                                    EditRelationCard(
                                      title: sibling.name ?? "",
                                      subTitle: (sibling.isAlive ?? true)
                                          ? "Còn sống"
                                          : "Đã mất",
                                      avatar: sibling.avatar,
                                      genealogyId: widget.genealogyId,
                                      memberId: sibling.id!,
                                      memberCurrentId: widget.memberId,
                                    ),
                                ],
                              )
                            : const SizedBox(),
                        (state.couple?.isNotEmpty ?? false)
                            ? EditRelationItem(
                                icon: InkWell(
                                  onTap: () async {
                                    await context.router.push(
                                        EditCoupleViewRoute(
                                            genealogyId: widget.genealogyId,
                                            couple: state.couple,
                                            userGenealogyId: widget.memberId));
                                    context
                                        .read<EditRelationShipCubit>()
                                        .getAllRelasionship(
                                            genealogyId: widget.genealogyId,
                                            memberId: widget.memberId);
                                  },
                                  child: const Icon(
                                    Icons.loop,
                                    color: AppColors.colorFF940000,
                                  ),
                                ),
                                title: "Thông tin Vợ/Chồng",
                                cards: [
                                  for (var item in state.couple!)
                                    EditRelationCard(
                                      title: item.name ?? "",
                                      subTitle: (item.isAlive ?? true)
                                          ? "Còn sống"
                                          : "Đã mất",
                                      avatar: item.avatar,
                                      genealogyId: widget.genealogyId,
                                      memberId: item.id!,
                                      memberCurrentId: widget.memberId,
                                    ),
                                ],
                              )
                            : AddRelationItem(
                                title: "Vợ/Chồng",
                                onTap: () {
                                  cubit.createBranch(
                                      createType: StringConstants.coupleE,
                                      genealogyId: widget.genealogyId,
                                      memberId: widget.memberId);
                                },
                              ),
                        (state.children?.isNotEmpty ?? false)
                            ? EditRelationItem(
                                title: "Thông tin Con",
                                cards: [
                                  for (var child in state.children!)
                                    EditRelationCard(
                                      title: child.name ?? "",
                                      subTitle: (child.isAlive ?? true)
                                          ? "Còn sống"
                                          : "Đã mất",
                                      avatar: child.avatar,
                                      genealogyId: widget.genealogyId,
                                      memberId: child.id!,
                                      memberCurrentId: widget.memberId,
                                    ),
                                ],
                              )
                            : AddRelationItem(
                                title: "Con cái",
                                onTap: () {
                                  cubit.createBranch(
                                      createType: StringConstants.childE,
                                      genealogyId: widget.genealogyId,
                                      memberId: widget.memberId);
                                },
                              ),
                        (state.others?.isNotEmpty ?? false)
                            ? EditRelationItem(
                                title: "Thông tin Khác",
                                cards: [
                                  for (var other in state.others!)
                                    EditRelationCard(
                                      title: other.name ?? "",
                                      subTitle: (other.isAlive ?? true)
                                          ? "Còn sống"
                                          : "Đã mất",
                                      avatar: other.avatar,
                                      genealogyId: widget.genealogyId,
                                      memberId: other.id!,
                                      memberCurrentId: widget.memberId,
                                    ),
                                ],
                              )
                            : AddRelationItem(
                                title: "Khác",
                                onTap: () {
                                  cubit.createBranch(
                                      createType: StringConstants.otherE,
                                      genealogyId: widget.genealogyId,
                                      memberId: widget.memberId);
                                },
                              )
                      ],
                    ),
                  )
                : const Center(child: CircularProgressIndicator()),
          );
        }),
      ),
    );
  }
}
