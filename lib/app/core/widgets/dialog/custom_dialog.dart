import 'package:flutter/material.dart';

import '../../values/app_colors.dart';
import '../button/primary_button.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog(
      {super.key,
      required this.title,
      required this.content,
      required this.onTap,
      required this.nameButtonSubmit});
  final String title;
  final String content;
  // ignore: prefer_function_declarations_over_variables
  final Function onTap;
  final String nameButtonSubmit;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pop(),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
        child: Scaffold(
          backgroundColor: const Color.fromARGB(37, 0, 0, 0),
          body: Column(children: [
            Expanded(
              child: Container(),
            ),
            Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  color: Color.fromARGB(255, 255, 255, 255)),
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 20, bottom: 16, left: 16, right: 16),
                child: Column(
                  children: [
                    Text(
                      title,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 18),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      content,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 14),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Column(
                      children: [
                        PrimaryButton(
                          onTap:()=> onTap,
                          // await FirebaseAuth.instance.verifyPhoneNumber(
                          //   phoneNumber: "+84${_phoneController.text.substring(1)}",
                          //   verificationCompleted:
                          //       (PhoneAuthCredential credential) {},
                          //   verificationFailed: (FirebaseAuthException e) {},
                          //   codeSent: (verificationId, forceResendingToken) async {
                          //     RegisterPhoneView.verify = verificationId;
                          //     Navigator.of(context).pop();

                          // await context.router.push(
                          //     ConfirmViewRoute(registrationState: registrationState));

                          //   },
                          //   codeAutoRetrievalTimeout: (verificationId) {},
                          // );
                          title: nameButtonSubmit,
                          backgroundColor: AppColors.colorFFB20000,
                          textColor: AppColors.colorFFFBEFEF,
                          textSize: 16,
                          borderColor: AppColors.colorFFFBEFEF,
                          textWeight: FontWeight.w600,
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        PrimaryButton(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          title: 'Trở lại',
                          borderColor: AppColors.colorFFFBEFEF,
                          backgroundColor: AppColors.colorFFFBEFEF,
                          textColor: AppColors.color4B000000,
                          textSize: 16,
                          textWeight: FontWeight.w600,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

Future<void> showdialog(BuildContext context, Function onTap, String title,
    String content, String nameButtonSubmit) async {
  await showDialog(
    context: context,
    builder: (BuildContext context) {
      return GestureDetector(
        onTap: () => Navigator.of(context).pop(),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
          child: Scaffold(
            backgroundColor: const Color.fromARGB(37, 0, 0, 0),
            body: Column(children: [
              Expanded(
                child: Container(),
              ),
              Container(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    color: Color.fromARGB(255, 255, 255, 255)),
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 20, bottom: 16, left: 16, right: 16),
                  child: Column(
                    children: [
                      Text(
                        title,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 18),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        content,
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 14),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Column(
                        children: [
                          PrimaryButton(
                            onTap: () async {
                              onTap();
                              // await FirebaseAuth.instance.verifyPhoneNumber(
                              //   phoneNumber: "+84${_phoneController.text.substring(1)}",
                              //   verificationCompleted:
                              //       (PhoneAuthCredential credential) {},
                              //   verificationFailed: (FirebaseAuthException e) {},
                              //   codeSent: (verificationId, forceResendingToken) async {
                              //     RegisterPhoneView.verify = verificationId;
                              //     Navigator.of(context).pop();

                              // await context.router.push(
                              //     ConfirmViewRoute(registrationState: registrationState));

                              //   },
                              //   codeAutoRetrievalTimeout: (verificationId) {},
                              // );
                            },
                            title: nameButtonSubmit,
                            backgroundColor: AppColors.colorFFB20000,
                            textColor: AppColors.colorFFB20000,
                            textSize: 16,
                            borderColor: AppColors.colorFFFBEFEF,
                            textWeight: FontWeight.w600,
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          PrimaryButton(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            title: 'Trở lại',
                            borderColor: AppColors.colorFFFBEFEF,
                            backgroundColor: AppColors.colorFFFBEFEF,
                            textColor: AppColors.color4B000000,
                            textSize: 16,
                            textWeight: FontWeight.w600,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ]),
          ),
        ),
      );
    },
  );
}
