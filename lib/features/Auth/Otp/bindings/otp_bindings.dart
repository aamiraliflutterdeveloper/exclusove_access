import 'package:exclusive_access/features/Auth/Otp/controller/otp_controller.dart';
import 'package:get/get.dart';

class OTPBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<OTPController>(OTPController());
  }

}



