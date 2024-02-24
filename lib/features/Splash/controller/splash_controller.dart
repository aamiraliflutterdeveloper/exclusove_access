import 'dart:async';
import 'package:exclusive_access/global_controller.dart';
import 'package:exclusive_access/utils/routes/routes.dart';
import 'package:exclusive_access/utils/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {

  final globalController = Get.find<GlobalController>();

  void splashDuration() {
    Timer(const Duration(seconds: 3),
            ()=> globalController.token != null ? Get.offNamed(Routes.DASHBOARD) : Get.offNamed(Routes.SIGNUP)
    );
  }

  @override
  void onInit() {
    splashDuration();
    super.onInit();
  }

}