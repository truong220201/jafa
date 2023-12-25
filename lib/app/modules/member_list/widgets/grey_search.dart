import 'dart:math' as math;

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:genealogy_management/app/core/values/app_values.dart';
import 'package:genealogy_management/app/core/values/text_styles.dart';
import 'package:genealogy_management/app/data/model/tree_view_model.dart';

import '../../../data/model/member_model.dart';
import '../../../main_router.dart';
import '../../member_info/views/member_info_view.dart';
import '../../../core/values/app_colors.dart';

class GreySearch extends StatefulWidget {
  const GreySearch(
      {super.key,
      this.hintText,
      this.isBorder = true,
      this.backNavigation,
      required this.kOptions,
      required this.idJafa});
  final String? hintText;
  final bool? isBorder;
  final bool? backNavigation;
  final List<MemberModel>? kOptions;
  final int idJafa;

  @override
  State<GreySearch> createState() => _GreySearchState();
}

class _GreySearchState extends State<GreySearch> {
  final ValueNotifier<double?> optionsViewWidthNotifier = ValueNotifier(null);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: SizedBox(
        height: 44.0,
        child: Autocomplete<MemberModel>(
          // initialValue: TextEditingValue(
          //   text: '',
          //   selection: const TextSelection.collapsed(offset: -1),
          // ),
          optionsBuilder: (TextEditingValue textEditingValue) {
            if (textEditingValue.text == '') {
              //return widget.kOptions!;
              return const Iterable<MemberModel>.empty();
            }
            return widget.kOptions!.where((MemberModel option) {
              debugPrint(option.name.toString());
              if (option.name == null) {
                return false;
              }
              return option.name!
                  .toLowerCase()
                  .contains(textEditingValue.text.toLowerCase());
            });
          },
          fieldViewBuilder: (BuildContext context,
              TextEditingController textEditingController,
              FocusNode focusNode,
              VoidCallback onFieldSubmitted) {
            return TextFormField(
              // textAlign: TextAlign.,
              focusNode: focusNode,
              // autofocus: true,
              // initialValue: '',
              textAlignVertical: TextAlignVertical.center,
              cursorColor: AppColors.c000000_black,
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color.fromARGB(255, 241, 241, 241),
                hintText: widget.hintText ?? 'Tìm kiếm',
                hintStyle: TextStyles.bold14TitleBold.copyWith(
                  fontWeight: FontWeight.w400,
                  color: AppColors.colorFFADADAD,
                ),
                border: OutlineInputBorder(
                  borderSide: widget.isBorder ?? true
                      ? const BorderSide(
                          style: BorderStyle.none,
                          color: Color.fromARGB(255, 0, 0, 0))
                      : const BorderSide(width: 0),
                  borderRadius: BorderRadius.circular(16),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(AppValues.height_16),
                  borderSide: widget.isBorder == false ||
                          widget.isBorder == null
                      ? BorderSide.none
                      : const BorderSide(color: Color.fromARGB(255, 0, 0, 0)),
                ),
                contentPadding: const EdgeInsets.all(8),
                prefixIcon: Container(
                  padding: const EdgeInsets.all(5),
                  child: SvgPicture.asset(
                    "assets/images/search.svg",
                    //color: const Color.fromARGB(255, 3, 3, 3),
                  ),
                ),
                prefixIconConstraints: const BoxConstraints(maxWidth: 40),
                prefixIconColor: AppColors.c000000_black,
                suffixIconConstraints: const BoxConstraints(maxWidth: 40),
                suffixIconColor: AppColors.c000000_black,
              ),
              controller: textEditingController,
              // focusNode: focusNode,
            );
          },
          optionsViewBuilder: (
            context,
            onSelected,
            options,
          ) {
            return ValueListenableBuilder<double?>(
                valueListenable: optionsViewWidthNotifier,
                builder: (context, width, child) {
                  return Stack(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromARGB(68, 173, 173, 173),
                              offset: Offset(0.0, -1.0),
                              blurRadius: 4.0,
                            ),
                          ],
                        ),
                        margin: const EdgeInsets.only(top: 10),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Material(
                            type: MaterialType.transparency,
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0))),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  right: 10, left: 10, top: 10),
                              child: Container(
                                width: 330,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Column(
                                  children: options.map((opt) {
                                    return InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    MemberInfoView(
                                                      roleId: opt.roleId!,
                                                      idJafa: widget.idJafa,
                                                      idMember:
                                                          opt.userGenealogyId!,
                                                    )));
                                        //onSelected(opt);
                                      },
                                      child: Container(
                                        alignment: Alignment.centerLeft,
                                        padding: const EdgeInsets.all(16.0),
                                        color: Colors.white,
                                        child: Row(
                                          children: [
                                            SizedBox(
                                              width: 50,
                                              height: 50,
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    image: DecorationImage(
                                                        fit: BoxFit.cover,
                                                        image: opt.avatar !=
                                                                null
                                                            ? NetworkImage(
                                                                opt.avatar!)
                                                            : const AssetImage(
                                                                    "assets/images/user.png")
                                                                as ImageProvider<
                                                                    Object>)),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  opt.name!,
                                                  style:
                                                      TextStyles.boldBlackS16,
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                  _roleName(opt.roleId!),
                                                  style: TextStyles.greyS14,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                });
          },
        ),
      ),
    );
  }

  String _roleName(int idRole) {
    String roleName = '';
    if (idRole == 1) {
      roleName = 'Quản trị viên';
    } else if (idRole == 2) {
      roleName = 'Người biên soạn';
    } else if (idRole == 3) {
      roleName = 'Được chỉnh sửa';
    } else if (idRole == 4) {
      roleName = 'Chỉ xem';
    }
    return roleName;
  }
}
