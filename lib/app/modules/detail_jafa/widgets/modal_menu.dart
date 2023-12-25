import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:genealogy_management/app/core/values/string_constants.dart';

import '../../../core/values/app_colors.dart';
import '../../../core/values/text_styles.dart';
import '../../../core/widgets/button/primary_button.dart';
import '../cubit/tree_detail_cubit.dart';
import '../cubit/tree_detail_state.dart';

enum ModalMenuType { leave, delete, edit }

class ModalMenu extends StatelessWidget {
  const ModalMenu({super.key, required this.callbackFunc});

  final Function(ModalMenuType type) callbackFunc;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TreeDetailCubit, TreeDetailState>(
        builder: (context, state) {
      return GestureDetector(
        onTap: () => context.read<TreeDetailCubit>().changeModal(),
        child: Container(
          alignment: Alignment.topRight,
          decoration:
              const BoxDecoration(color: Color.fromARGB(141, 133, 133, 133)),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
                width: 210,
                height: 127,
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 255, 255, 255),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _cardMini(
                      context,
                      SvgPicture.asset(
                        "assets/images/edit_icon.svg",
                      ),
                      StringConstants.editInfo,
                      () {
                        Navigator.of(context).pop();
                        callbackFunc(ModalMenuType.edit);
                      },
                    ),
                    _cardMiniExit(context, StringConstants.leavejafa, () {
                      _showdialogWithCountDown(
                          context,
                          () {
                            Navigator.of(context).pop();
                        callbackFunc(ModalMenuType.leave);
                          },
                          StringConstants.sureLeaveJafa,
                          StringConstants.alertContentLeveJafa,
                          StringConstants.agree);
                    }),
                    _cardMini(
                      context,
                      SvgPicture.asset(
                        "assets/images/ic_trash.svg",
                      ),
                      StringConstants.deleteJafa,
                      () {
                        _showdialogWithCountDown(context, () {
                          Navigator.of(context).pop();
                        callbackFunc(ModalMenuType.delete);
                        },
                            StringConstants.sureDeleteJafa,
                            StringConstants.alertContentDeleteJafa,
                            StringConstants.agree);
                      },
                    ),
                  ],
                )),
          ),
        ),
      );
    });
  }

  Future<void> _showdialogWithCountDown(
    BuildContext context,
    Function onTap,
    String title,
    String content,
    String nameButtonSubmit,
  ) async {
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
                              title: StringConstants.agree,
                              backgroundColor: AppColors.colorFFB20000,
                              textColor: AppColors.colorFFFFFFFF,
                              textSize: 16,
                              borderColor: AppColors.colorFFB20000,
                              textWeight: FontWeight.w600,
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            PrimaryButton(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              title: StringConstants.back,
                              borderColor: AppColors.color4B000000,
                              backgroundColor: AppColors.colorFFFFFFFF,
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

  Widget _cardMini(
      BuildContext context, SvgPicture icon, String content, Function onTapp) {
    return GestureDetector(
      onTap: () => onTapp(),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 2),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: icon,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    content,
                    style: TextStyles.medium14LineHeight21Sur,
                  )
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }

  Widget _cardMiniExit(BuildContext context, String content, Function onTap) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        decoration: const BoxDecoration(
            color: Color.fromARGB(255, 229, 170, 170),
            borderRadius: BorderRadius.all(Radius.circular(8.0))),
        padding: const EdgeInsets.symmetric(vertical: 10),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: SvgPicture.asset(
              "assets/images/ic_log_out.svg",
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  content,
                  style: TextStyles.medium14LineHeight21Sur
                      .copyWith(color: const Color.fromARGB(255, 148, 0, 0)),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: SvgPicture.asset(
              "assets/images/caret.svg",
            ),
          ),
        ]),
      ),
    );
  }
}

// class ShowDialogCD extends StatelessWidget {
//   const ShowDialogCD({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<TreeDetailCubit, TreeDetailState>(
//         builder: (context, state) {
//       return state.showModal!
//           ? const Positioned(
//               child: Align(alignment: Alignment.topRight, child: ModalMenu()),
//             )
//           : Container();
//     });
//   }
// }

class CountDown extends StatelessWidget {
  CountDown({super.key});

  void changeCD() {
    const oneDecimal = Duration(milliseconds: 1000);
    // Future.delayed(const Duration(seconds: 1), () {
    //   emit(state.copyWith(countDown: (state.countDown! - 100)));
    //   debugPrint('ok countDown');
    // });
    // Timer.periodic(oneDecimal, (Timer timer) {
    //   if (countDown == 0) {
    //     debugPrint(widget.string.toString());
    //     widget.functions;
    //     timer.cancel();
    //   } else {
    //     setState(() {
    //       countDown = countDown - 1;
    //     });
    //   }
    // });
  }

  int countDown = 5;
  @override
  Widget build(BuildContext context) {
    return BlocSelector<TreeDetailCubit, TreeDetailState, int?>(
        selector: (state) => state.countDown,
        builder: (context, state) {
          return Text(state.toString());
        });
  }
}
