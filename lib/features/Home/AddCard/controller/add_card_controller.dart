import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AddCardController extends GetxController {
  late TextEditingController nameController;

  RxString nameError = ''.obs;

  @override
  void onInit() {
    nameController = TextEditingController();
    super.onInit();
  }


  Future<String?> validateName(String value) async{
    await Future.delayed(Duration.zero);
    if(value.isEmpty) {
      nameError.value = 'Please enter Name';
    } else {
      nameError.value = '';
    }
    return null;
  }




  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }
}