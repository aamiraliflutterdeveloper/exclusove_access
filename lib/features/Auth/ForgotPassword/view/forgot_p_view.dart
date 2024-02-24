import 'package:exclusive_access/features/Auth/ForgotPassword/controller/forgot_p_controller.dart';
import 'package:exclusive_access/utils/constants/app_images.dart';
import 'package:exclusive_access/utils/fonts/app_dimensions.dart';
import 'package:exclusive_access/utils/global_widgets/custom_button_without_icon.dart';
import 'package:exclusive_access/utils/global_widgets/custom_text_field.dart';
import 'package:exclusive_access/utils/global_widgets/text_styles.dart';
import 'package:exclusive_access/utils/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPView extends GetView<ForgotPController> {
  const ForgotPView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.PURE_WHITE_COLOR,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Form(
                    key: controller.forgotPKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 30),
                        Text("Forgot Password", style: TextStyles.boldTextStyle()),
                        const SizedBox(height: 5),
                        Text("Please enter the account that you want to\nreset the password", style: TextStyles.regularTextStyle()),
                        const SizedBox(height: 80),
                        Container(
                          alignment: Alignment.center,
                            child: Image.asset(AppImages.forgot_p_icon)),
                        const SizedBox(height: 50),
                        const SizedBox(height: 2),
                        Text("Email", style: TextStyles.regularTextStyle()),
                        const SizedBox(height: 5),
                        CustomTextField(
                            borderColor: AppColors.greyColorApp,
                            hintText: 'Enter your Email',
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
                        const SizedBox(height: 20),
                        CustomButtonWithoutIcon(
                            text: 'Send',
                            onPressed: () {
                              controller.checkForgotPassword(context);
                            },
                            textVerticalPadding: 14),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}






