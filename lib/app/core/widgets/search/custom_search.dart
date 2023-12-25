import 'dart:math' as math;

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:genealogy_management/app/core/values/app_values.dart';

import '../../../main_router.dart';
import '../../values/app_colors.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({
    super.key,
    this.hintText,
    this.isBorder = true,
    this.backNavigation,
  });
  final String? hintText;
  final bool? isBorder;
  final bool? backNavigation;

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  final ValueNotifier<double?> optionsViewWidthNotifier = ValueNotifier(null);
  static const List<String> _kOptions = <String>[
    'aardvark',
    'bobcat',
    'chameleon',
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44.0,
      child: Autocomplete<String>(
        optionsBuilder: (TextEditingValue textEditingValue) {
          if (textEditingValue.text == '') {
            return const Iterable<String>.empty();
          }
          return _kOptions.where((String option) {
            return option.contains(textEditingValue.text.toLowerCase());
          });
        },
        fieldViewBuilder: (BuildContext context,
            TextEditingController textEditingController,
            FocusNode focusNode,
            VoidCallback onFieldSubmitted) {
          return TextFormField(
            // textAlign: TextAlign.,
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
              suffixIcon: InkWell(
                onTap: () async {
                  await context.router.push(const ScanQRViewRoute());
                },
                child: Container(
                  padding: const EdgeInsets.all(2),
                  child: SvgPicture.asset(
                    "assets/images/scanqr.svg",
                    //color: const Color.fromARGB(255, 3, 3, 3),
                  ),
                ),
              ),
              suffixIconConstraints: const BoxConstraints(maxWidth: 40),

              suffixIconColor: AppColors.c000000_black,
            ),
            controller: textEditingController,
            focusNode: focusNode,
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
                    Transform.rotate(
                      angle: -math.pi / 4,
                      child: Container(
                        margin: const EdgeInsets.fromLTRB(30, 16, 0, 0),
                        width: 20,
                        height: 20,
                        decoration: const BoxDecoration(color: Colors.white),
                      ),
                    ),
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
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0))),
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
                                    child: Text(
                                      opt,
                                    ),
                                  ),
                                );
                              }).toList(),
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
