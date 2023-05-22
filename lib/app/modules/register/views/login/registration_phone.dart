import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../../../../core/values/app_colors.dart';
import '../../../../main_router.dart';

class RegisterPhoneView extends StatefulWidget {
  const RegisterPhoneView({super.key});

  @override
  State<RegisterPhoneView> createState() => _RegisterPhoneViewState();
}

class _RegisterPhoneViewState extends State<RegisterPhoneView> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _phoneController = TextEditingController();
  bool isShowing = false;
  void enableButton() {
    setState(() {
      isShowing = true;
    });
  }

  void disnableButton() {
    setState(() {
      isShowing = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      body: SingleChildScrollView(
        child: Center(
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              children: [
                const SizedBox(
                  height: 200,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    primary: const Color.fromRGBO(251, 239, 239, 1),
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
                const SizedBox(
                  height: 24,
                ),
                const Text(
                  "Nhập số điện thoại di động",
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                ),
                Container(
                  width: 320,
                  child: TextFormField(
                    controller: _phoneController,
                    onChanged: (value) {
                      if (RegExp(
                              r"^(0?)(3[2-9]|5[6|8|9]|7[0|6-9]|8[0-6|8|9]|9[0-4|6-9])[0-9]{7}$")
                          .hasMatch(value)) {
                        enableButton();
                      } else {
                        disnableButton();
                      }
                    },
                    keyboardType: TextInputType.number,
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.w700),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Trường bắt buộc';
                      } else {
                        return RegExp(
                                    r"^(0?)(3[2-9]|5[6|8|9]|7[0|6-9]|8[0-6|8|9]|9[0-4|6-9])[0-9]{7}$")
                                .hasMatch(value)
                            ? null
                            : "Vui lòng nhập đúng định dạng số điện thoại!";
                      }
                    },
                    decoration: InputDecoration(
                      hintText: 'Number',
                      focusedBorder: const UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: AppColors.color_148_0_0_1),
                      ),
                      suffixIcon: IconButton(
                        icon: const Icon(
                          Icons.clear,
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
      ),
      floatingActionButton: Container(
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
            Container(
              width: 68,
              height: 68,
              child: FloatingActionButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) _showdialog(context);
                },
                backgroundColor: (isShowing)
                    ? AppColors.color_178_0_0_1
                    : AppColors.color_245_245_245_1,
                foregroundColor: (isShowing)
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
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

Future<void> _showdialog(BuildContext context) async {
  await showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text(
          "09012345678",
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
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
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: AppColors.color_148_0_0_1,
                  padding: const EdgeInsets.only(
                      left: 120, right: 120, top: 10, bottom: 10),
                ),
                child: const Text(
                  "Gửi",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                ),
                onPressed: () async {
                  Navigator.of(context).pop();
                  final nextState =
                      await context.router.push(const ConfirmViewRoute());
                },
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: const Color.fromRGBO(208, 213, 221, 1),
                  padding: const EdgeInsets.only(
                      left: 120, right: 120, top: 10, bottom: 10),
                ),
                child: const Text(
                  "Cancel",
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
          ),
        ],
      );
    },
  );
}
