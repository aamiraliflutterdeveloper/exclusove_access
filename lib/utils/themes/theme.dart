import 'package:exclusive_access/utils/themes/app_colors.dart';
import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.dark,
  // scaffoldBackgroundColor: AppColors.PURE_WHITE_COLOR,
  appBarTheme: AppBarTheme(
    // backgroundColor: Colors.white,
    elevation: 0,
    foregroundColor: Colors.transparent,
    color: Colors.transparent,
  )
);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: AppColors.PURE_BLACK_COLOR,
  appBarTheme: const AppBarTheme(
    color: AppColors.PURE_BLACK_COLOR,
  )
);
