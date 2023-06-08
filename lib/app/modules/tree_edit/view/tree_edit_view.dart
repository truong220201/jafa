import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:genealogy_management/app/modules/detail_jafa/cubit/tree_detail_state.dart';
import '../../../core/values/app_colors.dart';
import '../../../core/values/province_info.dart';
import '../../../core/values/string_constants.dart';
import '../../../core/values/text_styles.dart';
import '../../../core/widgets/button/custom_buttom.dart';
import '../../../core/widgets/popup/popup_select_image.dart';
import '../cubit/tree_edit_cubit.dart';
import '../cubit/tree_edit_state.dart';
import '../repository/tree_edit_repository.dart';

class TreeEditView extends StatefulWidget {
  const TreeEditView({super.key});

  @override
  State<TreeEditView> createState() => _TreeEditViewState();
}

class _TreeEditViewState extends State<TreeEditView> {
  List<String> provinceList = Province.address.keys.toList();
  List<String> districtList = [];
  DateTime? selectedDate;
  final TextEditingController _provinceController = TextEditingController();
  final TextEditingController _districtController = TextEditingController();
  final TextEditingController _historyController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _relasionshipController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return TreeEditCubit(context.read<TreeEditRepository>());
        // ..initData(widget.registrationState);
      },
      child: _buildPage(context),
    );
  }

  @override
  Widget _buildPage(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 40,
        leading: Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.colorFFFBEFEF,
          ),
          child: IconButton(
            color: AppColors.colorFFB20000,
            onPressed: () async {
              await context.router.pop();
            },
            icon: const Icon(Icons.arrow_back_outlined),
          ),
        ),
        title: Text(
          StringConstants.editJafa,
          style: TextStyles.mediumBlackS20,
        ),
        actions: [
          BlocSelector<TreeEditCubit, TreeEditState, bool>(
            builder: (context, pass) {
              return Container(
                  width: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: (pass)
                        ? AppColors.colorFFFBEFEF
                        : AppColors.colorFFF5F5F5,
                  ),
                  child: IconButton(
                    color: (pass)
                        ? AppColors.colorFFB20000
                        : AppColors.colorFFC2C2C2,
                    onPressed: () {},
                    icon: Icon(
                        (pass) ? Icons.done : Icons.arrow_forward_outlined),
                  ));
            },
            selector: (state) => state.pass,
          ),
        ],
        backgroundColor: AppColors.colorFF940000,
      ),
      backgroundColor: AppColors.colorFFFBEFEF,
      body:
          BlocBuilder<TreeEditCubit, TreeEditState>(builder: (context, state) {
        final cubit = context.read<TreeEditCubit>();
        return Stack(
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
                      child: SingleChildScrollView(
                        child: Form(
                          key: _formKey,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 69,
                              ),
                              Container(
                                padding: const EdgeInsets.only(left: 20),
                                child: RichText(
                                  text: TextSpan(
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: StringConstants.nameTree,
                                        style: TextStyles.boldBlackS18,
                                      ),
                                      TextSpan(
                                          text: StringConstants.obligatory1,
                                          style: TextStyles.boldRed1S18),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 20, right: 36),
                                child: TextFormField(
                                  controller: _nameController,
                                  style: TextStyles.size15,
                                  onChanged: (value) {
                                    cubit.setName(value);
                                  },
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return StringConstants.obligatory;
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    hintText: StringConstants.roleHint,
                                    focusedBorder: const UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: AppColors.colorFFADADAD),
                                    ),
                                    suffixIcon: (state.name != '')
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
                                  ),
                                  cursorColor: AppColors.colorFF000000,
                                ),
                              ),
                              const SizedBox(
                                height: 14,
                              ),
                              Container(
                                padding: const EdgeInsets.only(left: 20),
                                child: Text(StringConstants.history,
                                    style: TextStyles.boldBlackS18),
                              ),
                              Stack(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.only(
                                        left: 20, right: 36, bottom: 5),
                                    child: SingleChildScrollView(
                                      child: TextField(
                                        onChanged: (value) {
                                          cubit.setHistory(value);
                                        },
                                        maxLines: null,
                                        textAlignVertical:
                                            TextAlignVertical.top,
                                        controller: _historyController,
                                        style: TextStyles.size15,
                                        inputFormatters: [
                                          LengthLimitingTextInputFormatter(
                                              2000),
                                        ],
                                        keyboardType: TextInputType.multiline,
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: StringConstants.desHistory,
                                          counterText:
                                              '${_historyController.text.length}/2000',
                                          contentPadding: const EdgeInsets.only(
                                              bottom: 60, top: 12),
                                        ),
                                        cursorColor: AppColors.colorFF000000,
                                      ),
                                    ),
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
                              ),
                              const SizedBox(
                                height: 14,
                              ),
                              Container(
                                padding: const EdgeInsets.only(left: 20),
                                child: Text(StringConstants.address,
                                    style: TextStyles.boldBlackS18),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 20, right: 36),
                                child: TextField(
                                  controller: _provinceController,
                                  readOnly: true,
                                  style: TextStyles.size15,
                                  decoration: InputDecoration(
                                      hintText: StringConstants.selectProvince,
                                      focusedBorder: const UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: AppColors.colorFFADADAD),
                                      ),
                                      suffixIcon: IconButton(
                                        icon: const Icon(Icons.arrow_drop_down),
                                        onPressed: () {},
                                      )),
                                  cursorColor: AppColors.colorFF000000,
                                ),
                              ),
                              const SizedBox(
                                height: 14,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 20, right: 36),
                                child: TextFormField(
                                  validator: (value) {},
                                  controller: _districtController,
                                  readOnly: true,
                                  style: TextStyles.size15,
                                  decoration: InputDecoration(
                                      hintText: StringConstants.selectDistrict,
                                      focusedBorder: const UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: AppColors.colorFFADADAD),
                                      ),
                                      suffixIcon: IconButton(
                                        icon: const Icon(Icons.arrow_drop_down),
                                        onPressed: () {},
                                      )),
                                  cursorColor: AppColors.colorFF000000,
                                ),
                              ),
                              const SizedBox(
                                height: 14,
                              ),
                              Container(
                                padding: const EdgeInsets.only(left: 20),
                                child: Text(StringConstants.relaTree,
                                    style: TextStyles.boldBlackS18),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 20, right: 36),
                                child: TextField(
                                  style: TextStyles.size15,
                                  decoration: InputDecoration(
                                    hintText: StringConstants.hintRela,
                                    focusedBorder: const UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: AppColors.colorFFADADAD),
                                    ),
                                  ),
                                  cursorColor: AppColors.colorFF000000,
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
                top: 48,
                left: 100,
                right: 100,
                child: ElevatedButton(
                  onPressed: () {
                    selectImage(context, cubit);
                  },
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    primary: AppColors.colorFFF8AA97,
                    padding: const EdgeInsets.all(38),
                  ),
                  child: const Icon(
                    Icons.camera_alt,
                    color: AppColors.colorFFFFFFFF,
                    size: 36,
                  ),
                )),
          ],
        );
      }),
    );
  }

  Future<void> selectImage(BuildContext context, TreeEditCubit cubit) async {
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
}
