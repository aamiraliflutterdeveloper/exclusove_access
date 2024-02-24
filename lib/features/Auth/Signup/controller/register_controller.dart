import 'package:exclusive_access/ApiManager/Exception/api_exception.dart';
import 'package:exclusive_access/ApiManager/api_manager.dart';
import 'package:exclusive_access/global_controller.dart';
import 'package:exclusive_access/utils/Extensions/get_character_extension.dart';
import 'package:exclusive_access/utils/constants/api_constants.dart';
import 'package:exclusive_access/utils/dialogs/loading_dialog.dart';
import 'package:exclusive_access/utils/global_widgets/custom_toast.dart';
import 'package:exclusive_access/utils/routes/routes.dart';
import 'package:exclusive_access/utils/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  final GlobalKey<FormState> registerKey = GlobalKey<FormState>();
  final globalController = Get.find<GlobalController>();
  late TextEditingController nameController;
  late TextEditingController ageController;
  late TextEditingController phoneController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController locationController;
  List<String> gendersList = ['Male', 'Female', 'Other'];
  bool privacyCheck = false;
  String selectedGender = '';
  String genderValidation = 'abc';
  RxString tokenValue = ''.obs;
  RxInt userId = 0.obs;

acceptPrivacy(bool v) {
  privacyCheck = v;
    update();
  }

selectGender(String v) {
  selectedGender = v;
    update();
  }

  checkGender() {
    if(genderValidation == 'abc') {
      genderValidation = '';
      update();
    }
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
    // globalController.changeStatusColor(AppColors.PURE_WHITE_COLOR);
    nameController = TextEditingController();
    ageController = TextEditingController();
    emailController = TextEditingController();
    phoneController = TextEditingController();
    passwordController = TextEditingController();
    locationController = TextEditingController();
  }

  @override
  void onClose() {
    nameController.dispose();
    ageController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    locationController.dispose();
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

  void checkRegister(BuildContext context) {
      if(emailController.text.isNotEmpty && passwordController.text.isNotEmpty && selectedGender.isNotEmpty && phoneController.text.isNotEmpty && locationController.text.isNotEmpty) {
        registerUser(context);
    }
  }

  // ApiManager apiManager = ApiManager();
  registerUser(BuildContext context) async{
    print("hahahah");
    // loadingDialog(context);
    openBottomSheet('Loading Sign Up Data ...!');
    print("starting point");
    Map<String, dynamic> data = {
      'email': emailController.text,
      'name': nameController.text,
      'mobile': phoneController.text,
      'address': locationController.text,
      'password': passwordController.text,
      'password_confirmation': passwordController.text,
      'device_token': 'device_token',
      'lat': '32.56',
      'lng': '44.56',
      'age': ageController.text
    };
    await ApiManager().requestAPi(
        ApiConstant.register_url,
        method: APIMethod.post,
        data: data
    ).then((value) {
      if(value['status'] == 200) {
        print("success");
        print(value["message"]);
        userId.value = value['data']['user']['id'];
        print("this is user id of the user :: ${userId.value}");
        String successMessage = value["message"];
        // var source = 'Hello World';
        var output = successMessage.lastChars(5);
        tokenValue = output.obs;
        Get.back();
        Get.toNamed(Routes.SIGNUPOTP);
        // print("this is token value === $tokenValue");
        // print(output);
        // print("this is output of the syntax");
      } else {
        Get.back();
        ApiException exceptions = ApiException.fromJson(value);
        customToast(context, exceptions.errors[0]);
      }
    });
  }



}





