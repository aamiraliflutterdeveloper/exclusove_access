import 'package:exclusive_access/ApiManager/api_manager.dart';
import 'package:exclusive_access/features/Settings/PrivacyPolicy/model/privacy_model.dart';
import 'package:exclusive_access/utils/constants/api_constants.dart';
import 'package:exclusive_access/utils/global_widgets/custom_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';

class PrivacyController extends GetxController {
  PrivacyModel? privacyModel;
  bool isLoading = false;

  @override
  void onInit() {
    super.onInit();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      privacyPolicy(Get.context as BuildContext);
    });
  }


  // privacy policy ...
  privacyPolicy(BuildContext context) async {
    // loadingDialog(context);
    isLoading = true;
    await ApiManager().requestAPi(
        ApiConstant.privacy_policy,
        method: APIMethod.get,
    ).then((value) {
      if(value['status'] == 200) {
        print("success");
        privacyModel = PrivacyModel.fromJson(value['data']);
        isLoading = false;
        update();
        // Get.back();
        print("this is user data");
      } else {
        isLoading = false;
        update();
        Get.back();
        customToast(context, value['message']);
      }
    });
  }




}