import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/values/app_colors.dart';
import 'package:intl/intl.dart';
import '../../../../core/widgets/button/custom_buttom.dart';
import '../../../../main_router.dart';
import '../../cubit/registration_cubit.dart';
import '../../cubit/registration_state.dart';
import '../../models/user_model.dart';
import '../../repository/registration_repository.dart';
import '../login/confirm_view.dart';

class RegisterInfoView extends StatefulWidget {
  const RegisterInfoView({super.key, required this.registrationState});
  final RegistrationState registrationState;
  static String avatar = "";
  @override
  State<RegisterInfoView> createState() => _RegisterInfoViewState();
}

class _RegisterInfoViewState extends State<RegisterInfoView> {
  String selectedGender = "Nữ";
  DateTime? selectedDate;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return RegistrationCubit(context.read<RegistrationRepository>())
          ..initData(widget.registrationState);
      },
      child: _buildPage(context),
    );
  }

  Widget _buildPage(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.color_178_0_0_1,
      body: BlocListener<RegistrationCubit, RegistrationState>(
        listener: (BuildContext context, state) {},
        child: BlocBuilder<RegistrationCubit, RegistrationState>(
            builder: (context, state) {
          final cubit = context.read<RegistrationCubit>();
          _phoneController.text = state.phone;
          return Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 130,
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 30, bottom: 8),
                    child: const Text(
                      "Chào mừng!",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 36,
                        color: AppColors.color_255_255_255_1,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 30),
                    child: const Text(
                      "Hãy cho chúng tôi biết thêm về bạn",
                      style: TextStyle(
                        fontSize: 20,
                        color: AppColors.color_255_255_255_1,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 64,
                  ),
                  Expanded(
                    child: Container(
                        decoration: const BoxDecoration(
                          color: AppColors.color_255_255_255_1,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20)),
                        ),
                        child: SingleChildScrollView(
                          child: Form(
                            key: _formKey,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 69,
                                ),
                                Container(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: RichText(
                                    text: const TextSpan(
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: 'Tên',
                                          style: TextStyle(
                                              color: AppColors.color_0_0_0_1,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w700),
                                        ),
                                        TextSpan(
                                            text: '*',
                                            style: TextStyle(
                                                color: Color.fromRGBO(
                                                    255, 0, 0, 1),
                                                fontSize: 18,
                                                fontWeight: FontWeight.w700)),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 36),
                                  child: TextFormField(
                                    controller: _nameController,
                                    style: const TextStyle(
                                      fontSize: 15,
                                    ),
                                    onChanged: (value) {
                                      cubit.setName(value);
                                    },
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Trường bắt buộc!';
                                      }
                                    },
                                    decoration: const InputDecoration(
                                      hintText: 'Họ và tên',
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color.fromRGBO(
                                                173, 173, 173, 1)),
                                      ),
                                    ),
                                    cursorColor: AppColors.color_0_0_0_1,
                                  ),
                                ),
                                const SizedBox(
                                  height: 14,
                                ),
                                Container(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: const Text('Số điện thoại',
                                      style: TextStyle(
                                          color: AppColors.color_0_0_0_1,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700)),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 36),
                                  child: TextFormField(
                                    controller: _phoneController,
                                    style: const TextStyle(
                                      fontSize: 15,
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Bạn hãy nhập SĐT';
                                      }
                                    },
                                    keyboardType: TextInputType.number,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly,
                                      LengthLimitingTextInputFormatter(10),
                                    ],
                                    decoration: const InputDecoration(
                                      hintText: '09012345678',
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color.fromRGBO(
                                                173, 173, 173, 1)),
                                      ),
                                    ),
                                    cursorColor: AppColors.color_0_0_0_1,
                                  ),
                                ),
                                const SizedBox(
                                  height: 14,
                                ),
                                Container(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: RichText(
                                    text: const TextSpan(
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: 'Giới tính',
                                          style: TextStyle(
                                              color: AppColors.color_0_0_0_1,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w700),
                                        ),
                                        TextSpan(
                                            text: '*',
                                            style: TextStyle(
                                                color: Color.fromRGBO(
                                                    255, 0, 0, 1),
                                                fontSize: 18,
                                                fontWeight: FontWeight.w700)),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 140,
                                        child: RadioListTile(
                                          title: const Text('Nam'),
                                          value: 'Nam',
                                          groupValue: selectedGender,
                                          onChanged: (value) {
                                            setState(() {
                                              selectedGender = value.toString();
                                              cubit.setGender(value.toString());
                                            });
                                          },
                                          activeColor:
                                              AppColors.color_148_0_0_1,
                                        ),
                                      ),
                                      Container(
                                        width: 120,
                                        child: RadioListTile(
                                          title: const Text('Nữ'),
                                          value: 'Nữ',
                                          groupValue: selectedGender,
                                          onChanged: (value) {
                                            setState(() {
                                              selectedGender = value.toString();
                                              cubit.setGender(value.toString());
                                            });
                                          },
                                          activeColor:
                                              AppColors.color_148_0_0_1,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.only(
                                      left: 22, right: 34),
                                  child: const Divider(
                                    color: Color.fromRGBO(173, 173, 173, 1),
                                    thickness: 1,
                                  ),
                                ),
                                const SizedBox(
                                  height: 14,
                                ),
                                Container(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: const Text('Ngày tháng năm sinh',
                                      style: TextStyle(
                                          color: AppColors.color_0_0_0_1,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700)),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 36),
                                  child: TextFormField(
                                    controller: _dateController,
                                    style: const TextStyle(
                                      fontSize: 15,
                                    ),
                                    keyboardType: TextInputType.datetime,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.deny(
                                          RegExp(r'[^\d\/]')),
                                    ],
                                    validator: (value) {
                                      if (!RegExp(r'^\d{1,2}/\d{1,2}/\d{4}$')
                                          .hasMatch(value!)) {
                                        return 'Ngày tháng năm không hợp lệ!';
                                      }
                                      return null;
                                    },
                                    onChanged: (value) {
                                      cubit.setBirthday(value);
                                    },
                                    decoration: InputDecoration(
                                        hintText: 'Ngày/tháng/năm',
                                        focusedBorder:
                                            const UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color.fromRGBO(
                                                  173, 173, 173, 1)),
                                        ),
                                        suffixIcon: IconButton(
                                          icon: const Icon(
                                            Icons.calendar_today,
                                            color: AppColors.color_0_0_0_1,
                                          ),
                                          onPressed: () {
                                            _selectDate(context);
                                          },
                                        )),
                                    cursorColor: AppColors.color_0_0_0_1,
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  padding: const EdgeInsets.only(top: 48),
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      shape: const CircleBorder(),
                                      primary: (state.showHomePage)
                                          ? AppColors.color_178_0_0_1
                                          : AppColors.color_245_245_245_1,
                                      padding: const EdgeInsets.all(16),
                                    ),
                                    onPressed: () async {
                                      if (state.showHomePage &&
                                          _formKey.currentState!.validate()) {
                                        UserModel userModel = UserModel(
                                            avatar: '',
                                            birthday: _dateController.text,
                                            gender: selectedGender,
                                            id: ConfirmView.userCredential?.user
                                                    ?.uid ??
                                                "idtsse",
                                            name: _nameController.text,
                                            phone: _phoneController.text);
                                        cubit.createUser(userModel);
                                        cubit.setUserModel(userModel);
                                        final nextState = await context.router
                                            .push(const HomeViewRoute());
                                      }
                                    },
                                    child: Icon(
                                      Icons.done,
                                      size: 36,
                                      color: (state.showHomePage)
                                          ? AppColors.color_251_239_239_1
                                          : AppColors.color_194_194_194_1,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )),
                  ),
                ],
              ),
              Positioned(
                  top: 216,
                  left: 100,
                  right: 100,
                  child: InkWell(
                    onTap: () async {
                      // await context.router
                      //     .push(ImagePickerViewRoute(registrationState: state));
                      selectImage(context, cubit);
                    },
                    child: (state.avatar == '')
                        ? Container(
                            decoration: const BoxDecoration(
                                color: AppColors.color_239_241_243_1,
                                shape: BoxShape.circle),
                            height: 100,
                            child: const Icon(
                              Icons.camera_alt,
                              color: AppColors.color_96_96_96_1,
                              size: 32,
                            ),
                          )
                        : Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: FileImage(
                                  File(state.avatar),
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                  )),
              Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                      width: 125,
                      height: 125,
                      decoration: const BoxDecoration(
                        color: AppColors.color_251_239_239_1,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(125),
                        ),
                      ))),
              Positioned(
                  top: 225,
                  left: 28,
                  child: Container(
                      width: 47,
                      height: 47,
                      decoration: const BoxDecoration(
                        color: AppColors.color_251_239_239_1,
                        borderRadius: BorderRadius.all(
                          Radius.circular(47),
                        ),
                      ))),
              Positioned(
                  top: 208,
                  left: -4,
                  child: Container(
                      width: 17,
                      height: 17,
                      decoration: const BoxDecoration(
                        color: AppColors.color_251_239_239_1,
                        borderRadius: BorderRadius.all(
                          Radius.circular(17),
                        ),
                      ))),
            ],
          );
        }),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        selectedDate = picked;
        _dateController.text = DateFormat('dd/MM/yyyy').format(picked);
      });
    }
  }
}

