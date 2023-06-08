import 'package:flutter/material.dart';

import '/app/core/values/app_colors.dart';

const defaultFontFamily = 'Baloo Thambi 2';
const defaultFontFamilyFallback = [
  'NotoSansJP',
  //'ZenMaruGothic',
];

abstract class FontW {
  static const regular = FontWeight.w400;
  static const medium = FontWeight.w500;
  static const mediumM = FontWeight.w600;
  static const bold = FontWeight.w700;
}

abstract class TextStyles {
  static const _medium14_07 = TextStyle(
    fontWeight: FontW.medium,
    fontSize: 14,
    letterSpacing: 0.7,
    color: AppColors.c1D1D1D_onSurface,
    fontFamily: defaultFontFamily,
    fontFamilyFallback: defaultFontFamilyFallback,
  );

  static const bold14TitleBold = _medium14_07;

  static const _medium16LineHeight24 = TextStyle(
    fontWeight: FontW.mediumM,
    fontSize: 14,
    letterSpacing: 0.7,
    color: AppColors.c1D1D1D_onSurface,
    fontFamily: defaultFontFamily,
  );

  static const medium16LineHeight24Sur = _medium16LineHeight24;

  static const _medium14LineHeight21 = TextStyle(
    fontWeight: FontW.medium,
    fontSize: 14,
    letterSpacing: 0.7,
    color: AppColors.c1D1D1D_onSurface,
    fontFamily: defaultFontFamily,
  );
  static const medium14LineHeight21Sur = _medium14LineHeight21;
  static const _small12LineHeight18 = TextStyle(
    fontWeight: FontW.regular,
    fontSize: 12,
    letterSpacing: 0.7,
    color: AppColors.colorFF808089,
    fontFamily: defaultFontFamily,
  );

  static const small12LineHeight18Sur = _small12LineHeight18;

  static const small12LineHeight18BlackSur = _small12LineHeight18;

  static const regularWhiteS20 = TextStyle(
    fontSize: 20,
    color: AppColors.colorFFFFFFFF,
  );

  static const boldBlackS18 = TextStyle(
    color: AppColors.colorFF000000,
    fontSize: 18,
    fontWeight: FontW.bold,
  );
  static const boldBlackS16 = TextStyle(
    color: AppColors.colorFF313131,
    fontSize: 16,
    fontWeight: FontW.bold,
  );
  static const greyS14 = TextStyle(
    color: AppColors.colorFF636363,
    fontSize: 14,
  );
  static const boldRedS18 = TextStyle(
    color: AppColors.colorFFFF0000,
    fontSize: 18,
    fontWeight: FontW.bold,
  );

  static const size15 = TextStyle(
    fontSize: 15,
  );

  static const size14 = TextStyle(
    fontSize: 14,
  );

  static const size20 = TextStyle(
    fontSize: 20,
  );

  static const mediumMBlackS18 = TextStyle(
    fontWeight: FontW.mediumM,
    fontSize: 18,
  );

  static const mediumMBlueS16 = TextStyle(
    fontWeight: FontW.mediumM,
    fontSize: 16,
    color: AppColors.colorFF344054,
  );

  static const boldRedS20 = TextStyle(
    color: AppColors.colorFF940000,
    fontSize: 20,
    fontWeight: FontW.bold,
  );

  static const boldRed1S18 = TextStyle(
    color: AppColors.colorFF9A0F0F,
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );

  static const regularBlueS18 = TextStyle(
    color: AppColors.colorFF2F394B,
    fontSize: 18,
  );

  static const mediumBlackS20 = TextStyle(
    fontWeight: FontW.medium,
    fontSize: 20,
  );

  static const mediumWhiteS14 = TextStyle(
    fontSize: 14,
    fontWeight: FontW.medium,
    color: AppColors.colorFFFFFFFF,
  );

  static const regularRedS13 = TextStyle(
    fontSize: 13,
    fontWeight: FontW.regular,
    color: AppColors.colorFFFF0000,
  );

  static const mediumWhiteS36 = TextStyle(
    fontWeight: FontW.medium,
    fontSize: 36,
    color: AppColors.colorFFFFFFFF,
  );

  static const regularBlackS14 = TextStyle(
    fontWeight: FontW.regular,
    fontSize: 14,
    color: AppColors.colorFF424242,
  );
}
