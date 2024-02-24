import 'package:exclusive_access/features/Auth/ForgotPassword/controller/forgot_p_controller.dart';
import 'package:get/get.dart';

class ForgotPBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ForgotPController>(ForgotPController());
  }

}