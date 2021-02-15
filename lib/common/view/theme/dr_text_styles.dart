import 'dart:ui';

import 'package:flutter/painting.dart';

import 'dr_colors.dart';

class DrTextStyles {
  static const fontFeatures = [
    FontFeature.tabularFigures(),
    FontFeature.enable('cpsp'),
    FontFeature.enable('cv02'),
    FontFeature.enable('cv03'),
    FontFeature.enable('cv04'),
    FontFeature.enable('cv09'),
  ];

  static const TextStyle titleXXL = TextStyle(
      fontFamily: 'Inter',
      color: DrColors.textDefault,
      fontSize: 32,
      height: 40.0 / 32,
      fontWeight: FontWeight.w700,
      fontFeatures: fontFeatures);

  static const TextStyle bodyBold = TextStyle(
      fontFamily: 'Inter',
      color: DrColors.textRegular,
      fontSize: 16,
      height: 22.0 / 16,
      fontWeight: FontWeight.w700,
      fontFeatures: fontFeatures);

  static const TextStyle tag = TextStyle(
      fontFamily: 'Inter',
      color: DrColors.textDefault,
      fontSize: 13,
      height: 18.0 / 13,
      fontWeight: FontWeight.w600,
      fontFeatures: fontFeatures);

  static const TextStyle subtitle = TextStyle(
      fontFamily: 'Inter',
      color: DrColors.textDisabled,
      fontSize: 12,
      height: 18.0 / 12,
      fontWeight: FontWeight.w600,
      fontFeatures: fontFeatures);

  static const TextStyle sfProTextPrimary = TextStyle(
      fontFamily: 'Inter',
      color: DrColors.textPrimary,
      fontSize: 13,
      height: 18.0 / 13,
      fontWeight: FontWeight.w400,
      fontFeatures: fontFeatures);

  static const TextStyle sfProTextRegularOpacity04 = TextStyle(
      fontFamily: 'Inter',
      color: DrColors.textRegularOpacity04,
      fontSize: 13,
      height: 18.0 / 13,
      fontWeight: FontWeight.w400,
      fontFeatures: fontFeatures);

  static const TextStyle sfProTextError = TextStyle(
      fontFamily: 'Inter',
      color: DrColors.textError,
      fontSize: 13,
      height: 18.0 / 13,
      fontWeight: FontWeight.w400,
      fontFeatures: fontFeatures);

  static const TextStyle textInputError = TextStyle(
      fontFamily: 'Inter',
      color: DrColors.textError,
      fontSize: 14,
      height: 20.0 / 14,
      fontWeight: FontWeight.w400,
      fontFeatures: fontFeatures);

  static const TextStyle textInputHelper = TextStyle(
      fontFamily: 'Inter',
      color: DrColors.textDefaultDim,
      fontSize: 14,
      height: 20.0 / 14,
      fontWeight: FontWeight.w400,
      fontFeatures: fontFeatures);

  static const TextStyle textInputPlaceholder = TextStyle(
      fontFamily: 'Inter',
      color: DrColors.textDefaultOpacity03,
      fontSize: 16,
      height: 22.0 / 16,
      fontWeight: FontWeight.w400,
      fontFeatures: fontFeatures);

  static const TextStyle textInputPrefix = TextStyle(
      fontFamily: 'Inter',
      color: DrColors.textDefaultDim,
      fontSize: 16,
      height: 22.0 / 16,
      fontWeight: FontWeight.w400,
      fontFeatures: fontFeatures);

  static const TextStyle footnote = TextStyle(
      fontFamily: 'Inter',
      color: DrColors.textHint,
      fontSize: 14,
      height: 20.0 / 14,
      fontWeight: FontWeight.w400,
      fontFeatures: fontFeatures);

  static const TextStyle bodyTextRegular = TextStyle(
      fontFamily: 'Inter',
      color: DrColors.textRegular,
      fontSize: 16,
      height: 22.0 / 16,
      fontWeight: FontWeight.w400,
      fontFeatures: fontFeatures);

  static const TextStyle sfBody = TextStyle(
      fontFamily: 'Inter',
      color: DrColors.textDefault,
      fontSize: 16,
      height: 22.0 / 16,
      fontWeight: FontWeight.w400,
      fontFeatures: fontFeatures);

  static const TextStyle bodyNarrow = TextStyle(
      fontFamily: 'Inter',
      fontSize: 16,
      height: 18.0 / 16,
      fontWeight: FontWeight.w400,
      fontFeatures: fontFeatures);
}
