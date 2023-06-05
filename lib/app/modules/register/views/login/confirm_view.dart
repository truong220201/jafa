import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/values/app_colors.dart';
import '../../../../core/values/string_constants.dart';
import '../../../../core/values/text_styles.dart';
import '../../../../core/widgets/button/back_button.dart';
import '../../../../core/widgets/button/floating_text_button.dart';
import '../../../../core/widgets/custom_text_field/custom_text_field.dart';
import '../../../../core/widgets/popup/popup_notice.dart';
import '../../../../main_router.dart';
import '../../cubit/registration_cubit.dart';
import '../../cubit/registration_state.dart';
import 'registration_phone_view.dart';

class ConfirmView extends StatefulWidget {
  const ConfirmView({super.key, required this.cubit});
  final RegistrationCubit cubit;
  static UserCredential? userCredential;

  @override
  State<ConfirmView> createState() => _ConfirmViewState();
}

class _ConfirmViewState extends State<ConfirmView> {
  final TextEditingController _confirmController = TextEditingController();

  @override
  void dispose() {
    _confirmController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RegistrationCubit>.value(
      value: widget.cubit,
      child: _buildPage(context),
    );
  }

  Widget _buildPage(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorFFFFFFFF,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(21),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 200,
              ),
              const CustomBackButton(),
              const SizedBox(
                height: 24,
              ),
              BlocSelector<RegistrationCubit, RegistrationState, String>(
                  selector: (state) => state.phone,
                  builder: (context, phone) {
                    final cubit = context.read<RegistrationCubit>();
                    return CustomTextField(
                      hintText: StringConstants.otpHint,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(6),
                      ],
                      onChanged: (value) {
                        cubit.setConfirmCode(value);
                      },
                      controller: _confirmController,
                      customTitle: CustomTitle(
                        padding: null,
                        title: '${StringConstants.otpTitle}\n$phone',
                      ),
                      suffixIcon: IconButton(
                        icon: const Icon(
                          Icons.cancel_outlined,
                          color: AppColors.colorFF940000,
                        ),
                        onPressed: () {
                          _confirmController.clear();
                        },
                      ),
                    );
                  }),
              BlocSelector<RegistrationCubit, RegistrationState, bool>(
                  selector: (state) => state.confirmCodePass,
                  builder: (context, pass) {
                    if (!pass) {
                      return ValidateTextField(
                        validate: StringConstants.roleOtp,
                      );
                    } else {
                      return const SizedBox(height: 20);
                    }
                  }),
              const SizedBox(
                height: 52,
              ),
              Text(
                StringConstants.otpLost,
                style: TextStyles.size20,
              ),
              const SizedBox(
                height: 20,
              ),
              BlocSelector<RegistrationCubit, RegistrationState, String>(
                  selector: (state) => state.phone,
                  builder: (context, phone) {
                    final cubit = context.read<RegistrationCubit>();
                    return TextButton(
                      onPressed: () {
                        cubit.verify(phone, RegisterPhoneView.verify, null);
                      },
                      child: Text(StringConstants.newOtp,
                          style: TextStyles.boldRedS18),
                    );
                  }),
            ],
          ),
        ),
      ),
      floatingActionButton: BlocBuilder<RegistrationCubit, RegistrationState>(
          builder: (BuildContext context, state) {
        final cubit = context.read<RegistrationCubit>();
        return FloatingTextButton(
          icon: Icons.arrow_forward_outlined,
          onPressed: () async {
            if (state.confirmCodePass && state.confirmCode.isEmpty) {
              cubit.setConfirmPass(false);
            }
            if (state.confirmCodePass && state.confirmCode.isNotEmpty) {
              cubit.credential(
                  RegisterPhoneView.verify, _confirmController.text, () {
                ConfirmView.userCredential = state.userCredential;
              }, () {
                _showdialogIncorrect(context);
                return;
              });
              // ignore: use_build_context_synchronously
              await context.router.push(RegisterInfoViewRoute(
                  cubit: context.read<RegistrationCubit>()));
            }
          },
          pass: state.confirmCodePass,
        );
      }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

Future<void> _showdialogIncorrect(BuildContext context) async {
  await showDialog(
    context: context,
    builder: (BuildContext context) {
      return PopupNotice(
          textButton: StringConstants.wrongOtp, title: StringConstants.ok);
    },
  );
}

Future<void> _showdialogTimeout(BuildContext context) async {
  await showDialog(
    context: context,
    builder: (BuildContext context) {
      return PopupNotice(
          textButton: StringConstants.dieOtp, title: StringConstants.ok);
    },
  );
}
