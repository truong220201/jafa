import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/values/app_colors.dart';
import '../../../../core/values/string_constants.dart';
import '../../../../core/widgets/button/back_button.dart';
import '../../../../core/widgets/button/floating_text_button.dart';
import '../../../../core/widgets/custom_text_field/custom_text_field.dart';
import '../../../../core/widgets/popup/popup_primary.dart';
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
  final TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          RegistrationCubit(context.read<RegistrationRepository>()),
      child: _buildPage(context),
    );
  }

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  Widget _buildPage(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorFFFFFFFF,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(28),
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
                      controller: _phoneController,
                      onChanged: (value) {
                        cubit.setPhone(value);
                      },
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(10),
                      ],
                      suffixIcon: (phone.isNotEmpty)
                          ? IconButton(
                              icon: const Icon(
                                Icons.cancel_outlined,
                                color: AppColors.colorFF940000,
                              ),
                              onPressed: () {
                                _phoneController.clear();
                              },
                            )
                          : null,
                      customTitle: CustomTitle(
                        padding: null,
                        title: StringConstants.phone,
                      ),
                      hintText: StringConstants.phoneEx,
                    );
                  }),
              BlocSelector<RegistrationCubit, RegistrationState, bool>(
                  selector: (state) => state.phonePass,
                  builder: (context, pass) {
                    if (!pass) {
                      return ValidateTextField(
                        validate: StringConstants.phoneRule1,
                      );
                    } else {
                      return const SizedBox(height: 20);
                    }
                  })
            ],
          ),
        ),
      ),
      floatingActionButton: BlocBuilder<RegistrationCubit, RegistrationState>(
        builder: (BuildContext context, state) {
          final cubit = context.read<RegistrationCubit>();
          return FloatingTextButton(
            icon: Icons.arrow_forward_outlined,
            text: StringConstants.confirm,
            onPressed: () {
              if (state.phonePass && state.phone.isEmpty) {
                cubit.setPhonePass(false);
              }
              if (state.phonePass && state.phone.isNotEmpty) {
                _showdialog(context);
              }
            },
            pass: state.phonePass,
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Future<void> _showdialog(BuildContext context) async {
    final cubit = context.read<RegistrationCubit>();
    await showDialog(
      context: context,
      builder: (BuildContext _) {
        return PopupPrimary(
          onTap: () async {
            cubit.verify(_phoneController.text, 
                () async {
              Navigator.of(context).pop();
              await context.router.push(
                  ConfirmViewRoute(cubit: context.read<RegistrationCubit>()));
            });
          },
          title: _phoneController.text,
          content: StringConstants.smsSend,
          titleButton1: StringConstants.send,
        );
      },
    );
  }
}
