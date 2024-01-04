import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase/app/data/model/tree_view_model.dart';
import '../../../core/values/app_colors.dart';
import '../../../core/values/string_constants.dart';
import '../../../core/values/text_styles.dart';
import '../../../core/widgets/appBar/custom_appbar.dart';
import '../cubit/create_branch_cubit.dart';
import '../cubit/create_branch_state.dart';
import '../repository/create_branch_repository.dart';

class CreateBranchView extends StatefulWidget {
  const CreateBranchView(
      {Key? key,
      required this.isRoot,
      required this.userGenealogyId,
      required this.genealogyId,
      required this.roleId,
      this.name,
      this.avatar,
      this.gender,
      required this.user})
      : super(key: key);

  final bool isRoot;
  final String userGenealogyId;
  final String genealogyId;
  final int roleId;
  final String? name;
  final String? avatar;
  final String? gender;
  final TreeViewModel user;

  @override
  State<CreateBranchView> createState() => _CreateBranchViewState();
}

class _CreateBranchViewState extends State<CreateBranchView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CreateBranchCubit(context.read<CreateBranchRepository>())
            ..initData(
                user: widget.user,
                genealogyId: widget.genealogyId,
                roleId: widget.roleId,
                userGenealogyId: widget.userGenealogyId,
                avatar: widget.avatar,
                name: widget.name),
      child: _buildPage(context),
    );
  }

  Widget _buildPage(BuildContext context) {
    return BlocListener<CreateBranchCubit, CreateBranchState>(
      listenWhen: (previous, current) => previous.saveDone != current.saveDone,
      listener: (context, state) async {
        if (state.saveDone) {
          if (state.message != null) {
            final name = widget.name ?? "Node này";
            _showOverlay(context, '$name đã có mẹ rồi');
            return;
          }
          await context.router.pop();
        }
      },
      child: BlocBuilder<CreateBranchCubit, CreateBranchState>(
          builder: (context, state) {
        final cubit = context.read<CreateBranchCubit>();
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
                    }),
              ],
            ),
            title: "Tạo nhánh",
          ),
          backgroundColor: AppColors.colorFFFFFFFF,
          body: InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Center(
              child: Stack(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 600,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            Stack(
                              children: [
                                BlocSelector<CreateBranchCubit,
                                        CreateBranchState, String?>(
                                    selector: (state) => state.avatar,
                                    builder: (context, avatar) {
                                      return Container(
                                        height: 140,
                                        width: 200,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: AppColors.colorFFD9D9D9,
                                          image: avatar != null
                                              ? DecorationImage(
                                                  image: NetworkImage(avatar),
                                                  fit: BoxFit.cover,
                                                )
                                              : null,
                                        ),
                                        child: avatar == null
                                            ? const Icon(
                                                Icons.person,
                                                size: 100,
                                                color: Colors.white,
                                              )
                                            : null,
                                      );
                                    }),
                                Positioned(
                                  right: 8,
                                  top: 48,
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Container(
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            color: AppColors.colorFFFFFFFF,
                                            border: Border.all(
                                              color: AppColors.colorFF940000,
                                              width: 3,
                                            ),
                                            shape: BoxShape.circle),
                                        child: const Icon(
                                          Icons.remove,
                                          color: AppColors.colorFFB20000,
                                          size: 40,
                                        )),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 4),
                            Container(
                              width: 180,
                              alignment: Alignment.center,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 2),
                              decoration: BoxDecoration(
                                  border: Border.all(),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(8))),
                              child: BlocSelector<CreateBranchCubit,
                                      CreateBranchState, String?>(
                                  selector: (state) => state.name,
                                  builder: (context, name) {
                                    return Text(
                                      name ?? "Chưa có thông tin",
                                      style: TextStyles.mediumMBlackS18,
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                    );
                                  }),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 0,
                    left: 50,
                    child: CreateNodeItem(
                      text: StringConstants.dad,
                      onTap: () {
                        if (widget.isRoot) {
                          cubit.createBranch(createType: StringConstants.dadE);
                        } else {
                          final text = state.name ?? "Bạn";
                          _showOverlay(context, "$text đã có bố rồi!");
                        }
                      },
                    ),
                  ),
                  // Positioned(
                  //   top: 60,
                  //   right: 110,
                  //   child: CreateNodeItem(
                  //     text: StringConstants.mom,
                  //     onTap: () {
                  //       if (widget.isRoot) {
                  //         _showOverlay(context, StringConstants.addMomRole);
                  //       } else {
                  //         cubit.createBranch(createType: StringConstants.momE);
                  //       }
                  //     },
                  //   ),
                  // ),
                  Positioned(
                    top: 100,
                    right: 70,
                    child: CreateNodeItem(
                      text: StringConstants.child,
                      onTap: () {
                        cubit.createBranch(createType: StringConstants.childE);
                      },
                    ),
                  ),
                  Positioned(
                    bottom: 140,
                    right: 70,
                    child: CreateNodeItem(
                      text: widget.gender != "Nữ"
                          ? StringConstants.wife
                          : StringConstants.husband,
                      onTap: () {
                        cubit.createBranch(createType: StringConstants.coupleE);
                      },
                    ),
                  ),
                  Positioned(
                    bottom: 30,
                    left: 50,
                    child: CreateNodeItem(
                      text: StringConstants.other,
                      onTap: () {
                        cubit.createBranch(createType: StringConstants.otherE);
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}

class CreateNodeItem extends StatelessWidget {
  const CreateNodeItem(
      {super.key,
      this.backgroundColor = AppColors.colorFFFBEFEF,
      this.iconColor = AppColors.colorFF940000,
      required this.text,
      this.onTap});
  final Color backgroundColor;
  final Color iconColor;
  final String text;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Stack(
        children: [
          Container(
            width: 100,
            height: 130,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: backgroundColor,
              shape: BoxShape.circle,
            ),
            child: Text(text, style: TextStyles.mediumBlackS20),
          ),
          Positioned(
            bottom: 0,
            left: 32,
            child: Container(
              decoration: BoxDecoration(
                  color: AppColors.colorFFFFFFFF,
                  border: Border.all(color: AppColors.colorFF940000, width: 3),
                  shape: BoxShape.circle),
              child: const Icon(
                Icons.add,
                color: AppColors.colorFF940000,
                size: 32,
              ),
            ),
          )
        ],
      ),
    );
  }
}

void _showOverlay(BuildContext context, String message) {
  OverlayEntry overlayEntry;
  overlayEntry = OverlayEntry(
    builder: (context) => Positioned(
      top: MediaQuery.of(context).size.height * 0.15,
      left: MediaQuery.of(context).size.width * 0.1,
      width: MediaQuery.of(context).size.width * 0.8,
      child: Material(
        color: Colors.transparent,
        child: Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(64)),
              color: Color.fromARGB(255, 238, 236, 236)),
          padding: const EdgeInsets.symmetric(
            horizontal: 40,
            vertical: 20,
          ),
          child: Text(
            message,
            style: TextStyles.mediumRedS20,
          ),
        ),
      ),
    ),
  );

  Overlay.of(context).insert(overlayEntry);

  Future.delayed(const Duration(seconds: 2), () {
    overlayEntry.remove();
  });
}
