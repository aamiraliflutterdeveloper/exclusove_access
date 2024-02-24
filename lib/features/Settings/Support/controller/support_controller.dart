import 'package:exclusive_access/ApiManager/api_manager.dart';
import 'package:exclusive_access/global_controller.dart';
import 'package:exclusive_access/utils/constants/api_constants.dart';
import 'package:exclusive_access/utils/dialogs/loading_dialog.dart';
import 'package:exclusive_access/utils/global_widgets/custom_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class SupportController extends GetxController {

  final GlobalController globalController = Get.find<GlobalController>();

  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController messageController;

  RxString nameError = ''.obs;
  RxString  emailError = ''.obs;
  RxString  messageError = ''.obs;

  @override
  void onInit() {
    super.onInit();
    nameController = TextEditingController();
    emailController = TextEditingController();
    messageController = TextEditingController();
  }

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    messageController.dispose();

  }

  Future<String?> validateName(String value) async{
    await Future.delayed(Duration.zero);
    if(value.isEmpty) {
      nameError.value = 'please enter name';
    } else {
      nameError.value = '';
    }
    return null;
  }

  Future<String?> validateMessage(String value) async{
    await Future.delayed(Duration.zero);
    if(value.isEmpty) {
      messageError.value = 'please enter message';
    } else {
      messageError.value = '';
    }
    return null;
  }


  Future<String?> validateEmail(String value) async{
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




  void checkSupport(BuildContext context) {
      if(emailController.text.isNotEmpty && emailError.isEmpty && nameController.text.isNotEmpty && nameError.isEmpty && messageController.text.isNotEmpty && messageError.isEmpty) {
        support(context);
    }
  }

  // support ...
  support(BuildContext context) async{
    print("hahahah");
    // loadingDialog(context);
    openBottomSheet('Sending Support Data ...!');
    print("starting point");
    Map<String, dynamic> data = {
      'name': nameController.text,
      'client_email': emailController.text,
      'description': messageController.text,
    };
    await ApiManager().requestAPi(
        ApiConstant.send_feedback_request,
        method: APIMethod.post,
        // token: globalController.token,
        data: data
    ).then((value) {
      if(value['status'] == 200) {
        print("success");
        print(value["message"]);
        Get.back();
        Get.back();
        customToast(context, value['message']);
      } else {
        Get.back();
        customToast(context, value['message']);
      }
    });
  }



}




