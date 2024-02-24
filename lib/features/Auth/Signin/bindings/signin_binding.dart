import 'package:exclusive_access/features/Auth/Signin/controller/signin_controller.dart';
import 'package:get/get.dart';

class SignInBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<SignInController>(SignInController());
  }
}
