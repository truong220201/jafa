import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/values/app_colors.dart';
import '../../../../core/widgets/button/primary_button.dart';
import '../../../../main_router.dart';
import '../../cubit/registration_cubit.dart';
import '../../cubit/registration_state.dart';
import '../../repository/registration_repository.dart';

class RegisterPhoneView extends StatefulWidget {
  const RegisterPhoneView({super.key});
  static String verify = "";
  @override
  State<RegisterPhoneView> createState() => _RegisterPhoneViewState();
}

class _RegisterPhoneViewState extends State<RegisterPhoneView> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          RegistrationCubit(context.read<RegistrationRepository>())..initPass(),
      child: _buildPage(context),
    );
  }

  Widget _buildPage(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.color_255_255_255_1,
      body: BlocListener<RegistrationCubit, RegistrationState>(
        listener: (BuildContext context, state) {},
        child: BlocBuilder<RegistrationCubit, RegistrationState>(
          builder: (context, state) {
            final cubit = context.read<RegistrationCubit>();
            return SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(28),
                child: Form(
                  key: _formKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 200,
                      ),
                      Center(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: const CircleBorder(),
                            primary: AppColors.color_251_239_239_1,
                            padding: const EdgeInsets.all(16),
                          ),
                          onPressed: () async {
                            final previousState = await context.router.pop();
                          },
                          child: const Icon(
                            Icons.arrow_back_outlined,
                            size: 46,
                            color: AppColors.color_148_0_0_1,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      const Text(
                        "Nhập số điện thoại di động",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w700),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width - 52,
                        child: TextFormField(
                          controller: _phoneController,
                          onChanged: (value) {
                            cubit.setPhone(value);
                          },
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(10),
                          ],
                          style: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w700),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Bạn hãy nhập Số điện thoại';
                            } else {
                              return RegExp(
                                          r"^(0?)(3[2-9]|5[6|8|9]|7[0|6-9]|8[0-6|8|9]|9[0-4|6-9])[0-9]{7}$")
                                      .hasMatch(value)
                                  ? null
                                  : "Vui lòng nhập đúng định dạng số điện thoại!";
                            }
                          },
                          decoration: InputDecoration(
                            hintText: '0961234567',
                            focusedBorder: const UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: AppColors.color_148_0_0_1),
                            ),
                            suffixIcon: IconButton(
                              icon: const Icon(
                                Icons.cancel_outlined,
                                color: AppColors.color_148_0_0_1,
                              ),
                              onPressed: () {
                                _phoneController.clear();
                              },
                            ),
                          ),
                          cursorColor: AppColors.color_148_0_0_1,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: BlocBuilder<RegistrationCubit, RegistrationState>(
        builder: (BuildContext context, state) {
          return SizedBox(
            width: 160,
            height: 120,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Gửi mã xác nhận",
                  style: TextStyle(
                      color: AppColors.color_148_0_0_1,
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 4,
                ),
                SizedBox(
                  width: 68,
                  height: 68,
                  child: FloatingActionButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate() &&
                          state.phonePass) {
                        _showdialog(context, state);
                      }
                    },
                    backgroundColor: (state.phonePass)
                        ? AppColors.color_178_0_0_1
                        : AppColors.color_245_245_245_1,
                    foregroundColor: (state.phonePass)
                        ? AppColors.color_255_255_255_1
                        : AppColors.color_194_194_194_1,
                    mini: false,
                    child: const Icon(
                      Icons.arrow_forward_outlined,
                      size: 40,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Future<void> _showdialog(
      BuildContext context, RegistrationState registrationState) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            _phoneController.text,
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
          ),
          content: const Text(
            "Chúng tôi sẽ gửi mã xác mình\nđến số này qua SMS",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14),
          ),
          actionsAlignment: MainAxisAlignment.center,
          actions: [
            Column(
              children: [
                PrimaryButton(
                  onTap: () async {
                    // await FirebaseAuth.instance.verifyPhoneNumber(
                    //   phoneNumber: "+84${_phoneController.text.substring(1)}",
                    //   verificationCompleted:
                    //       (PhoneAuthCredential credential) {},
                    //   verificationFailed: (FirebaseAuthException e) {},
                    //   codeSent: (verificationId, forceResendingToken) async {
                    //     RegisterPhoneView.verify = verificationId;
                    //     Navigator.of(context).pop();
                    await context.router.push(
                        ConfirmViewRoute(registrationState: registrationState));
                    //   },
                    //   codeAutoRetrievalTimeout: (verificationId) {},
                    // );
                  },
                  title: 'Gửi',
                  backgroundColor: AppColors.color_148_0_0_1,
                  textColor: AppColors.color_255_255_255_1,
                  textSize: 16,
                  borderColor: AppColors.color_148_0_0_1,
                  textWeight: FontWeight.w600,
                ),
                const SizedBox(
                  height: 12,
                ),
                PrimaryButton(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  title: 'Cancel',
                  borderColor: AppColors.color_208_213_221_1,
                  backgroundColor: AppColors.color_255_255_255_1,
                  textColor: AppColors.color_52_64_84_1,
                  textSize: 16,
                  textWeight: FontWeight.w600,
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
