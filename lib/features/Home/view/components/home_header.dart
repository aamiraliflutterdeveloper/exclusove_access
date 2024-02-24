import 'package:exclusive_access/utils/constants/app_images.dart';
import 'package:exclusive_access/utils/routes/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

Widget homeHeader() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(),
        Container(
          padding: const EdgeInsets.only(left: 12),
          child: Image.asset(AppImages.black_logo, height: 35),
        ),
        GestureDetector(
          onTap: () {
            Get.toNamed(Routes.NOTIFICATIONS);
          },
          child: Container(
            padding: const EdgeInsets.only(right: 2),
            child: Image.asset(AppImages.notification_icon, height: 18),
          ),
        ),
      ],
    ),
  );
}




