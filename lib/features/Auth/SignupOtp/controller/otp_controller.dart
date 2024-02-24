import 'dart:convert';
import 'package:exclusive_access/ApiManager/api_manager.dart';
import 'package:exclusive_access/features/Auth/Signup/controller/register_controller.dart';
import 'package:exclusive_access/features/Auth/Signup/model/user_model.dart';
import 'package:exclusive_access/global_controller.dart';
import 'package:exclusive_access/utils/constants/api_constants.dart';
import 'package:exclusive_access/utils/dialogs/loading_dialog.dart';
import 'package:exclusive_access/utils/global_widgets/custom_toast.dart';
import 'package:exclusive_access/utils/prefs/preference_manager.dart';
import 'package:exclusive_access/utils/prefs/prefs.dart';
import 'package:exclusive_access/utils/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpOTPController extends GetxController with GetSingleTickerProviderStateMixin {

  final GlobalKey<FormState> otpSignUpFormKey = GlobalKey<FormState>();
  final registerController = Get.find<RegisterController>();
  final globalController = Get.find<GlobalController>();
  late TextEditingController pinController;
  final focusNode = FocusNode();
  int counter = 0;
  late AnimationController animationController;
  int levelClock = 20;

  @override
  void onInit() {
    super.onInit();
    pinController = TextEditingController();
    pinController.text = registerController.tokenValue.value;
    animationController = AnimationController(
        vsync: this,
        duration: Duration(
            seconds:
            levelClock)
    );
    animationController.forward();
  }

  // otp match method ...
  registerOtp(BuildContext context) async{
    print("hahahah");
    loadingDialog(context);
    print("starting point of otp");
    Map<String, dynamic> data = {
      'user_id': registerController.userId.value,
      'otp': pinController.text
    };
    print(data);
    await ApiManager().requestAPi(
        ApiConstant.register_otp,
        method: APIMethod.post,
        data: data
    ).then((value) {
      if(value['status'] == 200) {
        UserModel user = UserModel.fromJson(value['data']);

        // get user profile data
        final encodedUser = user.user.toJson();
        PreferenceManager.instance
            .setString(Prefs.user, json.encode(encodedUser));
        globalController.initSessionUser();

        // get user token data
        final token = user.token;
        PreferenceManager.instance
            .setString(Prefs.token, token);
        globalController.initToken();
        print("success");
        print(value["message"]);
        Get.offAllNamed(Routes.DASHBOARD);
        customToast(context, value['message']);
      } else {
        Get.back();
        customToast(context, value['message']);
      }
    });
  }

  @override
  void onClose() {
    pinController.dispose();
    focusNode.dispose();
    animationController.dispose();
  }


}





