import 'dart:convert';

import 'package:exclusive_access/ApiManager/api_manager.dart';
import 'package:exclusive_access/features/Auth/Signup/model/user_model.dart';
import 'package:exclusive_access/global_controller.dart';
import 'package:exclusive_access/utils/constants/api_constants.dart';
import 'package:exclusive_access/utils/dialogs/loading_dialog.dart';
import 'package:exclusive_access/utils/global_widgets/custom_toast.dart';
import 'package:exclusive_access/utils/prefs/preference_manager.dart';
import 'package:exclusive_access/utils/prefs/prefs.dart';
import 'package:exclusive_access/utils/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {

  final globalController = Get.find<GlobalController>();

  late TextEditingController nameController;
  late TextEditingController ageController;
  late TextEditingController phoneController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController locationController;
  late TextEditingController genderController;
  List<String> gendersList = ['Male', 'Female', 'Other'];
  bool privacyCheck = false;
  String selectedGender = '';
  bool profileUpdate = false;

  updateProfile() {
    profileUpdate = !profileUpdate;
    update();
  }

  acceptPrivacy(bool v) {
    privacyCheck = v;
    update();
  }

  selectGender(String v) {
    selectedGender = v;
    update();
  }

  RxString nameError = ''.obs;
  RxString ageError = ''.obs;
  RxString phoneError = ''.obs;
  RxString  emailError = ''.obs;
  RxString passwordError = ''.obs;
  RxString locationError = ''.obs;

  @override
  void onInit() {
    super.onInit();
    globalController.initSessionUser();
    globalController.initToken();
    print("this is initialized");
    // initSession();


    profileUpdate = false;
    nameController = TextEditingController();
    ageController = TextEditingController();
    emailController = TextEditingController();
    phoneController = TextEditingController();
    passwordController = TextEditingController();
    locationController = TextEditingController();
    genderController = TextEditingController();

    // assign values to controllers...
    nameController.text = globalController.user!.name ?? '';
    ageController.text = globalController.user!.age ?? '';
    emailController.text = globalController.user!.email ?? '';
    phoneController.text = globalController.user!.mobile ?? '';
    locationController.text = globalController.user!.address ?? '';
    selectedGender = globalController.user!.gender ?? 'Other';
    genderController.text = globalController.user!.gender ?? 'Other';
    print("user id::");
  }

  @override
  void dispose() {
    print("this is disposed");
    Get.delete<ProfileController>();
    super.dispose();
  }

  @override
  void onClose() {
    nameController.dispose();
    ageController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    locationController.dispose();
    print("this is closed");
    Get.delete<ProfileController>();
    super.onClose();
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

  Future<String?> validateLocation(String value) async{
    await Future.delayed(Duration.zero);
    if(value.isEmpty) {
      locationError.value = 'please enter location';
    } else {
      locationError.value = '';
    }
    return null;
  }

  Future<String?> validatePhone(String value) async{
    await Future.delayed(Duration.zero);
    if(value.isEmpty) {
      phoneError.value = 'please enter phone number';
    } else if(value.length < 7) {
      phoneError.value = 'please enter valid phone number';
    } else {
      phoneError.value = '';
    }
    return null;
  }

  Future<String?> validateAge(String value) async{
    await Future.delayed(Duration.zero);
    if(value.isEmpty) {
      ageError.value = 'please enter age';
    } else if(int.parse(value) < 10) {
      ageError.value = 'please enter valid age';
    } else {
      ageError.value = '';
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

  Future<String?> validatePassword(String value) async {
    await Future.delayed(Duration.zero);
    if (value.length < 6) {
      passwordError.value = "Password must be of 6 characters";
    } else {
      passwordError.value = '';
    }
    return null;
  }


  void checkProfile(BuildContext context) {
    updateProfile();
    updateProfileApi(context);
  }


  // update profile ...
  updateProfileApi(BuildContext context) async {
      // loadingDialog(context);
      openBottomSheet('Updating Profile Data ...!');
      print(globalController.token);
      print("starting point");
      Map<String, dynamic> data = {
        'name': nameController.text,
        'mobile': phoneController.text,
        'gender': selectedGender,
        'address': locationController.text,
        // 'password': passwordController.text,
        // 'password_confirmation': passwordController.text,
        'device_token': 'device_token',
        'lat': '32.56',
        'lng': '44.56',
        'age': ageController.text
      };
      await ApiManager().requestAPi(
          ApiConstant.user_update_profile,
          method: APIMethod.post,
          token: globalController.token,
          data: data
      ).then((value) {
        if(value['status'] == 200) {
          print("success");
          print(value["message"]);
          print("success");
          print("this is updated user details: ${value['']}");
          String successMessage = value["message"];
          Get.back();
          customToast(context, successMessage);
          print(value['data']);
          print("this is data from the user");
          User user = User.fromJson(value['data']['user']);
          print(user.rememberToken);
          // get user profile data
          final encodedUser = user.toJson();
          PreferenceManager.instance
              .setString(Prefs.user, json.encode(encodedUser));
          globalController.initSessionUser();
          print("this is user data");
        } else {
          Get.back();
          customToast(context, value['message']);
        }
      });
    }

}