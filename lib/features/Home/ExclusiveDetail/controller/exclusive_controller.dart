import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ExclusiveController extends GetxController {
  late TextEditingController promoCode;

  int? currentItem;

  addItem() {
    currentItem = currentItem! + 1;
    update();
  }

  removeItem() {
    if(currentItem! >=2) {
      currentItem = (currentItem! - 1);
      update();
    }
  }

  @override
  void onInit() {
    currentItem = 1;
    promoCode = TextEditingController(text: '12345678');
    super.onInit();
  }
}




