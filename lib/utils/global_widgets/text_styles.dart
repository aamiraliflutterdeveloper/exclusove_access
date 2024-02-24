import 'package:exclusive_access/utils/fonts/app_font_family.dart';
import 'package:exclusive_access/utils/themes/app_colors.dart';
import 'package:flutter/material.dart';

class TextStyles {
  static TextStyle regularTextStyle(
      // {Color textColor = AppColors.pureBlackColorApp,
      {Color textColor = AppColors.PURE_BLACK_COLOR,
        double height = 1.35,
        double fontSize = 14,
        FontWeight fontWeight = FontWeight.w500,
        String fontFamily = AppFontFamily.helvetica}) {
    return TextStyle(
        color: textColor,
        fontSize: fontSize,
        height: height,
        fontWeight: fontWeight,
        fontFamily: fontFamily);
  }

  static TextStyle mediumTextStyle(
      // {Color textColor = AppColors.pureBlackColorApp,
      {Color textColor = AppColors.PURE_BLACK_COLOR,
        double fontSize = 15,
        double height = 1.35,
        FontWeight fontWeight = FontWeight.w500,
        String fontFamily = AppFontFamily.mediumHelvetica}) {
    return TextStyle(
      height: height,
        color: textColor,
        fontSize: fontSize,
        fontWeight: fontWeight,
        fontFamily: fontFamily);
  }

  static TextStyle semiBoldTextStyle(
      {Color textColor = AppColors.pureBlackColorApp,
        double fontSize = 22,
        String fontFamily = AppFontFamily.helvetica}) {
    return TextStyle(
        color: textColor,
        fontSize: fontSize,
        fontWeight: FontWeight.w700,
        fontFamily: fontFamily);
  }

  static TextStyle boldTextStyle(
      // {Color textColor = AppColors.pureBlackColorApp,
      {Color textColor = AppColors.PURE_BLACK_COLOR,
        double fontSize = 22,
        FontWeight fontWeight = FontWeight.w800,
        String fontFamily = AppFontFamily.helvetica}) {
    return TextStyle(
        color: textColor,
        fontSize: fontSize,
        fontWeight: fontWeight,
        fontFamily: fontFamily);
  }

}


