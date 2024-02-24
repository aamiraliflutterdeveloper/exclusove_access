import 'package:exclusive_access/utils/global_widgets/text_styles.dart';
import 'package:exclusive_access/utils/themes/app_colors.dart';
import 'package:flutter/material.dart';

Widget notificationTile() {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 4.0),
    child: Container(
      decoration: BoxDecoration(
        color: AppColors.greyColorApp,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 18),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Lorem ipsum is simply dummy the of the", style: TextStyles.regularTextStyle(fontSize: 13, textColor: AppColors.PURE_BLACK_COLOR.withOpacity(.6))),
            Text("Just Now", style: TextStyles.mediumTextStyle(textColor: AppColors.PURE_BLACK_COLOR, fontSize: 15))
          ],
        ),
      ),
    ),
  );
}




