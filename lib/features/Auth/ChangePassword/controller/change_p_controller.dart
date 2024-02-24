import 'package:exclusive_access/ApiManager/api_manager.dart';
import 'package:exclusive_access/features/Auth/ForgotPassword/controller/forgot_p_controller.dart';
import 'package:exclusive_access/utils/constants/api_constants.dart';
import 'package:exclusive_access/utils/dialogs/loading_dialog.dart';
import 'package:exclusive_access/utils/global_widgets/custom_toast.dart';
import 'package:exclusive_access/utils/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangePController extends GetxController {
  final GlobalKey<FormState> nPasswordFormKey = GlobalKey<FormState>();
  final forgotPController = Get.put<ForgotPController>(ForgotPController());
  late TextEditingController passwordController;
  late TextEditingController cPasswordController;
  RxString  passwordError = ''.obs;
  RxString  cPasswordError = ''.obs;

  @override
  void onInit() {
    super.onInit();
    passwordController = TextEditingController();
    cPasswordController = TextEditingController();
  }

  @override
  void onClose() {
    passwordController.dispose();
    cPasswordController.dispose();
  }

  Future<String?> validatePassword(String value) async {
    await Future.delayed(Duration.zero);
    if(value.isEmpty) {
      passwordError.value = 'please enter password';
    } else if (value.length < 6) {
      passwordError.value = "Password must be of 6 characters";
    } else {
      passwordError.value = '';
    }
    return null;
  }

  Future<String?> cValidatePassword(String value) async{
    await Future.delayed(Duration.zero);
    if (cPasswordController.text.isEmpty) {
      cPasswordError.value = "Please enter confirm password";
    } else if (passwordController.text != cPasswordController.text) {
      cPasswordError.value = "Please match your password";
    } else {
      cPasswordError.value = '';
    }
    return null;
  }


  void changePassword(BuildContext context) {
    if(nPasswordFormKey.currentState!.validate()) {
      if(passwordController.text.isNotEmpty && passwordError.value.isEmpty && cPasswordController.text.isNotEmpty && cPasswordError.value.isEmpty) {
        changePasswordApi(context);
      }
    }
  }

  // match pin method ...
  changePasswordApi(BuildContext context) async{
    print("hahahah");
    // loadingDialog(context);
    openBottomSheet('Changing Password ...!');
    print("starting point of otp");
    Map<String, dynamic> data = {
      'user_id': forgotPController.userId.value,
      'password': passwordController.text
    };
    print(data);
    await ApiManager().requestAPi(
        ApiConstant.change_password,
        method: APIMethod.post,
        data: data
    ).then((value) {
      if(value['status'] == 200) {
        print("success");
        print(value["message"]);
        Get.back();
        Get.back();
        Get.back();
        Get.back();
        customToast(context, value['message']);
      } else {
        print("failure");
        Get.back();
        customToast(context, value['message']);
      }
    });
  }



}