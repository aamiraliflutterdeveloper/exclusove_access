import 'package:exclusive_access/features/Auth/Signup/controller/register_controller.dart';
import 'package:exclusive_access/features/Auth/Signup/view/components/register_form.dart';
import 'package:exclusive_access/utils/global_widgets/text_styles.dart';
import 'package:exclusive_access/utils/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put<RegisterController>(RegisterController());
    return Scaffold(
      backgroundColor: AppColors.PURE_WHITE_COLOR,
      // appBar: AppBar(
      //     // backgroundColor: Colors.white,
      //     elevation: 0,
      //     backgroundColor: Colors.white
      // ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 30),
                      Text("Sign Up", style: TextStyles.mediumTextStyle(fontSize: 22, fontWeight: FontWeight.w600)),
                      // const SizedBox(height: 5),
                      Text("Create an account to get started", style: TextStyles.regularTextStyle(textColor: AppColors.PURE_BLACK_COLOR, fontSize: 15)),
                      const SizedBox(height: 15),
                      registerForm(context),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}





