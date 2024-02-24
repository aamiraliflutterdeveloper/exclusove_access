import 'package:exclusive_access/features/Settings/Terms_And_Conditions/model/terms_condition_model.dart';
import 'package:get/get.dart';
import 'package:exclusive_access/ApiManager/api_manager.dart';
import 'package:exclusive_access/utils/constants/api_constants.dart';
import 'package:exclusive_access/utils/global_widgets/custom_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class TermsConditionController extends GetxController {
  TermsCondition? termsCondition;
  bool isLoading = false;

  @override
  void onInit() {
    super.onInit();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      termsConditions(Get.context as BuildContext);
    });
  }


  // privacy policy ...
  termsConditions(BuildContext context) async {
    // loadingDialog(context);
    isLoading = true;
    await ApiManager().requestAPi(
      ApiConstant.terms_and_conditions,
      method: APIMethod.get,
    ).then((value) {
      if(value['status'] == 200) {
        termsCondition = TermsCondition.fromJson(value['data']);
        isLoading = false;
        update();
        // Get.back();
        print("this is user data");
      } else {
        isLoading = false;
        Get.back();
        customToast(context, value['message']);
      }
    });
  }




}
