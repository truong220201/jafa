import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_firebase/app/core/extension/date_format_extension.dart';
import 'package:flutter_firebase/app/core/extension/string_extention.dart';
import 'package:flutter_firebase/app/modules/edit_branch/repository/edit_branch_repository.dart';
import '../../../core/values/app_colors.dart';
import '../../../core/values/regexp_constant.dart';
import '../../../core/values/string_constants.dart';
import '../../../core/widgets/appBar/custom_appbar.dart';
import '../../../core/widgets/button/second_button.dart';
import '../../../core/widgets/button/select_image_button.dart';
import '../../../core/widgets/custom_radio_field/custom_radio_field.dart';
import '../../../core/widgets/custom_text_field/custom_text_field.dart';
import '../../../core/widgets/popup/popup_list_actions.dart';
import '../../../core/widgets/popup/popup_select_image.dart';
import '../../../data/model/gender.dart';
import '../../../main_router.dart';
import '../cubit/edit_branch_cubit.dart';
import '../cubit/edit_branch_state.dart';

class EditBranchView extends StatefulWidget {
  const EditBranchView(
      {super.key,
      required this.genealogyId,
      required this.userGenealogyId,
      required this.roleId});
  final String genealogyId;
  final String userGenealogyId;
  final int roleId;

  @override
  State<EditBranchView> createState() => _EditBranchViewState();
}