bool isDateFormatValid(String value) {
  try {
    final format = DateFormat('dd/MM/yyyy');
    final date = format.parseStrict(value);
    final formattedValue = format.format(date);
    return value == formattedValue;
  } catch (e) {
    return false;
  }
}

Future<void> selectImage(BuildContext context, RegistrationCubit cubit) async {
  await showModalBottomSheet(
    backgroundColor: Colors.transparent,
    context: context,
    builder: (BuildContext context) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomButton(
                width: 120,
                backgroundColor: AppColors.color_255_255_255_1,
                onTap: () {
                  cubit.chooseImageFromGallery();
                  Navigator.pop(context);
                },
                textColor: AppColors.color_0_0_0_1,
                textSize: 16,
                title: 'Chọn ảnh',
                icon: const Icon(Icons.image),
              ),
              const SizedBox(
                width: 40,
              ),
              CustomButton(
                width: 120,
                icon: const Icon(Icons.camera_alt),
                backgroundColor: AppColors.color_255_255_255_1,
                onTap: () {
                  cubit.takeImageFromCamera();
                  Navigator.pop(context);
                },
                textColor: AppColors.color_0_0_0_1,
                textSize: 16,
                title: 'Chụp ảnh',
              ),
            ],
          ),
          const SizedBox(
            height: 40,
          ),
        ],
      );
    },
  );
}
