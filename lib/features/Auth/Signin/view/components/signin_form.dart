import 'package:exclusive_access/features/Auth/Signin/controller/signin_controller.dart';
import 'package:exclusive_access/utils/fonts/app_dimensions.dart';
import 'package:exclusive_access/utils/global_widgets/app_text.dart';
import 'package:exclusive_access/utils/global_widgets/custom_button_without_icon.dart';
import 'package:exclusive_access/utils/global_widgets/custom_text_field.dart';
import 'package:exclusive_access/utils/global_widgets/text_styles.dart';
import 'package:exclusive_access/utils/routes/routes.dart';
import 'package:exclusive_access/utils/themes/app_colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
    final controller = Get.find<SignInController>();
    return Form(
      key: loginFormKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // email field
          const SizedBox(height: 10),
          Text("Email", style: TextStyles.regularTextStyle()),
          const SizedBox(height: 2),
          CustomTextField(
            borderColor: AppColors.greyColorApp,
            hintText: 'Enter Email',
            controller: controller.emailController,
            validator: (value) {
              controller.validateEmail(value!);
              return null;
            },
          ),
          Obx(
                () => controller.emailError.isNotEmpty
                ? Text(
              controller.emailError.toString(),
              style: const TextStyle(
                  color: AppColors.PURE_RED_COLOR,
                  fontSize:
                  AppDimensions.FONT_SIZE_14),
            )
                : const SizedBox.shrink(),
          ),

          // password field
          const SizedBox(height: 10),
          Text("Password", style: TextStyles.regularTextStyle()),
          const SizedBox(height: 2),
          CustomTextField(
            borderColor: AppColors.greyColorApp,
            hintText: 'Enter Password',
            controller: controller.passwordController,
            validator: (value) {
              controller.validatePassword(value!);
              return null;
            },
          ),
          Obx(
                () => controller.passwordError.isNotEmpty
                ? Text(
              controller.passwordError.toString(),
              style: const TextStyle(
                  color: AppColors.PURE_RED_COLOR,
                  fontSize:
                  AppDimensions.FONT_SIZE_14),
            )
                : const SizedBox.shrink(),
          ),
          const SizedBox(height: 5),
          GestureDetector(
            onTap: () {
              Get.toNamed(Routes.FORGOTPASSWORD);
            },
            child: Align(
                alignment: Alignment.centerRight,
                child: Text("Forgot Password?", style: TextStyles.mediumTextStyle(textColor: AppColors.pureBlackColorApp))),
          ),
          // sign up button ...
          const SizedBox(height: 35),
          CustomButtonWithoutIcon(
              text: 'Sign In',
              onPressed: () {
                if(loginFormKey.currentState!.validate()) {
                  controller.checkLogin(context);
                }
              },
              textVerticalPadding: 14),
          const SizedBox(height: 15),
          Center(child: MultiText(firstText: 'Don\'t have an account? ', secondText: 'Sign up here', style1: TextStyles.regularTextStyle(), style2: TextStyles.mediumTextStyle(textColor: AppColors.pureBlackColorApp), recognizer: TapGestureRecognizer()..onTap = () => Get.offNamed(Routes.SIGNUP))),
          const SizedBox(height: 15),
        ],
      ),
    );
  }
}