class _EditBranchViewState extends State<EditBranchView> {
  final TextEditingController _roleController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _onameController = TextEditingController();
  final TextEditingController _jobController = TextEditingController();
  final TextEditingController _birthdayController = TextEditingController();
  final TextEditingController _deathController = TextEditingController();
  final TextEditingController _worshipController = TextEditingController();
  final TextEditingController _gravesController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return EditBranchCubit(context.read<EditBranchRepository>())
          ..getBranch(
              genealogyId: widget.genealogyId,
              userGenealogyId: widget.userGenealogyId);
      },
      child: _buildPage(context),
    );
  }

  @override
  void dispose() {
    _birthdayController.dispose();
    _deathController.dispose();
    _gravesController.dispose();
    _jobController.dispose();
    _nameController.dispose();
    _onameController.dispose();
    _roleController.dispose();
    _worshipController.dispose();
    super.dispose();
  }

  Widget _buildPage(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<EditBranchCubit, EditBranchState>(
          listenWhen: (previous, current) =>
              previous.initDone != current.initDone,
          listener: (context, state) {
            if (state.initDone) {
              if (state.graves != null) {
                _gravesController.text = state.graves!;
              }
              if (state.worship != null) {
                _worshipController.text = state.worship!;
              }
              if (state.death != null) {
                _deathController.text = state.death!;
              }
              if (state.birthday != null) {
                _birthdayController.text = state.birthday!;
              }
              if (state.job != null) {
                _jobController.text = state.job!;
              }
              if (state.otherName != null) {
                _onameController.text = state.otherName!;
              }
              _nameController.text = state.name;
              if (state.role != null) {
                _roleController.text = state.role!;
              }
            }
          },
        ),
        BlocListener<EditBranchCubit, EditBranchState>(
          listenWhen: (previous, current) =>
              previous.saveDone != current.saveDone,
          listener: (context, state) {
            if (state.saveDone) {
              context.router.pop();
            }
          },
        )
      ],
      child: Scaffold(
          appBar: CustomAppBar(
            leadingWidth: 50,
            title: StringConstants.branchInfo,
            leading: Row(
              children: [
                const SizedBox(width: 9),
                CustomAppbarItem(
                  icon: Icons.arrow_back_outlined,
                  onPressed: () async {
                    await context.router.pop();
                  },
                ),
              ],
            ),
            actions: [
              CustomAppbarItem(
                icon: Icons.delete_outline_rounded,
                onPressed: () {
                  _birthdayController.clear();
                  _deathController.clear();
                  _gravesController.clear();
                  _jobController.clear();
                  _nameController.clear();
                  _onameController.clear();
                  _roleController.clear();
                  _worshipController.clear();
                },
              ),
              const SizedBox(width: 5),
              BlocBuilder<EditBranchCubit, EditBranchState>(
                builder: (context, state) {
                  final cubit = context.read<EditBranchCubit>();
                  return CustomAppbarItem(
                    icon: Icons.done,
                    onPressed: () {
                      if (state.pass) {
                        cubit.editBranch(
                            genealogyId: widget.genealogyId,
                            userGenealogyId: widget.userGenealogyId);
                      }
                    },
                    background: (state.pass)
                        ? AppColors.colorFFFBEFEF
                        : AppColors.colorFFF5F5F5,
                    iconColor: (state.pass)
                        ? AppColors.colorFFB20000
                        : AppColors.colorFFC2C2C2,
                  );
                },
              ),
              const SizedBox(width: 9),
            ],
          ),
          backgroundColor: AppColors.colorFFFBEFEF,
          body: BlocSelector<EditBranchCubit, EditBranchState, bool>(
              selector: (state) => state.initDone,
              builder: (context, initDone) {
                return initDone
                    ? SingleChildScrollView(
                        child: Stack(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 102,
                                ),
                                Container(
                                  height: 900,
                                  decoration: const BoxDecoration(
                                    color: AppColors.colorFFFFFFFF,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20)),
                                  ),
                                  child: _bodyPage(context),
                                ),
                              ],
                            ),
                            BlocSelector<EditBranchCubit, EditBranchState,
                                    String?>(
                                selector: (state) => state.avatar,
                                builder: (context, avatar) {
                                  final cubit = context.read<EditBranchCubit>();
                                  return Positioned(
                                      top: 48,
                                      left: 100,
                                      right: 100,
                                      child: SelectImageButton(
                                          onTap: () {
                                            selectImage(context, cubit);
                                          },
                                          avatar: avatar));
                                }),
                          ],
                        ),
                      )
                    : const Center(child: CircularProgressIndicator());
              })),
    );
  }

  Widget _bodyPage(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 27,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SecondButton(
              icon: SvgPicture.asset(
                "assets/images/ic_tree_structure.svg",
              ),
              text: StringConstants.ralashion,
              onTap: () async {
                // await context.router.push(EditRelationShipViewRoute(
                //     genealogyId: widget.genealogyId,
                //     memberId: widget.userGenealogyId));
              },
            ),
            const SizedBox(
              width: 27,
            ),
          ],
        ),
        BlocSelector<EditBranchCubit, EditBranchState, String?>(
            selector: (state) => state.role,
            builder: (context, role) {
              final cubit = context.read<EditBranchCubit>();
              return CustomTextField(
                padding: const EdgeInsets.only(left: 20, right: 36),
                controller: _roleController,
                enabled: widget.roleId < 4,
                onChanged: (value) {
                  cubit.setRole(value);
                },
                customTitle: CustomTitle(
                  title: StringConstants.role,
                ),
                hintText: StringConstants.roleHint,
                suffixIcon: (role != null && role.isNotEmpty)
                    ? IconButton(
                        icon: const Icon(
                          Icons.cancel_outlined,
                          color: AppColors.colorFF940000,
                        ),
                        onPressed: () {
                          _roleController.clear();
                        },
                      )
                    : null,
              );
            }),
        const SizedBox(
          height: 14,
        ),
        BlocSelector<EditBranchCubit, EditBranchState, String>(
            selector: (state) => state.name,
            builder: (context, name) {
              final cubit = context.read<EditBranchCubit>();
              return CustomTextField(
                padding: const EdgeInsets.only(left: 20, right: 36),
                controller: _nameController,
                onChanged: (value) {
                  cubit.setName(value);
                },
                enabled: widget.roleId < 4,
                customTitle: CustomTitle(
                  title: StringConstants.firstlastname,
                  subTitle: StringConstants.obligatory1,
                ),
                hintText: StringConstants.firstlastname,
                suffixIcon: (name.isNotEmpty)
                    ? IconButton(
                        icon: const Icon(
                          Icons.cancel_outlined,
                          color: AppColors.colorFF940000,
                        ),
                        onPressed: () {
                          _nameController.clear();
                        },
                      )
                    : null,
              );
            }),
        BlocSelector<EditBranchCubit, EditBranchState, bool>(
            selector: (state) => state.pass,
            builder: (context, pass) {
              if (_nameController.text.isEmpty) {
                return ValidateTextField(
                  padding: const EdgeInsets.only(top: 7, left: 20),
                  validate: StringConstants.obligatory,
                );
              } else {
                return const SizedBox(height: 20);
              }
            }),
        const SizedBox(
          height: 14,
        ),
        BlocSelector<EditBranchCubit, EditBranchState, String?>(
            selector: (state) => state.otherName,
            builder: (context, otherName) {
              final cubit = context.read<EditBranchCubit>();
              return CustomTextField(
                padding: const EdgeInsets.only(left: 20, right: 36),
                controller: _onameController,
                onChanged: (value) {
                  cubit.setOtherName(value);
                },
                enabled: widget.roleId < 4,
                customTitle: CustomTitle(
                  title: StringConstants.otherName,
                ),
                hintText: StringConstants.firstlastname,
                suffixIcon: (otherName != null && otherName.isEmpty)
                    ? IconButton(
                        icon: const Icon(
                          Icons.cancel_outlined,
                          color: AppColors.colorFF940000,
                        ),
                        onPressed: () {
                          _onameController.clear();
                        },
                      )
                    : null,
              );
            }),
        const SizedBox(
          height: 14,
        ),
        BlocSelector<EditBranchCubit, EditBranchState, String?>(
            selector: (state) => state.job,
            builder: (context, job) {
              final cubit = context.read<EditBranchCubit>();
              return CustomTextField(
                padding: const EdgeInsets.only(left: 20, right: 36),
                controller: _jobController,
                onChanged: (value) {
                  cubit.setJob(value);
                },
                enabled: widget.roleId < 4,
                customTitle: CustomTitle(
                  title: StringConstants.job2,
                ),
                hintText: StringConstants.job,
                suffixIcon: (job != null && job.isEmpty)
                    ? IconButton(
                        icon: const Icon(
                          Icons.cancel_outlined,
                          color: AppColors.colorFF940000,
                        ),
                        onPressed: () {
                          _onameController.clear();
                        },
                      )
                    : null,
              );
            }),
        const SizedBox(
          height: 14,
        ),
        CustomTitle(
          title: StringConstants.gender,
          subTitle: StringConstants.obligatory1,
        ),
        BlocSelector<EditBranchCubit, EditBranchState, Gender>(
            selector: (state) => state.gender,
            builder: (context, gender) {
              final cubit = context.read<EditBranchCubit>();
              return Padding(
                  padding: const EdgeInsets.only(left: 20, top: 8, bottom: 8),
                  child: CustomRadioField(
                    actions: Gender.values,
                    groupValue: gender,
                    onChanged: (value) {
                      cubit.setGender(value as Gender);
                    },
                    labels: Gender.values.getGenderTypes(),
                  ));
            }),
        BlocSelector<EditBranchCubit, EditBranchState, String?>(
            selector: (state) => state.birthday,
            builder: (context, birthday) {
              final cubit = context.read<EditBranchCubit>();
              return CustomTextField(
                padding: const EdgeInsets.only(left: 20, right: 36),
                controller: _birthdayController,
                onChanged: (value) {
                  cubit.setBirthday(value);
                },
                enabled: widget.roleId < 4,
                keyboardType: TextInputType.datetime,
                inputFormatters: [
                  FilteringTextInputFormatter.deny(RegexpConstants.dateDeny),
                ],
                customTitle: CustomTitle(
                  title: StringConstants.birthday,
                ),
                hintText: StringConstants.date,
                suffixIcon: IconButton(
                  icon: const Icon(
                    Icons.keyboard_arrow_down,
                    color: AppColors.colorFF000000,
                  ),
                  onPressed: () {
                    _selectDate(context, cubit);
                  },
                ),
                labelText: StringConstants.dateLabel,
                floatingLabelBehavior: FloatingLabelBehavior.always,
                contentPadding: const EdgeInsets.only(top: 8, bottom: 16),
              );
            }),
        BlocSelector<EditBranchCubit, EditBranchState, String?>(
            selector: (state) => state.birthday,
            builder: (context, death) {
              if (death != null && !death.isFormatDate) {
                return ValidateTextField(
                  padding: const EdgeInsets.only(top: 7, left: 20),
                  validate: StringConstants.dateRole,
                );
              } else {
                return const SizedBox(height: 20);
              }
            }),
        CustomTitle(title: StringConstants.death),
        BlocSelector<EditBranchCubit, EditBranchState, bool>(
            selector: (state) => state.isAlive,
            builder: (context, alive) {
              final cubit = context.read<EditBranchCubit>();
              return Padding(
                  padding: const EdgeInsets.only(left: 20, top: 8, bottom: 8),
                  child: CustomRadioField(
                    actions: const [true, false],
                    groupValue: alive,
                    onChanged: (value) {
                      cubit.setAlive(value as bool);
                    },
                    labels: [StringConstants.alive, StringConstants.death],
                  ));
            }),
        BlocSelector<EditBranchCubit, EditBranchState, bool>(
            selector: (state) => state.isAlive,
            builder: (context, alive) {
              final cubit = context.read<EditBranchCubit>();
              return CustomTextField(
                padding: const EdgeInsets.only(left: 20, right: 36),
                controller: _deathController,
                onChanged: (value) {
                  cubit.setDeath(value);
                },
                enabled: !alive && widget.roleId < 4,
                keyboardType: TextInputType.datetime,
                inputFormatters: [
                  FilteringTextInputFormatter.deny(RegexpConstants.dateDeny),
                ],
                customTitle: CustomTitle(
                  title: StringConstants.deathday,
                ),
                hintText: StringConstants.date,
                suffixIcon: IconButton(
                  icon: const Icon(
                    Icons.keyboard_arrow_down,
                    color: AppColors.colorFF000000,
                  ),
                  onPressed: () {
                    _selectDeath(context, cubit);
                  },
                ),
              );
            }),
        BlocSelector<EditBranchCubit, EditBranchState, String?>(
            selector: (state) => state.death,
            builder: (context, birthday) {
              if (birthday != null && !birthday.isFormatDate) {
                return ValidateTextField(
                  padding: const EdgeInsets.only(top: 7, left: 20),
                  validate: StringConstants.dateRole,
                );
              } else {
                return const SizedBox(height: 20);
              }
            }),
        BlocSelector<EditBranchCubit, EditBranchState, String?>(
            selector: (state) => state.worship,
            builder: (context, worship) {
              final cubit = context.read<EditBranchCubit>();
              return CustomTextField(
                padding: const EdgeInsets.only(left: 20, right: 36),
                controller: _worshipController,
                onChanged: (value) {
                  cubit.setWorthShip(value);
                },
                enabled: widget.roleId < 4,
                customTitle: CustomTitle(
                  title: StringConstants.worshipPlace,
                ),
                hintText: StringConstants.address,
                suffixIcon: (worship != null && worship.isEmpty)
                    ? IconButton(
                        icon: const Icon(
                          Icons.cancel_outlined,
                          color: AppColors.colorFF940000,
                        ),
                        onPressed: () {
                          _worshipController.clear();
                        },
                      )
                    : null,
              );
            }),
        const SizedBox(
          height: 14,
        ),
        BlocBuilder<EditBranchCubit, EditBranchState>(
            builder: (context, state) {
          final cubit = context.read<EditBranchCubit>();
          return CustomTextField(
            padding: const EdgeInsets.only(left: 20, right: 36),
            controller: _gravesController,
            onChanged: (value) {
              cubit.setGraves(value);
            },
            enabled: !state.isAlive && widget.roleId < 4,
            customTitle: CustomTitle(
              title: StringConstants.grave,
            ),
            hintText: StringConstants.graves,
            suffixIcon: (state.graves != null && state.graves!.isEmpty)
                ? IconButton(
                    icon: const Icon(
                      Icons.cancel_outlined,
                      color: AppColors.colorFF940000,
                    ),
                    onPressed: () {
                      _gravesController.clear();
                    },
                  )
                : null,
          );
        }),
        const SizedBox(
          height: 14,
        ),
      ],
    );
  }

  Future<void> _selectDate(BuildContext context, EditBranchCubit cubit) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      cubit.setBirthday(picked.toFormattedDate());
      setState(() {
        _birthdayController.text = picked.toFormattedDate();
      });
    }
  }

  Future<void> _selectDeath(BuildContext context, EditBranchCubit cubit) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      cubit.setDeath(picked.toFormattedDate());
      setState(() {
        _deathController.text = picked.toFormattedDate();
      });
    }
  }
}

