import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../values/app_colors.dart';
import '../../values/text_styles.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      this.onChanged,
      this.controller,
      required this.hintText,
      this.inputBorder = const UnderlineInputBorder(
        borderSide: BorderSide(color: AppColors.colorFF940000),
      ),
      this.iconButton,
      this.cursorColor = AppColors.colorFF940000,
      this.suffixIcon,
      this.hintTextStyle = TextStyles.size15,
      required this.customTitle,
      this.floatingLabelBehavior,
      this.labelStyle = const TextStyle(
        color: AppColors.colorFF636363,
      ),
      this.keyboardType,
      this.inputFormatters,
      this.labelText,
      this.contentPadding,
      this.counterText,
      this.maxLines = 1,
      this.textAlignVertical,
      this.padding = const EdgeInsets.only(left: 0, right: 0),
      this.enabled = true});
  final CustomTitle customTitle;
  final Function(String)? onChanged;
  final TextEditingController? controller;
  final String hintText;
  final TextStyle hintTextStyle;
  final InputBorder inputBorder;
  final IconButton? iconButton;
  final Color cursorColor;
  final Widget? suffixIcon;
  final FloatingLabelBehavior? floatingLabelBehavior;
  final String? labelText;
  final TextStyle labelStyle;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final EdgeInsetsGeometry? contentPadding;
  final String? counterText;
  final int? maxLines;
  final TextAlignVertical? textAlignVertical;
  final EdgeInsetsGeometry padding;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        customTitle,
        Padding(
          padding: padding,
          child: TextField(
            enabled: enabled,
            style: hintTextStyle,
            onChanged: onChanged,
            controller: controller,
            keyboardType: keyboardType,
            inputFormatters: inputFormatters,
            maxLines: maxLines,
            textAlignVertical: textAlignVertical,
            decoration: InputDecoration(
              hintText: hintText,
              focusedBorder: inputBorder,
              suffixIcon: suffixIcon,
              floatingLabelBehavior: floatingLabelBehavior,
              labelStyle: labelStyle,
              labelText: labelText,
              contentPadding: contentPadding,
              counterText: counterText,
            ),
            cursorColor: cursorColor,
          ),
        ),
      ],
    );
  }
}

class CustomTitle extends StatelessWidget {
  const CustomTitle(
      {super.key,
      required this.title,
      this.titleStyle = TextStyles.boldBlackS18,
      this.subTitle,
      this.subTitleStyle = TextStyles.boldRedS18,
      this.padding = const EdgeInsets.only(left: 20)});
  final String title;
  final TextStyle titleStyle;
  final String? subTitle;
  final TextStyle subTitleStyle;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: padding,
        child: RichText(
          text: TextSpan(
            children: <TextSpan>[
              TextSpan(
                text: title,
                style: titleStyle,
              ),
              TextSpan(
                text: subTitle,
                style: subTitleStyle,
              ),
            ],
          ),
        ));
  }
}

class ValidateTextField extends StatelessWidget {
  const ValidateTextField(
      {super.key,
      required this.validate,
      this.style = TextStyles.regularRedS13,
      this.padding = const EdgeInsets.only(top: 7)});
  final String validate;
  final TextStyle style;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      child: Text(
        validate,
        style: style,
      ),
    );
  }
}
