import 'package:exclusive_access/utils/constants/app_images.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

Widget notificationHeader() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 0.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Container(
            padding: const EdgeInsets.only(left: 0),
            child: Image.asset(AppImages.back_icon, height: 17),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(right: 12),
          child: Image.asset(AppImages.black_logo, height: 35),
        ),
        Container(),
      ],
    ),
  );
}
