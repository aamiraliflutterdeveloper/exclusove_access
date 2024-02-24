import 'package:exclusive_access/ApiManager/api_manager.dart';
import 'package:exclusive_access/global_controller.dart';
import 'package:exclusive_access/utils/constants/api_constants.dart';
import 'package:exclusive_access/utils/dialogs/loading_dialog.dart';
import 'package:exclusive_access/utils/global_widgets/custom_toast.dart';
import 'package:exclusive_access/utils/prefs/preference_manager.dart';
import 'package:exclusive_access/utils/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingController extends GetxController {

  final globalController = Get.find<GlobalController>();
  @override
  void onInit() {
    print("this is token value");
    print("${globalController.token}");
    super.onInit();
  }


  // logout ...
  logout(BuildContext context) async{
    print("hahahah");
    loadingDialog(context);
    print("starting point");
    await ApiManager().requestAPi(
        ApiConstant.logout,
        method: APIMethod.post,
      token: globalController.token,
    ).then((value) {
      if(value['status'] == 200) {
        print("success");
        print(value["message"]);
        String successMessage = value["message"];
        print(successMessage);
        PreferenceManager.instance.clear();
        Get.back();
        Get.offAllNamed(Routes.SIGNUP);
        customToast(context, value["message"]);
      } else {
        print("failure");
        Get.back();
        customToast(context, value["message"]);
      }
    });
  }



}