import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/values/app_colors.dart';
import '../../../core/values/province_info.dart';
import '../../../core/widgets/button/custom_buttom.dart';
import '../cubit/tree_create_cubit.dart';
import '../cubit/tree_create_state.dart';
import '../repository/tree_create_repository.dart';

class TreeCreateView extends StatefulWidget {
  const TreeCreateView({super.key});

  @override
  State<TreeCreateView> createState() => _TreeCreateViewState();
}

class _TreeCreateViewState extends State<TreeCreateView> {
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
        return TreeCreateCubit(context.read<TreeCreateRepository>());
        // ..initData(widget.registrationState);
      },
      child: _buildPage(context),
    );
  }

  Widget _buildPage(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 40,
        leading: Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.color_251_239_239_1,
          ),
          child: IconButton(
            color: AppColors.color_178_0_0_1,
            onPressed: () async {
              await context.router.pop();
            },
            icon: const Icon(Icons.arrow_back_outlined),
          ),
        ),
        title: const Text(
          "Danh sách gia tộc",
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
        ),
        actions: [
          BlocSelector<TreeCreateCubit, TreeCreateState, bool>(
            builder: (context, pass) {
              return Container(
                  width: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: (pass)
                        ? AppColors.color_251_239_239_1
                        : AppColors.color_245_245_245_1,
                  ),
                  child: IconButton(
                    color: (pass)
                        ? AppColors.color_178_0_0_1
                        : AppColors.color_194_194_194_1,
                    onPressed: () {},
                    icon: Icon(
                        (pass) ? Icons.done : Icons.arrow_forward_outlined),
                  ));
            },
            selector: (state) => state.pass,
          ),
        ],
        backgroundColor: AppColors.color_148_0_0_1,
      ),
      backgroundColor: AppColors.color_251_239_239_1,
      body: BlocBuilder<TreeCreateCubit, TreeCreateState>(
          builder: (context, state) {
        final cubit = context.read<TreeCreateCubit>();
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
                        color: AppColors.color_255_255_255_1,
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
                                  text: const TextSpan(
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: 'Tên gia phả',
                                        style: TextStyle(
                                            color: AppColors.color_0_0_0_1,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w700),
                                      ),
                                      TextSpan(
                                          text: '*',
                                          style: TextStyle(
                                              color: AppColors.color_255_0_0_1,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w700)),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 20, right: 36),
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
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    hintText: 'Nhập tên dòng họ',
                                    focusedBorder: const UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: AppColors.color_173_173_173_1),
                                    ),
                                    suffixIcon: (state.name != '')
                                        ? IconButton(
                                            icon: const Icon(
                                              Icons.cancel_outlined,
                                              color: AppColors.color_148_0_0_1,
                                            ),
                                            onPressed: () {
                                              _nameController.clear();
                                            },
                                          )
                                        : null,
                                  ),
                                  cursorColor: AppColors.color_0_0_0_1,
                                ),
                              ),
                              const SizedBox(
                                height: 14,
                              ),
                              Container(
                                padding: const EdgeInsets.only(left: 20),
                                child: const Text('Giả sử dòng họ',
                                    style: TextStyle(
                                        color: AppColors.color_0_0_0_1,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700)),
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
                                        style: const TextStyle(
                                          fontSize: 15,
                                        ),
                                        inputFormatters: [
                                          LengthLimitingTextInputFormatter(
                                              2000),
                                        ],
                                        keyboardType: TextInputType.multiline,
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText:
                                              'Nhập đôi nét về dòng họ của bạn',
                                          counterText:
                                              '${_historyController.text.length}/2000',
                                          contentPadding: const EdgeInsets.only(
                                              bottom: 60, top: 12),
                                        ),
                                        cursorColor: AppColors.color_0_0_0_1,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 0,
                                    left: 20,
                                    right: 36,
                                    child: Container(
                                      color: AppColors.color_173_173_173_1,
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
                                child: const Text('Địa chỉ',
                                    style: TextStyle(
                                        color: AppColors.color_0_0_0_1,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700)),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 20, right: 36),
                                child: TextField(
                                  controller: _provinceController,
                                  readOnly: true,
                                  style: const TextStyle(
                                    fontSize: 15,
                                  ),
                                  decoration: InputDecoration(
                                      hintText: 'Chọn Tỉnh/Thành',
                                      focusedBorder: const UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color.fromRGBO(
                                                173, 173, 173, 1)),
                                      ),
                                      suffixIcon: IconButton(
                                        icon: const Icon(Icons.arrow_drop_down),
                                        onPressed: () {
                                          _showProvinceDialog(context, cubit);
                                        },
                                      )),
                                  cursorColor: AppColors.color_0_0_0_1,
                                ),
                              ),
                              const SizedBox(
                                height: 14,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 20, right: 36),
                                child: TextFormField(
                                  validator: (value) {
                                    if (districtList.isEmpty ||
                                        state.province == "") {
                                      return "Vui lòng chọn tỉnh";
                                    }
                                  },
                                  controller: _districtController,
                                  readOnly: true,
                                  style: const TextStyle(
                                    fontSize: 15,
                                  ),
                                  decoration: InputDecoration(
                                      hintText: 'Chọn Quận/Huyện',
                                      focusedBorder: const UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color.fromRGBO(
                                                173, 173, 173, 1)),
                                      ),
                                      suffixIcon: IconButton(
                                        icon: const Icon(Icons.arrow_drop_down),
                                        onPressed: () {
                                          if (districtList.isNotEmpty &&
                                              state.province != "") {
                                            _showDistrictDialog(context, cubit);
                                          }
                                        },
                                      )),
                                  cursorColor: AppColors.color_0_0_0_1,
                                ),
                              ),
                              const SizedBox(
                                height: 14,
                              ),
                              Container(
                                padding: const EdgeInsets.only(left: 20),
                                child: const Text(
                                    'Quan hệ của bạn với gia tộc này',
                                    style: TextStyle(
                                        color: AppColors.color_0_0_0_1,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700)),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(left: 20, right: 36),
                                child: TextField(
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                  decoration: InputDecoration(
                                    hintText: 'Nhà nội, Nhà ngoại, Nhà vợ',
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color:
                                              Color.fromRGBO(173, 173, 173, 1)),
                                    ),
                                  ),
                                  cursorColor: AppColors.color_0_0_0_1,
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
                    primary: AppColors.color_248_170_151_1,
                    padding: const EdgeInsets.all(38),
                  ),
                  child: const Icon(
                    Icons.camera_alt,
                    color: AppColors.color_255_255_255_1,
                    size: 36,
                  ),
                )),
          ],
        );
      }),
    );
  }

  void _showProvinceDialog(BuildContext context, TreeCreateCubit cubit) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Chọn tỉnh/thành'),
          content: SizedBox(
            width: 200,
            height: 300,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: provinceList.length,
              itemBuilder: (BuildContext context, int index) {
                final province = provinceList[index];
                return ListTile(
                  title: Text(province),
                  onTap: () {
                    cubit.setProvince(province);
                    setState(() {
                      _provinceController.text = province;
                      districtList = Province.address[province]!;
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

  void _showDistrictDialog(BuildContext context, TreeCreateCubit cubit) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Chọn quận/huyện'),
          content: SizedBox(
            width: 200,
            height: 300,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: districtList.length,
              itemBuilder: (BuildContext context, int index) {
                final district = districtList[index];
                return ListTile(
                  title: Text(district),
                  onTap: () {
                    cubit.setDistrict(district);
                    setState(() {
                      _districtController.text = district;
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
