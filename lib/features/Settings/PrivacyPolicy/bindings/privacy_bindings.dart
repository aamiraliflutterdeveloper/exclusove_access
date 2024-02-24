import 'package:exclusive_access/features/Settings/PrivacyPolicy/controller/privacy_controller.dart';
import 'package:get/get.dart';

class PrivacyBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<PrivacyController>(PrivacyController());
  }
}