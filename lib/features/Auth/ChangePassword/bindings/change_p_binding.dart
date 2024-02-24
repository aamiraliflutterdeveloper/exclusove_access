import 'package:exclusive_access/features/Auth/ChangePassword/controller/change_p_controller.dart';
import 'package:get/get.dart';

class ChangePBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ChangePController>(ChangePController());
  }
}
