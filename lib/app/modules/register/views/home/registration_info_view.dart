import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:genealogy_management/app/core/extension/date_format_extension.dart';
import 'package:genealogy_management/app/core/extension/string_extention.dart';
import '../../../../core/values/app_colors.dart';
import '../../../../core/values/regexp_constant.dart';
import '../../../../data/model/gender.dart';
import '../../../../core/values/string_constants.dart';
import '../../../../core/values/text_styles.dart';
import '../../../../core/widgets/button/floating_text_button.dart';
import '../../../../core/widgets/button/select_image_button.dart';
import '../../../../core/widgets/custom_radio_field/custom_radio_field.dart';
import '../../../../core/widgets/custom_text_field/custom_text_field.dart';
import '../../../../core/widgets/decoration/circle_decoration_widget.dart';
import '../../../../core/widgets/popup/popup_select_image.dart';
import '../../../../main_router.dart';
import '../../cubit/registration_cubit.dart';
import '../../cubit/registration_state.dart';

class RegisterInfoView extends StatefulWidget {
  const RegisterInfoView({
    super.key,
    required this.cubit,
  });
  final RegistrationCubit cubit;
  @override
  State<RegisterInfoView> createState() => _RegisterInfoViewState();
}

class _RegisterInfoViewState extends State<RegisterInfoView> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RegistrationCubit>.value(
      value: widget.cubit,
      child: _buildPage(context),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _dateController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  Widget _buildPage(BuildContext context) {
    return Scaffold(
        // resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.colorFFB20000,
        body: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 130,
                ),
                Container(
                  padding: const EdgeInsets.only(left: 30, bottom: 8),
                  child: Text(
                    StringConstants.welcome,
                    style: TextStyles.mediumWhiteS36,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 30),
                  child: Text(
                    StringConstants.welcome1,
                    style: TextStyles.regularWhiteS20,
                  ),
                ),
                const SizedBox(
                  height: 64,
                ),
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                      color: AppColors.colorFFFFFFFF,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                    ),
                    child: _bodyPage(context),
                  ),
                ),
              ],
            ),
            BlocSelector<RegistrationCubit, RegistrationState, String?>(
                selector: (state) => state.avatar,
                builder: (context, avatar) {
                  final cubit = context.read<RegistrationCubit>();
                  return Positioned(
                      top: 216,
                      left: 100,
                      right: 100,
                      child: SelectImageButton(
                          onTap: () {
                            // await context.router
                            //     .push(ImagePickerViewRoute(registrationState: state));
                            selectImage(context, cubit);
                          },
                          avatar: avatar));
                }),
            const CircleDecorationWidget(
                top: 0,
                right: 0,
                width: 125,
                height: 125,
                borderRadius:
                    BorderRadius.only(bottomLeft: Radius.circular(125))),
            const CircleDecorationWidget(
                top: 225,
                left: 28,
                width: 47,
                height: 47,
                borderRadius: BorderRadius.all(Radius.circular(47))),
            const CircleDecorationWidget(
              top: 208,
              left: -4,
              width: 17,
              height: 17,
            ),
          ],
        ));
  }

  Widget _bodyPage(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 69,
          ),
          BlocSelector<RegistrationCubit, RegistrationState, String>(
              selector: (state) => state.name,
              builder: (context, name) {
                final cubit = context.read<RegistrationCubit>();
                return CustomTextField(
                  padding: const EdgeInsets.only(left: 20, right: 36),
                  controller: _nameController,
                  onChanged: (value) {
                    cubit.setName(value);
                  },
                  customTitle: CustomTitle(
                    title: StringConstants.name,
                    subTitle: StringConstants.obligatory1,
                  ),
                  hintText: StringConstants.firstlastname,
                );
              }),
          BlocSelector<RegistrationCubit, RegistrationState, bool>(
              selector: (state) => state.showHomePage,
              builder: (context, pass) {
                if (!pass) {
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
          BlocSelector<RegistrationCubit, RegistrationState, String>(
              selector: (state) => state.phone,
              builder: (context, phone) {
                _phoneController.text = phone;
                return CustomTextField(
                    padding: const EdgeInsets.only(left: 20, right: 36),
                    controller: _phoneController,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(10),
                    ],
                    hintText: StringConstants.phoneEx,
                    customTitle:
                        CustomTitle(title: StringConstants.phoneNumber));
              }),
          BlocSelector<RegistrationCubit, RegistrationState, bool>(
              selector: (state) => state.phonePass,
              builder: (context, pass) {
                if (!pass) {
                  return ValidateTextField(
                    padding: const EdgeInsets.only(top: 7, left: 20),
                    validate: StringConstants.phoneRule1,
                  );
                } else {
                  return const SizedBox(height: 20);
                }
              }),
          const SizedBox(
            height: 14,
          ),
          CustomTitle(
            title: StringConstants.gender,
            subTitle: StringConstants.obligatory1,
          ),
          BlocSelector<RegistrationCubit, RegistrationState, Gender>(
              selector: (state) => state.gender,
              builder: (context, gender) {
                final cubit = context.read<RegistrationCubit>();
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
          const SizedBox(
            height: 14,
          ),
          BlocSelector<RegistrationCubit, RegistrationState, String?>(
              selector: (state) => state.birthday,
              builder: (context, date) {
                final cubit = context.read<RegistrationCubit>();
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
                        Icons.calendar_today,
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
          BlocSelector<RegistrationCubit, RegistrationState, String?>(
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
          BlocBuilder<RegistrationCubit, RegistrationState>(
              builder: (context, state) {
            final cubit = context.read<RegistrationCubit>();
            return Container(
                alignment: Alignment.center,
                child: FloatingTextButton(
                  loading: (cubit.state.isLoading)
                      ? const CircularProgressIndicator()
                      : null,
                  icon: Icons.done,
                  height: 80,
                  onPressed: () async {
                    if (state.showHomePage && state.name.isEmpty) {
                      cubit.setShowHomePage(false);
                    }
                    if (state.showHomePage && state.name.isNotEmpty) {
                      cubit.register().then((_) async {
                        await context.router.push(const HomeViewRoute());
                      });
                    }
                  },
                  pass: state.showHomePage,
                ));
          }),
        ],
      ),
    );
  }

  Future<void> _selectDate(
      BuildContext context, RegistrationCubit cubit) async {
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

Future<void> selectImage(BuildContext context, RegistrationCubit cubit) async {
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
