import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase/app/core/extension/date_format_extension.dart';
import 'package:flutter_firebase/app/core/extension/string_extention.dart';
import '../../../core/values/app_colors.dart';
import '../../../core/values/regexp_constant.dart';
import '../../../core/values/string_constants.dart';
import '../../../core/widgets/appBar/custom_appbar.dart';
import '../../../core/widgets/button/select_image_button.dart';
import '../../../core/widgets/custom_radio_field/custom_radio_field.dart';
import '../../../core/widgets/custom_text_field/custom_text_field.dart';
import '../../../core/widgets/popup/popup_select_image.dart';
import '../../../data/model/gender.dart';
import '../cubit/edit_branch_no_info_cubit.dart';
import '../cubit/edit_branch_no_info_state.dart';
import '../repository/edit_branch_no_info_repository.dart';

class EditBranchNoInfoView extends StatefulWidget {
  const EditBranchNoInfoView(
      {super.key,
      required this.genealogyId,
      required this.memberId,
      required this.memberRootId});
  final int genealogyId;
  final int memberId;
  final int memberRootId;

  @override
  State<EditBranchNoInfoView> createState() => _EditBranchNoInfoViewState();
}

class _EditBranchNoInfoViewState extends State<EditBranchNoInfoView> {
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
        return EditBranchNoInfoCubit(context.read<EditBranchNoInfoRepository>())
          ..getBranch(
              genealogyId: widget.genealogyId,
              userGenealogyId: widget.memberId);
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
        BlocListener<EditBranchNoInfoCubit, EditBranchNoInfoState>(
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
        BlocListener<EditBranchNoInfoCubit, EditBranchNoInfoState>(
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
              BlocBuilder<EditBranchNoInfoCubit, EditBranchNoInfoState>(
                builder: (context, state) {
                  final cubit = context.read<EditBranchNoInfoCubit>();
                  return CustomAppbarItem(
                    icon: Icons.done,
                    onPressed: () async {
                      if (state.pass) {
                        cubit.editBranch(
                            genealogyId: widget.genealogyId,
                            userGenealogyId: widget.memberId);
                        context.router.pop();
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
          body:
              BlocSelector<EditBranchNoInfoCubit, EditBranchNoInfoState, bool>(
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
                                BlocSelector<EditBranchNoInfoCubit,
                                        EditBranchNoInfoState, String?>(
                                    selector: (state) => state.avatar,
                                    builder: (context, avatar) {
                                      final cubit =
                                          context.read<EditBranchNoInfoCubit>();
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
        BlocSelector<EditBranchNoInfoCubit, EditBranchNoInfoState, String?>(
            selector: (state) => state.role,
            builder: (context, role) {
              final cubit = context.read<EditBranchNoInfoCubit>();
              return CustomTextField(
                padding: const EdgeInsets.only(left: 20, right: 36),
                controller: _roleController,
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
        BlocSelector<EditBranchNoInfoCubit, EditBranchNoInfoState, String>(
            selector: (state) => state.name,
            builder: (context, name) {
              final cubit = context.read<EditBranchNoInfoCubit>();
              return CustomTextField(
                padding: const EdgeInsets.only(left: 20, right: 36),
                controller: _nameController,
                onChanged: (value) {
                  cubit.setName(value);
                },
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
        BlocSelector<EditBranchNoInfoCubit, EditBranchNoInfoState, bool>(
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
        BlocSelector<EditBranchNoInfoCubit, EditBranchNoInfoState, String?>(
            selector: (state) => state.otherName,
            builder: (context, otherName) {
              final cubit = context.read<EditBranchNoInfoCubit>();
              return CustomTextField(
                padding: const EdgeInsets.only(left: 20, right: 36),
                controller: _onameController,
                onChanged: (value) {
                  cubit.setOtherName(value);
                },
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
        BlocSelector<EditBranchNoInfoCubit, EditBranchNoInfoState, String?>(
            selector: (state) => state.job,
            builder: (context, job) {
              final cubit = context.read<EditBranchNoInfoCubit>();
              return CustomTextField(
                padding: const EdgeInsets.only(left: 20, right: 36),
                controller: _jobController,
                onChanged: (value) {
                  cubit.setJob(value);
                },
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
        BlocSelector<EditBranchNoInfoCubit, EditBranchNoInfoState, Gender>(
            selector: (state) => state.gender,
            builder: (context, gender) {
              final cubit = context.read<EditBranchNoInfoCubit>();
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
        BlocSelector<EditBranchNoInfoCubit, EditBranchNoInfoState, String?>(
            selector: (state) => state.birthday,
            builder: (context, birthday) {
              final cubit = context.read<EditBranchNoInfoCubit>();
              return CustomTextField(
                padding: const EdgeInsets.only(left: 20, right: 36),
                controller: _birthdayController,
                onChanged: (value) {
                  cubit.setBirthday(value);
                },
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
        BlocSelector<EditBranchNoInfoCubit, EditBranchNoInfoState, String?>(
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
        BlocSelector<EditBranchNoInfoCubit, EditBranchNoInfoState, bool>(
            selector: (state) => state.isAlive,
            builder: (context, alive) {
              final cubit = context.read<EditBranchNoInfoCubit>();
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
        BlocSelector<EditBranchNoInfoCubit, EditBranchNoInfoState, bool>(
            selector: (state) => state.isAlive,
            builder: (context, alive) {
              final cubit = context.read<EditBranchNoInfoCubit>();
              return CustomTextField(
                padding: const EdgeInsets.only(left: 20, right: 36),
                controller: _deathController,
                onChanged: (value) {
                  cubit.setDeath(value);
                },
                enabled: !alive,
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
        BlocSelector<EditBranchNoInfoCubit, EditBranchNoInfoState, String?>(
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
        BlocSelector<EditBranchNoInfoCubit, EditBranchNoInfoState, String?>(
            selector: (state) => state.worship,
            builder: (context, worship) {
              final cubit = context.read<EditBranchNoInfoCubit>();
              return CustomTextField(
                padding: const EdgeInsets.only(left: 20, right: 36),
                controller: _worshipController,
                onChanged: (value) {
                  cubit.setWorthShip(value);
                },
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
        BlocBuilder<EditBranchNoInfoCubit, EditBranchNoInfoState>(
            builder: (context, state) {
          final cubit = context.read<EditBranchNoInfoCubit>();
          return CustomTextField(
            padding: const EdgeInsets.only(left: 20, right: 36),
            controller: _gravesController,
            onChanged: (value) {
              cubit.setGraves(value);
            },
            enabled: !state.isAlive,
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

  Future<void> _selectDate(
      BuildContext context, EditBranchNoInfoCubit cubit) async {
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

  Future<void> _selectDeath(
      BuildContext context, EditBranchNoInfoCubit cubit) async {
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

Future<void> selectImage(
    BuildContext context, EditBranchNoInfoCubit cubit) async {
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