Future<void> selectImage(BuildContext context, EditBranchCubit cubit) async {
  await showModalBottomSheet(
    backgroundColor: Colors.transparent,
    context: context,
    builder: (BuildContext context) {
      return PopupSelectImage(onTap1: () {
        cubit.chooseImageFromGallery();
        Navigator.pop(context);
      }, onTap2: () {
        cubit.takeImageFromCamera();
        Navigator.pop(context);
      });
    },
  );
}

Future<void> _showModalViewerInternal(BuildContext context) async {
  await showDialog(
    context: context,
    builder: (BuildContext context) {
      return PopupListActions(
        actions: [
          PopupListActionsItem(
            icon: Icons.person,
            title: StringConstants.watch,
            onTap: () {},
          ),
          PopupListActionsItem(
            icon: Icons.edit_square,
            title: StringConstants.editRole,
            onTap: () {},
          ),
          PopupListActionsItem(
            iconWidget: SvgPicture.asset(
              "assets/images/ic_path.svg",
            ),
            icon: Icons.edit_square,
            title: StringConstants.editBranchGr,
            onTap: () {},
          ),
          PopupListActionsItem(
            icon: Icons.delete,
            title: StringConstants.deleteMember,
            onTap: () {},
          ),
        ],
        content: Container(
          width: 50,
          height: 50,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: NetworkImage(
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRDdtxbbtFvIWqVnnJlEpT0fyg-HaQaelo-Pg&usqp=CAU"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        title: "Trần Thị Na",
      );
    },
  );
}
