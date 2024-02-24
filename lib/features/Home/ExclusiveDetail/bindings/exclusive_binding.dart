import 'package:exclusive_access/features/Home/ExclusiveDetail/controller/exclusive_controller.dart';
import 'package:get/get.dart';

class ExclusiveBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ExclusiveController>(ExclusiveController());
  }

}