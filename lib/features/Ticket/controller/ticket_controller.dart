import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TicketController extends GetxController with GetSingleTickerProviderStateMixin {

  late PageController pageController;
  int activePageIndex = 0;

  changePage(int index) {
    activePageIndex = index;
    update();
  }

  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }



}