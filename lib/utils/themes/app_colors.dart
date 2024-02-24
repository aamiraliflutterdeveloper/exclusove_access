// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class AppColors {

  // ea colors
  static const Color lightGreyColorApp = Color(0xFFEFEFEF);
  static const Color darkGreyColorApp = Color(0xFF707070);
  static const Color greyColorApp = Color(0xFFE1E1E1);
  static const Color pureBlackColorApp = Color(0xFF434242);
  static const Color mediumBlackColorApp = Color(0xFF606060);
  static const Color PURE_BLACK_COLOR =  Color(0xFF000000);



  /// splash bg color
  static const Color LIGHT_BLUE_COLOR = Color(0xFF6BAADD);

  static const Color MEDIUM_BLACK_COLOR =  Color(0xFF1E232C);
  static const Color PURE_WHITE_COLOR =  Color(0xFFFFFFFF);
  static const Color PURE_RED_COLOR =  Color(0xFFDB2719);

  static const Color greyColor = Color(0xFFE1E1E1);


  static const Color darkGreyColor = Color(0xFF8391A1);
  static const Color highDarkColor = Color(0xFF6A707C);
  static const Color mediumGreyColor =  Color(0xFF838BA1);
  static const Color lightestGreyColor =  Color(0xFFF7F8F9);
  static const Color lightGreyColor =  Color(0xFFE8ECF4);
  static const Color lightestBlackColor =  Color(0xFFAEAEAE);
  static const Color lightBlackColor =  Color(0xFF8391A1);













  // Shimmer Colors

  static Color SHIMMER_BASE_COLOR = Colors.grey;
  static Color SHIMMER_HIGHLIGHT_COLOR = Colors.white;

  //

  static Color WHITE_COLOR = const Color(0xffFFFFFF);
  static Color DARK_PRIMARY_COLOR = const Color(0xFF004040);
  static Color PRIMARY_COLOR = const Color(0xFF8FC5A3);
  static Color LIGHT_OGRAN_COLOR = const Color(0xFFF2CBA8);
  static Color LIGHT_PURPLE_COLOR = const Color(0xFF99B0D2);

  //

  static Color PRIMARY_LIGHT_COLOR = const Color(0xFF87A5A5);
  static Color DISC_GREY_COLOR = const Color(0xFFA1A1A1);
  static Color BORDER_GREY_COLOR = const Color(0xFFD6D6D6);
  static Color DASHBOARD_CARD_COLOR_01 = const Color(0xFF0A0150);
  static Color DASHBOARD_CARD_COLOR_02 = const Color(0xFF03354F);
  static Color DASHBOARD_CARD_COLOR_03 = const Color(0xFF562FBE);
  static Color BG_GREY_COLOR = const Color(0xFFF3F3F3);
  static Color BG_CARD_COLOR = const Color(0xFFF4FBF7);
  static Color ORANGE_COLOR = const Color(0xFFFF9617);
  static Color LIGTH_COLOR = const Color(0xFFE1E1E1);
  static Color LIGHT_GREEN_COLOR = const Color(0xFF8FC5A3);
  static Color DARK_COLOR = const Color(0xff555555);
  static Color FAQS_CARD_01_COLOR = const Color(0xffDFF1FF);
  static Color FAQS_CARD_02_COLOR = const Color(0xffE8FFEB);
  static Color FAQS_CARD_03_COLOR = const Color(0xffFFECEF);

  ///
  ///
  ///
  static Color BLACK_COLOR = const Color(0xff000000);
  static Color GREY_COLOR = const Color.fromARGB(255, 138, 142, 150);
  static Color BOTTOM_GREY_COLOR = const Color(0xffD4D6D9);
  static Color DARK_GREY_COLOR = const Color(0xFF54545A);
  static Color APPBAR_GREY_COLOR = const Color(0xFFE5E5E5);
  static Color LIGHT_GREY_COLOR = const Color(0xFF98a1ab);
  static Color DARK_TEXT_COLOR = const Color(0xff000000);
  static Color TRANSPARENT_COLOR = Colors.transparent;
  static Color RED_COLOR = const Color(0xFFDC2E45);
}

class AppGradient {
  static Gradient SPLASHSCREEN_GRADIENT = const LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0XFFE9F1FF),
      Color(0XFFFFFFFF),
    ],
  );
  static Gradient LANDINGSCREEN_GRADIENT = LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    colors: [AppColors.PRIMARY_COLOR, AppColors.LIGHT_OGRAN_COLOR],
  );
  static Gradient LOGINSCREEN_GRADIENT = const LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    colors: [
      Color(0xff2412A9),
      Color(0XFFFFFFFF),
    ],
  );
}
