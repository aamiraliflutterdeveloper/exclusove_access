import 'package:exclusive_access/ApiManager/api_manager.dart';
import 'package:exclusive_access/features/Auth/ForgotPassword/controller/forgot_p_controller.dart';
import 'package:exclusive_access/utils/constants/api_constants.dart';
import 'package:exclusive_access/utils/dialogs/loading_dialog.dart';
import 'package:exclusive_access/utils/global_widgets/custom_toast.dart';
import 'package:exclusive_access/utils/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OTPController extends GetxController with GetSingleTickerProviderStateMixin {

  final GlobalKey<FormState> otpFormKey = GlobalKey<FormState>();
  final forgotPController = Get.put<ForgotPController>(ForgotPController());
  late TextEditingController pinController;
  final focusNode = FocusNode();
  int counter = 0;
  late AnimationController animationController;
  int levelClock = 20;

  @override
  void onInit() {
    super.onInit();
    pinController = TextEditingController();
    pinController.text = forgotPController.tokenValue.value;
    animationController = AnimationController(
        vsync: this,
        duration: Duration(
            seconds:
            levelClock)
    );
    animationController.forward();
  }


  // match pin method ...
  matchPin(BuildContext context) async{
    print("hahahah");
    // loadingDialog(context);
    openBottomSheet('Loading Otp Data ...!');
    print("starting point of otp");
    Map<String, dynamic> data = {
      'user_id': forgotPController.userId.value,
      'pin': pinController.text
    };
    print(data);
    await ApiManager().requestAPi(
        ApiConstant.match_pin,
        method: APIMethod.post,
        data: data
    ).then((value) {
      if(value['status'] == 200) {
        print("success");
        print(value["message"]);
        Get.back();
        Get.toNamed(Routes.CHANGEPASSWORD);
        customToast(context, value['message']);
      } else {
        print("failure");
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





