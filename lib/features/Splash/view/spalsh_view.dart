import 'package:exclusive_access/features/Splash/controller/splash_controller.dart';
import 'package:exclusive_access/utils/constants/app_images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height,
      width: Get.width,
      child: Image.asset(AppImages.splash_image, fit: BoxFit.cover),
    );
  }
}












