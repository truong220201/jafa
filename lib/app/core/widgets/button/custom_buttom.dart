// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../values/app_colors.dart';
import '../../values/text_styles.dart';

enum ButtonSize {
  /// height == 50
  large,

  /// height == 36
  small,

  /// height == 30
  extraSmall;

  double get height {
    switch (this) {
      case large:
        return 50;
      case small:
        return 36;
      case extraSmall:
        return 30;
    }
  }

  TextStyle get primaryTextStyle {
    switch (this) {
      case large:
        return TextStyles.bold14TitleBold;
      case small:
        return TextStyles.bold14TitleBold;
      case extraSmall:
        return TextStyles.bold14TitleBold;
    }
  }

  TextStyle get secondaryTextStyle {
    switch (this) {
      case large:
        throw UnimplementedError('No TextStyle for large SecondaryButton');
      case small:
      case extraSmall:
        return TextStyles.bold14TitleBold;
    }
  }

  TextStyle get tertiaryTextStyle {
    switch (this) {
      case large:
        throw UnimplementedError('No TextStyle for large TertiaryButton');
      case small:
      case extraSmall:
        return TextStyles.bold14TitleBold;
    }
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    this.enable = true,
    required this.title,
    required this.onTap,
    this.width,
    this.showLoading = false,
    this.buttonSize = ButtonSize.large,
    required this.backgroundColor,
    required this.textColor,
    required this.textSize,
    this.textWeight = FontWeight.w400,
    this.borderColor = AppColors.colorFF000000,
    required this.icon,
    //this.fontSize = 14,
  }) : super(key: key);

  final bool enable;
  final String title;
  final VoidCallback onTap;
  final double? width;
  final bool showLoading;
  final ButtonSize buttonSize;
  final Color backgroundColor;
  final Color textColor;
  final Color borderColor;
  final double textSize;
  final FontWeight textWeight;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    final double height = buttonSize.height;
    return Container(
      height: height,
      width: width ?? double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: backgroundColor,
        border: Border.all(
          color: borderColor,
        ),
      ),
      child: InkWell(
        onTap: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            const SizedBox(
              width: 8,
            ),
            Center(
              child: Text(
                title,
                style: TextStyle(
                    color: textColor,
                    fontSize: textSize,
                    fontWeight: textWeight),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomButtonDetailPage extends StatelessWidget {
  const CustomButtonDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {},
      child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          decoration: const BoxDecoration(
              color: Color.fromARGB(255, 178, 0, 0),
              borderRadius: BorderRadius.all(Radius.circular(33.5))),
          child: const Text(
            'Xem Cây',
            style: TextStyle(
                color: Color.fromARGB(255, 255, 255, 255),
                fontSize: 14,
                fontWeight: FontWeight.w500),
          )),
    );
  }
}

class CustomCloseButton extends StatelessWidget {
  const CustomCloseButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {},
      child: Container(
          height: 44,
          width: double.infinity,
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 1),
              borderRadius: const BorderRadius.all(Radius.circular(8.0))),
          child: const Text(
            'Đóng',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          )),
    );
  }
}

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    super.key,
    required this.icon,
    required this.name,
  });
  final Icon icon;
  final String name;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: InkWell(
          onTap: () => {},
          child: Column(children: [
            icon,
            Text(
              name,
              style: TextStyles.small12LineHeight18BlackSur,
            )
          ])),
    );
  }
}
