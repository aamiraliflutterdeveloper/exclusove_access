import 'package:exclusive_access/features/Auth/ChangePassword/controller/change_p_controller.dart';
import 'package:exclusive_access/utils/fonts/app_dimensions.dart';
import 'package:exclusive_access/utils/global_widgets/custom_button_without_icon.dart';
import 'package:exclusive_access/utils/global_widgets/custom_text_field.dart';
import 'package:exclusive_access/utils/global_widgets/text_styles.dart';
import 'package:exclusive_access/utils/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ChangePView extends GetView<ChangePController> {
  const ChangePView({Key? key}) : super(key: key);

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
                    key: controller.nPasswordFormKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 30),
                        Text("Change Password", style: TextStyles.boldTextStyle(fontSize: 22)),
                        const SizedBox(height: 5),
                        Text("Please reset your password", style: TextStyles.regularTextStyle()),
                        const SizedBox(height: 80),
                        const SizedBox(height: 50),
                        const SizedBox(height: 2),
                        Text("Password", style: TextStyles.regularTextStyle()),
                        const SizedBox(height: 5),
                        CustomTextField(
                            borderColor: AppColors.greyColorApp,
                            hintText: 'New Password',
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
                        // confirm password
                        const SizedBox(height: 5),
                        Text("Confirm Password", style: TextStyles.regularTextStyle()),
                        const SizedBox(height: 5),
                        CustomTextField(
                            borderColor: AppColors.greyColorApp,
                            hintText: 'Confirm Password',
                            controller: controller.cPasswordController,
                            validator: (value) {
                              controller.cValidatePassword(value!);
                              return null;
                            },
                          ),
                        Obx(
                              () => controller.cPasswordError.isNotEmpty
                              ? Text(
                                controller.cPasswordError.toString(),
                                style: const TextStyle(
                                    color: AppColors.PURE_RED_COLOR,
                                    fontSize:
                                    AppDimensions.FONT_SIZE_14),
                              )
                              : const SizedBox.shrink(),
                        ),
                        const SizedBox(height: 50),
                        CustomButtonWithoutIcon(
                            text: 'Change Password',
                            onPressed: () {
                              controller.changePassword(context);
                              // controller.checkForgotPassword();
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
