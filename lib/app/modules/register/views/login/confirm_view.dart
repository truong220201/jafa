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
import '../../models/user_model.dart';
import '../../repository/registration_repository.dart';
import 'registration_phone_view.dart';

class ConfirmView extends StatefulWidget {
  const ConfirmView({super.key, required this.registrationState});
  final RegistrationState registrationState;
  static UserCredential? userCredential;

  @override
  State<ConfirmView> createState() => _ConfirmViewState();
}

class _ConfirmViewState extends State<ConfirmView> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _confirmController = TextEditingController();
  final FirebaseAuth auth = FirebaseAuth.instance;

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
      backgroundColor: AppColors.color_255_255_255_1,
      body: BlocListener<RegistrationCubit, RegistrationState>(
        listener: (BuildContext context, state) {},
        child: BlocBuilder<RegistrationCubit, RegistrationState>(
            builder: (context, state) {
          final cubit = context.read<RegistrationCubit>();

          return SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(21),
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
                    Text(
                      "Nhập mã xác minh gồm 6 chữ số đã gửi tới\n${state.phone}",
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 52,
                      child: TextFormField(
                        controller: _confirmController,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(6),
                        ],
                        style: const TextStyle(
                          fontSize: 15,
                        ),
                        decoration: InputDecoration(
                          hintText: '123456',
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
                              _confirmController.clear();
                            },
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Bạn hãy nhập mã OTP ';
                          } else {
                            return RegExp(r"^\d{6}$").hasMatch(value)
                                ? null
                                : "Vui lòng nhập đúng 6 chữ số!";
                          }
                        },
                        onChanged: (value) {
                          cubit.setConfirmCode(value);
                        },
                        cursorColor: AppColors.color_0_0_0_1,
                      ),
                    ),
                    const SizedBox(
                      height: 52,
                    ),
                    const Text(
                      "Bạn chưa nhận được mã?",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextButton(
                      onPressed: () async {
                        await FirebaseAuth.instance.verifyPhoneNumber(
                          phoneNumber: "+84${state.phone.substring(1)}",
                          verificationCompleted:
                              (PhoneAuthCredential credential) {},
                          verificationFailed: (FirebaseAuthException e) {},
                          codeSent:
                              (verificationId, forceResendingToken) async {
                            RegisterPhoneView.verify = verificationId;
                          },
                          codeAutoRetrievalTimeout: (verificationId) {},
                        );
                      },
                      child: const Text("Yêu cầu mã mới",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: AppColors.color_148_0_0_1)),
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
      floatingActionButton: BlocBuilder<RegistrationCubit, RegistrationState>(
        builder: (BuildContext context, state) {
          final cubit = context.read<RegistrationCubit>();
          return SizedBox(
            width: 68,
            height: 68,
            child: FloatingActionButton(
              onPressed: () async {
                // try {
                //   if (state.confirmCodePass) {
                //     PhoneAuthCredential credential =
                //         PhoneAuthProvider.credential(
                //             verificationId: RegisterPhoneView.verify,
                //             smsCode: _confirmController.text);

                //     UserCredential userCredential1 =
                //         await auth.signInWithCredential(credential);
                //     UserModel userModel = UserModel(
                //         avatar: '',
                //         birthday: '',
                //         gender: '',
                //         id: userCredential1.user!.uid,
                //         name: '',
                //         phone: userCredential1.user!.phoneNumber!);
                //     ConfirmView.userCredential = userCredential1;
                //     cubit.setUserModel(userModel);
                //     cubit.createUser(userModel);
                // ignore: use_build_context_synchronously
                if (state.confirmCodePass &&
                    _formKey.currentState!.validate()) {
                  await context.router
                      .push(RegisterInfoViewRoute(registrationState: state));
                }
                //   }
                // } catch (e) {
                //   _showdialogIncorrect(context);
                // }
              },
              backgroundColor: (state.confirmCodePass)
                  ? AppColors.color_178_0_0_1
                  : AppColors.color_245_245_245_1,
              foregroundColor: (state.confirmCodePass)
                  ? AppColors.color_255_255_255_1
                  : AppColors.color_194_194_194_1,
              mini: false,
              child: const Icon(
                Icons.arrow_forward_outlined,
                size: 40,
              ),
            ),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

Future<void> _showdialogIncorrect(BuildContext context) async {
  await showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text(
          "Bạn đã nhập mã không\nchính xác",
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
        ),
        actionsAlignment: MainAxisAlignment.center,
        actions: [
          PrimaryButton(
            backgroundColor: AppColors.color_255_255_255_1,
            onTap: () {
              Navigator.pop(context);
            },
            textColor: AppColors.color_52_64_84_1,
            textSize: 16,
            textWeight: FontWeight.w600,
            title: 'OK',
          ),
        ],
      );
    },
  );
}

Future<void> _showdialogTimeout(BuildContext context) async {
  await showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text(
          "Bạn đã nhập mã không\nchính xác",
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
        ),
        actionsAlignment: MainAxisAlignment.center,
        actions: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
                side: const BorderSide(
                    color: Color.fromRGBO(0, 0, 0, 0.3), width: 2.0),
              ),
              primary: AppColors.color_255_255_255_1,
              padding: const EdgeInsets.only(
                  left: 120, right: 120, top: 10, bottom: 10),
            ),
            child: const Text(
              "OK",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: Color.fromRGBO(52, 64, 84, 1)),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
