import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:genealogy_management/app/core/extension/date_format_extension.dart';
import 'package:genealogy_management/app/core/extension/string_extention.dart';
import 'package:genealogy_management/app/main_router.dart';
import '../../../core/values/app_colors.dart';
import '../../../core/values/regexp_constant.dart';
import '../../../core/widgets/appBar/custom_appbar.dart';
import '../../../data/model/gender.dart';
import '../../../core/values/string_constants.dart';
import '../../../core/widgets/button/select_image_button.dart';
import '../../../core/widgets/custom_radio_field/custom_radio_field.dart';
import '../../../core/widgets/custom_text_field/custom_text_field.dart';
import '../../../core/widgets/popup/popup_select_image.dart';
import '../../../data/model/user.dart';
import '../cubit/edit_user_info_cubit.dart';
import '../cubit/edit_user_info_state.dart';
import '../repository/edit_user_info_repository.dart';

class EditUserInfoView extends StatefulWidget {
  const EditUserInfoView({
    super.key,
    required this.user,
  });
  final User user;
  @override
  State<EditUserInfoView> createState() => _EditUserInfoViewState();
}

class _EditUserInfoViewState extends State<EditUserInfoView> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _onameController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _jobController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          EditUserInfoCubit(context.read<EditUserInfoRepository>())
            ..initData(widget.user),
      child: _buildPage(context),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _dateController.dispose();
    _phoneController.dispose();
    _onameController.dispose();
    _emailController.dispose();
    _jobController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _nameController.text = widget.user.name ?? "";
    if (widget.user.otherName != null) {
      _onameController.text = widget.user.otherName ?? "";
    }
    if (widget.user.jobName != null) {
      _jobController.text = widget.user.jobName ?? "";
    }
    if (widget.user.birthday != null) {
      _dateController.text = widget.user.birthday?.toFormattedDate() ?? "";
    }
    if (widget.user.phone != null) {
      _phoneController.text = widget.user.phone ?? "";
    }
    if (widget.user.email != null) {
      _emailController.text = widget.user.email ?? "";
    }
    super.initState();
  }

  Widget _buildPage(BuildContext context) {
    return BlocListener<EditUserInfoCubit, EditUserInfoState>(
      listenWhen: (previous, current) => current.saveDone != previous.saveDone,
      listener: (context, state) {
        if (state.saveDone) {
          context.router.pushAndPopUntil(const HomeViewRoute(),
              predicate: (route) => false);
        }
      },
      child: Scaffold(
        appBar: CustomAppBar(
          leadingWidth: 49,
          leading: Row(
            children: [
              const SizedBox(width: 9),
              CustomAppbarItem(
                icon: Icons.arrow_back,
                onPressed: () {
                  context.router.pop();
                },
              ),
            ],
          ),
          actions: [
            BlocSelector<EditUserInfoCubit, EditUserInfoState, bool>(
                selector: (state) => state.validateDone,
                builder: (context, validateDone) {
                  return CustomAppbarItem(
                    icon: Icons.done,
                    onPressed: () {
                      if (validateDone) {
                        context.read<EditUserInfoCubit>().saveData();
                      }
                    },
                    background: (validateDone)
                        ? AppColors.colorFFFBEFEF
                        : AppColors.colorFFF5F5F5,
                    iconColor: (validateDone)
                        ? AppColors.colorFFB20000
                        : AppColors.colorFFC2C2C2,
                  );
                }),
            const SizedBox(width: 9),
          ],
          title: 'Sửa thông tin cá nhân',
        ),
        backgroundColor: AppColors.colorFFFBEFEF,
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  Container(
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
              BlocSelector<EditUserInfoCubit, EditUserInfoState, String?>(
                  selector: (state) => state.avatar,
                  builder: (context, avatar) {
                    final cubit = context.read<EditUserInfoCubit>();
                    return Positioned(
                        top: 50,
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
        ),
      ),
    );
  }

  Widget _bodyPage(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 69),
          BlocSelector<EditUserInfoCubit, EditUserInfoState, String>(
              selector: (state) => state.name,
              builder: (context, name) {
                final cubit = context.read<EditUserInfoCubit>();
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
                );
              }),
          (_nameController.text.isEmpty)
              ? ValidateTextField(
                  padding: const EdgeInsets.only(top: 7, left: 20),
                  validate: StringConstants.obligatory,
                )
              : const SizedBox(height: 20),
          const SizedBox(height: 14),
          BlocSelector<EditUserInfoCubit, EditUserInfoState, String?>(
              selector: (state) => state.otherName,
              builder: (context, otherName) {
                final cubit = context.read<EditUserInfoCubit>();
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
          const SizedBox(height: 14),
          BlocSelector<EditUserInfoCubit, EditUserInfoState, String?>(
              selector: (state) => state.job,
              builder: (context, job) {
                final cubit = context.read<EditUserInfoCubit>();
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
          const SizedBox(height: 14),
          CustomTitle(
            title: StringConstants.gender,
            subTitle: StringConstants.obligatory1,
          ),
          BlocSelector<EditUserInfoCubit, EditUserInfoState, Gender>(
              selector: (state) => state.gender,
              builder: (context, gender) {
                final cubit = context.read<EditUserInfoCubit>();
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
          Container(
            padding: const EdgeInsets.only(left: 22, right: 34),
            child: const Divider(
              color: AppColors.colorFFADADAD,
              thickness: 1,
            ),
          ),
          const SizedBox(height: 14),
          BlocSelector<EditUserInfoCubit, EditUserInfoState, String?>(
              selector: (state) => state.birthday,
              builder: (context, date) {
                final cubit = context.read<EditUserInfoCubit>();
                return CustomTextField(
                    padding: const EdgeInsets.only(left: 20, right: 36),
                    customTitle: CustomTitle(title: StringConstants.birthday),
                    keyboardType: TextInputType.datetime,
                    inputFormatters: [
                      FilteringTextInputFormatter.deny(
                          RegexpConstants.dateDeny),
                    ],
                    controller: _dateController,
                    hintText: StringConstants.date,
                    suffixIcon: IconButton(
                      icon: const Icon(
                        Icons.calendar_month_rounded,
                        color: AppColors.colorFF000000,
                      ),
                      onPressed: () {
                        _selectDate(context, cubit);
                      },
                    ),
                    onChanged: (value) {
                      cubit.setBirthday(value);
                    },
                    inputBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: AppColors.colorFFADADAD),
                    ),
                    cursorColor: AppColors.colorFF000000);
              }),
          BlocSelector<EditUserInfoCubit, EditUserInfoState, String?>(
              selector: (state) => state.birthday,
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
          const SizedBox(height: 14),
          BlocSelector<EditUserInfoCubit, EditUserInfoState, String?>(
              selector: (state) => state.phone,
              builder: (context, phone) {
                final cubit = context.read<EditUserInfoCubit>();
                return CustomTextField(
                    padding: const EdgeInsets.only(left: 20, right: 36),
                    controller: _phoneController,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(10),
                    ],
                    onChanged: (value) {
                      cubit.setPhone(value);
                    },
                    hintText: StringConstants.phoneHint,
                    customTitle:
                        CustomTitle(title: StringConstants.phoneNumber));
              }),
          const SizedBox(height: 14),
          BlocSelector<EditUserInfoCubit, EditUserInfoState, String?>(
              selector: (state) => state.email,
              builder: (context, email) {
                final cubit = context.read<EditUserInfoCubit>();
                return CustomTextField(
                    padding: const EdgeInsets.only(left: 20, right: 36),
                    controller: _emailController,
                    hintText: StringConstants.emailHint,
                    onChanged: (value) {
                      cubit.setEmail(value);
                    },
                    customTitle: CustomTitle(title: StringConstants.email));
              }),
          const SizedBox(height: 40),
        ],
      ),
    );
  }

  Future<void> _selectDate(
      BuildContext context, EditUserInfoCubit cubit) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      cubit.setBirthday(picked.toFormattedDate());
      setState(() {
        _dateController.text = picked.toFormattedDate();
      });
    }
  }
}

Future<void> selectImage(BuildContext context, EditUserInfoCubit cubit) async {
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
