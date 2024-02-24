import 'package:exclusive_access/utils/constants/app_images.dart';
import 'package:exclusive_access/utils/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget exclusiveDetailHeader() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 0),
    child: Container(
      width: Get.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(5),
            topRight: Radius.circular(5),
            bottomLeft: Radius.circular(5),
            bottomRight: Radius.circular(5)
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: .5,
            blurRadius: 3,
            offset: const Offset(0, 0), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
            ),
            width: Get.width,
            child: Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                    height: 250,
                    child: Image.asset(AppImages.splash_logo, color: Colors.white, alignment: Alignment.center)),
                Positioned(
                  left: 15,
                  top: 25,
                  child: GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Image.asset(AppImages.back_icon, color: AppColors.PURE_WHITE_COLOR, height: 17)),
                ),
              ],
            ),
          )
        ],
      ),
    ),
  );
}