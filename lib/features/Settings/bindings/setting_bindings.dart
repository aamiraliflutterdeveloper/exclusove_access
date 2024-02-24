import 'package:exclusive_access/features/Settings/controller/setting_controller.dart';
import 'package:get/get.dart';

class SettingBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<SettingController>(SettingController());
  }

}