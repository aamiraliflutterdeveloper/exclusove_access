import 'dart:async';

import 'package:exclusive_access/utils/global_widgets/text_styles.dart';
import 'package:exclusive_access/utils/routes/routes.dart';
import 'package:exclusive_access/utils/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDialog {
  static Future<void> autoCloseDialog(BuildContext context, String title, String subTitle) async {
    Timer? timer;
    showDialog(
        context: context,
        barrierColor: Colors.grey.withOpacity(.8),
        barrierDismissible: false,
        builder: (BuildContext builderContext) {
          timer = Timer(const Duration(seconds: 2), () {
            Get.offAllNamed(Routes.SIGNIN);
          });
          return AlertDialog(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(15),
                topLeft: Radius.circular(15),
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
            ),
            backgroundColor: AppColors.PURE_WHITE_COLOR,
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const CircleAvatar(
                  radius: 30,
                  backgroundColor: AppColors.PURE_BLACK_COLOR,
                  child: Icon(Icons.check, color: AppColors.PURE_WHITE_COLOR, size: 30),
                ),
                const SizedBox(height: 20),
                Text(title, style: TextStyles.boldTextStyle()),
                const SizedBox(height: 8),
                Text(subTitle, style: TextStyles.regularTextStyle(), textAlign: TextAlign.center,)
              ],
            ),
          );
        }
    ).then((val){
      if (timer!.isActive) {
        timer!.cancel();
      }
    });
  }
}