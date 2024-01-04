import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/values/app_colors.dart';
import '../../../core/values/string_constants.dart';
import '../../../core/widgets/appBar/custom_appbar.dart';
import '../../../core/widgets/button/select_image_button.dart';
import '../../../core/widgets/custom_text_field/custom_text_field.dart';
import '../../../core/widgets/popup/popup_select_image.dart';
import '../../../data/model/province.dart';
import '../cubit/tree_create_cubit.dart';
import '../cubit/tree_create_state.dart';
import '../repository/tree_create_repository.dart';

class TreeCreateView extends StatefulWidget {
  const TreeCreateView({super.key});

  @override
  State<TreeCreateView> createState() => _TreeCreateViewState();
}

class _TreeCreateViewState extends State<TreeCreateView> {
  List<District> districtList = [];
  DateTime? selectedDate;
  final TextEditingController _provinceController = TextEditingController();
  final TextEditingController _districtController = TextEditingController();
  final TextEditingController _historyController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _relasionshipController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return TreeCreateCubit(context.read<TreeCreateRepository>())
          ..getProvinces();
      },
      child: _buildPage(context),
    );
  }

  @override
  void dispose() {
    _provinceController.dispose();
    _nameController.dispose();
    _districtController.dispose();
    _historyController.dispose();
    _relasionshipController.dispose();
    super.dispose();
  }

  Widget _buildPage(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        leading: CustomAppbarItem(
          icon: Icons.arrow_back_outlined,
          onPressed: () async => await context.router.pop(),
        ),
        title: StringConstants.creatTree,
        actions: [
          BlocSelector<TreeCreateCubit, TreeCreateState, bool>(
            builder: (context, pass) {
              final cubit = context.read<TreeCreateCubit>();
              return CustomAppbarItem(
                icon: (pass) ? Icons.done : Icons.arrow_forward_outlined,
                background:
                    (pass) ? AppColors.colorFFFBEFEF : AppColors.colorFFF5F5F5,
                iconColor:
                    (pass) ? AppColors.colorFFB20000 : AppColors.colorFFC2C2C2,
                onPressed: () {
                  cubit.treeCreate();
                },
              );
            },
            selector: (state) => state.pass,
          ),
        ],
      ),
      backgroundColor: AppColors.colorFFFBEFEF,
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 102,
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
          BlocSelector<TreeCreateCubit, TreeCreateState, String?>(
              selector: (state) => state.avatar,
              builder: (context, avatar) {
                final cubit = context.read<TreeCreateCubit>();
                return Positioned(
                    top: 48,
                    left: 100,
                    right: 100,
                    child: SelectImageButton(
                      onTap: () {
                        selectImage(context, cubit);
                      },
                      avatar: avatar,
                      iconColor: AppColors.colorFFFFFFFF,
                      backgroundColor: AppColors.colorFFF8AA97,
                    ));
              }),
        ],
      ),
    );
  }

  Widget _bodyPage(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 69,
          ),
          BlocSelector<TreeCreateCubit, TreeCreateState, String>(
              selector: (state) => state.name,
              builder: (context, name) {
                final cubit = context.read<TreeCreateCubit>();
                return CustomTextField(
                  customTitle: CustomTitle(
                    title: StringConstants.nameTree,
                    subTitle: StringConstants.obligatory1,
                  ),
                  padding: const EdgeInsets.only(left: 20, right: 36),
                  hintText: StringConstants.roleHint,
                  onChanged: (value) {
                    cubit.setName(value);
                  },
                  controller: _nameController,
                  suffixIcon: (name != '')
                      ? IconButton(
                          icon: const Icon(
                            Icons.cancel_outlined,
                            color: AppColors.colorFF940000,
                          ),
                          onPressed: () {
                            _nameController.clear();
                          },
                        )
                      : null,
                );
              }),
          BlocSelector<TreeCreateCubit, TreeCreateState, bool>(
              selector: (state) => state.pass,
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
          BlocSelector<TreeCreateCubit, TreeCreateState, String?>(
              selector: (state) => state.history,
              builder: (context, history) {
                final cubit = context.read<TreeCreateCubit>();
                return Stack(
                  children: [
                    Container(
                      padding:
                          const EdgeInsets.only(left: 20, right: 36, bottom: 5),
                      child: SingleChildScrollView(
                          child: CustomTextField(
                        hintText: StringConstants.desHistory,
                        customTitle: CustomTitle(
                          title: StringConstants.history,
                          padding: null,
                        ),
                        onChanged: (value) {
                          cubit.setHistory(value);
                        },
                        maxLines: null,
                        controller: _historyController,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(2000),
                        ],
                        keyboardType: TextInputType.multiline,
                        counterText: '${_historyController.text.length}/2000',
                        contentPadding:
                            const EdgeInsets.only(bottom: 60, top: 12),
                        border: InputBorder.none,
                        inputBorder: null,
                      )),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 20,
                      right: 36,
                      child: Container(
                        color: AppColors.colorFFADADAD,
                        height: 1,
                      ),
                    )
                  ],
                );
              }),
          const SizedBox(
            height: 14,
          ),
          BlocBuilder<TreeCreateCubit, TreeCreateState>(
              builder: (context, state) {
            return CustomTextField(
                controller: _provinceController,
                readOnly: true,
                padding: const EdgeInsets.only(left: 20, right: 36),
                hintText: StringConstants.selectProvince,
                customTitle: CustomTitle(title: StringConstants.address),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.arrow_drop_down),
                  onPressed: () {
                    // cubit.getProvinces();
                    // _showProvinceDialog(context, cubit,state);
                  },
                ));
          }),
          const SizedBox(
            height: 14,
          ),
          BlocBuilder<TreeCreateCubit, TreeCreateState>(
              builder: (context, state) {
            return CustomTextField(
              hintText: StringConstants.selectDistrict,
              customTitle: null,
              suffixIcon: IconButton(
                icon: const Icon(Icons.arrow_drop_down),
                onPressed: () {
                  // if (districtList.isNotEmpty && state.province != null) {
                  //   _showDistrictDialog(context, cubit);
                  // }
                },
              ),
              padding: const EdgeInsets.only(left: 20, right: 36),
              readOnly: true,
              controller: _districtController,
            );
          }),
          // BlocSelector<TreeCreateCubit, TreeCreateState, bool>(
          //     selector: (state) => state.province != null,
          //     builder: (context, pass) {
          //       if (!pass) {
          //         return ValidateTextField(
          //           padding: const EdgeInsets.only(top: 7, left: 20),
          //           validate: StringConstants.obliProvince,
          //         );
          //       } else {
          //         return const SizedBox(height: 20);
          //       }
          //     }),
          const SizedBox(
            height: 14,
          ),
          BlocSelector<TreeCreateCubit, TreeCreateState, String?>(
              selector: (state) => state.relationship,
              builder: (context, relationship) {
                final cubit = context.read<TreeCreateCubit>();
                return CustomTextField(
                  onChanged: (value) {
                    cubit.setRelationship(value);
                  },
                  padding: const EdgeInsets.only(left: 20, right: 36),
                  controller: _relasionshipController,
                  hintText: StringConstants.hintRela,
                  customTitle: CustomTitle(title: StringConstants.relaTree),
                );
              }),
        ],
      ),
    );
  }

  // ignore: unused_element
  void _showDistrictDialog(BuildContext context, TreeCreateCubit cubit) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(StringConstants.selectDistrict),
          content: SizedBox(
            width: 200,
            height: 300,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: districtList.length,
              itemBuilder: (BuildContext context, int index) {
                final district = districtList[index];
                return ListTile(
                  title: Text(district.name!),
                  onTap: () {
                    cubit.setDistrict(district.id!);
                    setState(() {
                      _districtController.text = district.name!;
                    });
                    Navigator.pop(context);
                  },
                );
              },
            ),
          ),
        );
      },
    );
  }
}

Future<void> selectImage(BuildContext context, TreeCreateCubit cubit) async {
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
