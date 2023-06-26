import 'dart:math' as math;

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:genealogy_management/app/core/values/app_values.dart';
import 'package:genealogy_management/app/core/values/text_styles.dart';
import 'package:genealogy_management/app/data/model/tree_view_model.dart';

import '../../../main_router.dart';
import '../../values/app_colors.dart';

class SearchTreeView extends StatefulWidget {
  const SearchTreeView({
    super.key,
    this.hintText,
    this.isBorder = true,
    this.backNavigation,
    this.kOptions,
  });
  final String? hintText;
  final bool? isBorder;
  final bool? backNavigation;
  final List<TreeViewModel>? kOptions;

  @override
  State<SearchTreeView> createState() => _SearchTreeViewState();
}

class _SearchTreeViewState extends State<SearchTreeView> {
  final ValueNotifier<double?> optionsViewWidthNotifier = ValueNotifier(null);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44.0,
      child: Autocomplete<TreeViewModel>(
        // initialValue: TextEditingValue(
        //   text: '',
        //   selection: const TextSelection.collapsed(offset: -1),
        // ),
        optionsBuilder: (TextEditingValue textEditingValue) {
          if (textEditingValue.text == '') {
            return widget.kOptions!;
            // return const Iterable<TreeViewModel>.empty();
          }
          return widget.kOptions!.where((TreeViewModel option) {
            debugPrint(option.toString());
            // ignore: unnecessary_null_comparison
            if (option.name == null || option.birthday == null) {
              return false;
            }
            return option.name!
                    .toLowerCase()
                    .contains(textEditingValue.text.toLowerCase()) ||
                option.birthday!
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
            autofocus: true,
            //initialValue: '',
            textAlignVertical: TextAlignVertical.center,
            cursorColor: AppColors.c000000_black,
            decoration: InputDecoration(
              filled: true,
              fillColor: const Color.fromARGB(255, 255, 255, 255),
              hintText: widget.hintText ?? 'Tìm kiếm',
              // hintStyle: context.textStyle.titleMedium?.copyWith(
              //   fontSize: Dimens.body,
              //   fontWeight: FontWeight.w400,
              //   color: AppColors.grayColor,
              // ),

              border: OutlineInputBorder(
                borderSide: widget.isBorder ?? true
                    ? const BorderSide(
                        style: BorderStyle.none,
                        color: Color.fromARGB(255, 0, 0, 0))
                    : const BorderSide(width: 0),
                borderRadius:
                    BorderRadius.circular(AppValues.activeIndicatorSize),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius:
                    BorderRadius.circular(AppValues.activeIndicatorSize),
                borderSide: widget.isBorder == false || widget.isBorder == null
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
                                      onSelected(opt);
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
                                                      image: opt.avatar != null
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
                                                style: TextStyles.boldBlackS16,
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                opt.birthday ?? '',
                                                style: TextStyles
                                                    .medium14LineHeight21Sur,
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
    );
  }
}
