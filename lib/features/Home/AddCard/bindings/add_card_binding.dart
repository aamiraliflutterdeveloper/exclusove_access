import 'package:exclusive_access/features/Home/AddCard/controller/add_card_controller.dart';
import 'package:get/get.dart';

class AddCardBiding extends Bindings {
  @override
  void dependencies() {
    Get.put<AddCardController>(AddCardController());
  }
}



