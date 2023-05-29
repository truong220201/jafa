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
  static const bold14_titleBold = _medium14_07;
  static const _medium16_lineHeight24 = TextStyle(
    fontWeight: FontW.mediumM,
    fontSize: 16,
    letterSpacing: 0.7,
    color: AppColors.c1D1D1D_onSurface,
    fontFamily: defaultFontFamily,
  );
  static const medium16_lineHeight24_sur = _medium16_lineHeight24;
  static const _medium14_lineHeight21 = TextStyle(
    fontWeight: FontW.medium,
    fontSize: 14,
    letterSpacing: 0.7,
    color: AppColors.c1D1D1D_onSurface,
    fontFamily: defaultFontFamily,
  );
  static const medium14_lineHeight21_sur = _medium14_lineHeight21;
  static const _small12_lineHeight18 = TextStyle(
    fontWeight: FontW.regular,
    fontSize: 12,
    letterSpacing: 0.7,
    color: AppColors.color_255_128_128_137,
    fontFamily: defaultFontFamily,
  );
  static const small12_lineHeight18_sur = _small12_lineHeight18;
  static const _small12_lineHeight18_black = TextStyle(
    fontWeight: FontW.regular,
    fontSize: 12,
    letterSpacing: 0.7,
    color: Color.fromARGB(255, 0, 0, 0),
    fontFamily: defaultFontFamily,
  );
  static const small12_lineHeight18_black_sur = _small12_lineHeight18;
}
