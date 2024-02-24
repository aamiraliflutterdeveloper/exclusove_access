import 'dart:convert';
import 'package:exclusive_access/ApiManager/api_manager.dart';
import 'package:exclusive_access/features/Auth/Signup/model/user_model.dart';
import 'package:exclusive_access/global_controller.dart';
import 'package:exclusive_access/utils/constants/api_constants.dart';
import 'package:exclusive_access/utils/dialogs/loading_dialog.dart';
import 'package:exclusive_access/utils/global_widgets/custom_toast.dart';
import 'package:exclusive_access/utils/global_widgets/text_styles.dart';
import 'package:exclusive_access/utils/prefs/preference_manager.dart';
import 'package:exclusive_access/utils/prefs/prefs.dart';
import 'package:exclusive_access/utils/routes/routes.dart';
import 'package:exclusive_access/utils/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInController extends GetxController {
  late TextEditingController emailController, passwordController;
  final globalController = Get.find<GlobalController>();

  RxString  emailError = ''.obs;
  RxString passwordError = ''.obs;
  RxBool passwordVisible = false.obs;

  void togglePassword() {
    passwordVisible.value = !passwordVisible.value;
  }


  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
  }

  Future<String?> validateEmail(String value) async{
    await Future.delayed(Duration.zero);
    if(value.isEmpty) {
      emailError.value = 'Please enter email';
    } else if (!GetUtils.isEmail(value)) {
      emailError.value = "Please enter valid email";
    } else {
      emailError.value = '';
    }
    return null;
  }

  Future<String?> validatePassword(String value) async{
    await Future.delayed(Duration.zero);
    if (value.isEmpty) {
      passwordError.value = "Please enter password";
    } else {
      passwordError.value = '';
    }
    return null;
  }

  void checkLogin(BuildContext context) {
      if(emailController.text.isNotEmpty && emailError.value.isEmpty && passwordController.text.isNotEmpty && passwordError.value.isEmpty) {
        login(context);
    }
  }

  // login ...
  login(BuildContext context) async{
    openBottomSheet('Loading Sign In Data ...!');
    print("starting point");
    Map<String, dynamic> data = {
      'email': emailController.text,
      'password': passwordController.text,
      'device_token': 'device_token',
    };
    await ApiManager().requestAPi(
        ApiConstant.login,
        method: APIMethod.post,
        data: data
    ).then((value) {
      if(value['status'] == 200) {
        print("success");
        print(value["message"]);
        UserModel user = UserModel.fromJson(value['data']);
        // get user profile data
      final encodedUser = user.user.toJson();
        PreferenceManager.instance
            .setString(Prefs.user, json.encode(encodedUser));
        globalController.initSessionUser();

        // get user token data
        final token = user.token;
        print("this is user token ${user.token}");
        PreferenceManager.instance
            .setString(Prefs.token, token);
        globalController.initToken();

        Get.back();
        Get.offAllNamed(Routes.DASHBOARD);
        customToast(context, value['message']);
      } else {
        Get.back();
        customToast(context, value['message']);
      }
    });
  }



}









