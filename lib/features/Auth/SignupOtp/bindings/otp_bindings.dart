import 'package:exclusive_access/features/Auth/Otp/controller/otp_controller.dart';
import 'package:exclusive_access/features/Auth/SignupOtp/controller/otp_controller.dart';
import 'package:get/get.dart';

class SignUpOTPBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<SignUpOTPController>(SignUpOTPController());
  }

}



