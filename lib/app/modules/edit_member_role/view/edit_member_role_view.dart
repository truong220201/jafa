import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/values/app_colors.dart';
import '../../../core/widgets/appBar/custom_appbar.dart';
import '../cubit/edit_member_role_cubit.dart';
import '../cubit/edit_member_role_state.dart';
import '../repository/edit_member_role_repository.dart';
import '../widget/edit_role_card.dart';

class EditMemberRoleView extends StatefulWidget {
  const EditMemberRoleView(
      {super.key,
      required this.userId,
      required this.roleId,
      required this.genealogyId});

  final int userId;
  final int roleId;
  final int genealogyId;

  @override
  State<EditMemberRoleView> createState() => _EditMemberRoleViewState();
}

class _EditMemberRoleViewState extends State<EditMemberRoleView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) {
          return EditMemberRoleCubit(context.read<EditMemberRoleRepository>())
            ..setRoleId(widget.roleId);
        },
        child: _buildPage(context));
  }

  Widget _buildPage(BuildContext context) {
    return BlocBuilder<EditMemberRoleCubit, EditMemberRoleState>(
        builder: (context, state) {
      final cubit = context.read<EditMemberRoleCubit>();
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
          title: "Chỉnh sửa quyền",
          actions: [
            CustomAppbarItem(
              icon: Icons.done,
              onPressed: () {
                cubit.changeRole(widget.userId, widget.genealogyId);
              },
            ),
            const SizedBox(width: 9),
          ],
        ),
        backgroundColor: AppColors.colorFFFBEFEF,
        body: Container(
          height: MediaQuery.of(context).size.height * 0.7,
          margin: const EdgeInsets.symmetric(horizontal: 22, vertical: 24),
          padding: const EdgeInsets.only(top: 18, left: 20, right: 20),
          decoration: const BoxDecoration(
            color: AppColors.colorFFFFFFFF,
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          child: Column(
            children: [
              EditRoleCard(
                title: "Quản trị viên ",
                subTitle: [
                  state.roleId < 3
                      ? EditRoleCardItem(
                          check: state.roleId < 2,
                          title: 'Thêm sửa xoá toàn bộ cây gia phả',
                        )
                      : const SizedBox(),
                  state.roleId < 3
                      ? EditRoleCardItem(
                          check: state.roleId < 2,
                          title: 'Mời người khác vào cây gia phả',
                        )
                      : const SizedBox(),
                  state.roleId < 3
                      ? EditRoleCardItem(
                          check: state.roleId < 2,
                          title: 'Thêm sửa xoá thành viên trên cây',
                        )
                      : const SizedBox(),
                  EditRoleCardItem(
                    check: state.roleId < 2,
                    title: 'Chỉnh sửa quyền của thành viên',
                  )
                ],
                value: 1,
                groupValue: state.roleId,
                onChanged: (value) {
                  cubit.setRoleId(value as int);
                },
              ),
              EditRoleCard(
                title: "Người Biên Soạn",
                subTitle: [
                  EditRoleCardItem(
                    check: state.roleId < 3,
                    title:
                        'Thêm sửa các nhánh trên cây gia phả, được xoá nhánh đã tạo',
                  ),
                  EditRoleCardItem(
                    check: state.roleId < 3,
                    title: 'Mời người khác vào cây gia phả',
                  ),
                  EditRoleCardItem(
                    check: state.roleId < 3,
                    title: 'Thêm sửa xoá thành viên trên cây',
                  ),
                ],
                value: 2,
                groupValue: state.roleId,
                onChanged: (value) {
                  cubit.setRoleId(value as int);
                },
              ),
              state.roleId == 4
                  ? EditRoleCard(
                      title: "Người xem",
                      subTitle: [
                        EditRoleCardItem(
                          check: state.roleId < 5,
                          title: 'Xem cây gia phả',
                        ),
                        EditRoleCardItem(
                          check: state.roleId < 5,
                          title: 'Xin vào vị trí trên cây',
                        ),
                      ],
                      value: 4,
                      groupValue: state.roleId,
                      onChanged: (value) {
                        cubit.setRoleId(value as int);
                      },
                    )
                  : EditRoleCard(
                      title: "Thành viên",
                      subTitle: [
                        EditRoleCardItem(
                          check: state.roleId < 4,
                          title: 'Xem toàn bộ cây và thông tin bên trong',
                        ),
                        EditRoleCardItem(
                          check: state.roleId < 4,
                          title: 'Thêm/Sửa/Xoá nhánh vợ/chồng và con của mình',
                        ),
                      ],
                      value: 3,
                      groupValue: state.roleId,
                      onChanged: (value) {
                        cubit.setRoleId(value as int);
                      },
                    ),
            ],
          ),
        ),
      );
    });
  }
}
