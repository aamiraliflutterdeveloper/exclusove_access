import 'package:exclusive_access/ApiManager/api_manager.dart';
import 'package:exclusive_access/utils/Extensions/get_character_extension.dart';
import 'package:exclusive_access/utils/constants/api_constants.dart';
import 'package:exclusive_access/utils/dialogs/loading_dialog.dart';
import 'package:exclusive_access/utils/global_widgets/custom_toast.dart';
import 'package:exclusive_access/utils/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPController extends GetxController {
  final GlobalKey<FormState> forgotPKey = GlobalKey<FormState>();
  late TextEditingController emailController;
  RxString  emailError = ''.obs;
  RxString tokenValue = ''.obs;

  RxInt userId = 0.obs;


  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
  }

  @override
  void onClose() {
    emailController.dispose();
  }

  Future<String?> validateEmail(String value) async {
    await Future.delayed(Duration.zero);
    if(value.isEmpty) {
      emailError.value = 'please enter email';
    } else if (!GetUtils.isEmail(value)) {
      emailError.value = "please enter valid email";
    } else {
      emailError.value = '';
    }
    return null;
  }

  void checkForgotPassword(BuildContext context) {
    if(forgotPKey.currentState!.validate()) {
      if(emailController.text.isNotEmpty && emailError.value.isEmpty) {
        forgotPassword(context);
        // Get.toNamed(Routes.OTP);
      }
    }
  }


  // ApiManager apiManager = ApiManager();
  forgotPassword(BuildContext context) async{
    print("hahahah");
    // loadingDialog(context);
    openBottomSheet('Loading Forgot Password Data ...!');
    print("starting point");
    Map<String, dynamic> data = {
      'email': emailController.text,
    };
    await ApiManager().requestAPi(
        ApiConstant.forget_password,
        method: APIMethod.post,
        data: data
    ).then((value) {
      if(value['status'] == 200) {
        print("success");
        print(value["message"]);
        String successMessage = value["message"];
        var output = successMessage.lastChars(5);
        tokenValue = output.obs;
        userId.value = value['data']['user']['id'];
        print("this is token value $tokenValue");
        Get.back();
        Get.toNamed(Routes.OTP);
      } else {
        Get.back();
        customToast(context, value["message"]);
      }
    });
  }


}


