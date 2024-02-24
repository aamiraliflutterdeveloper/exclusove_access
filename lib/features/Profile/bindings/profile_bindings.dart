import 'package:exclusive_access/features/Profile/controller/profile_controller.dart';
import 'package:get/get.dart';

class ProfileBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<ProfileController>(ProfileController());
  }

}