import 'package:exclusive_access/features/Settings/Support/controller/support_controller.dart';
import 'package:get/get.dart';

class SupportBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<SupportController>(SupportController());
  }
}