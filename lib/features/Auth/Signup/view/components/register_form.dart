import 'package:exclusive_access/features/Auth/Signup/controller/register_controller.dart';
import 'package:exclusive_access/global_controller.dart';
import 'package:exclusive_access/utils/fonts/app_dimensions.dart';
import 'package:exclusive_access/utils/globalKeys/global_keys.dart';
import 'package:exclusive_access/utils/global_widgets/app_text.dart';
import 'package:exclusive_access/utils/global_widgets/custom_button_without_icon.dart';
import 'package:exclusive_access/utils/global_widgets/custom_dropdown.dart';
import 'package:exclusive_access/utils/global_widgets/custom_text_field.dart';
import 'package:exclusive_access/utils/global_widgets/text_styles.dart';
import 'package:exclusive_access/utils/routes/routes.dart';
import 'package:exclusive_access/utils/themes/app_colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget registerForm(BuildContext context) {
  final controller = Get.find<RegisterController>();
  final globalController = Get.find<GlobalController>();

  return Form(
    key: GlobalKeys.registerKey,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // name text field
        Text("Name", style: TextStyles.regularTextStyle()),
        const SizedBox(height: 5),
        CustomTextField(
            borderColor: AppColors.greyColorApp,
            hintText: 'Enter Name',
            controller: controller.nameController,
            validator: (value) {
              controller.validateName(value!);
              return null;
            },
          ),
        Obx(
          () => controller.nameError.isNotEmpty
              ? Text(
                  controller.nameError.toString(),
                  style: const TextStyle(
                      color: AppColors.PURE_RED_COLOR,
                      fontSize: AppDimensions.FONT_SIZE_14),
                )
              : const SizedBox.shrink(),
        ),

        // age text field
        const SizedBox(height: 2),
        Text("Age", style: TextStyles.regularTextStyle()),
        const SizedBox(height: 5),
        CustomTextField(
            keyBoardType: TextInputType.number,
            borderColor: AppColors.greyColorApp,
            hintText: 'Enter Age',
            controller: controller.ageController,
            validator: (value) {
              controller.validateAge(value!);
              return null;
            },
          ),
        Obx(
          () => controller.ageError.isNotEmpty
              ? Text(
                  controller.ageError.toString(),
                  style: const TextStyle(
                      color: AppColors.PURE_RED_COLOR,
                      fontSize: AppDimensions.FONT_SIZE_14),
                )
              : const SizedBox.shrink(),
        ),
        // Gender field
        const SizedBox(height: 2),
        Text("Gender", style: TextStyles.regularTextStyle()),
        const SizedBox(height: 5),
        SizedBox(
          height: 48,
          child: registerDropdown(
              list: controller.gendersList,
              onSelected: (v) {
                controller.selectGender(v);
                controller.genderValidation = controller.selectedGender;
              },
              width: Get.width - 40,
              widget: Container(
                decoration: BoxDecoration(
                    color: AppColors.greyColor,
                    border: Border.all(width: 1, color: AppColors.greyColorApp),
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8),
                        bottomRight: Radius.circular(8),
                        bottomLeft: Radius.circular(8))),
                child: GetBuilder<RegisterController>(
                  builder: (ctx) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          controller.selectedGender.isNotEmpty
                              ? controller.selectedGender
                              : 'Select Gender',
                          style: TextStyles.regularTextStyle(
                              textColor: controller.selectedGender.isEmpty
                                  ? AppColors.darkGreyColor
                                  : AppColors.PURE_BLACK_COLOR,
                              fontSize: controller.selectedGender.isEmpty
                                  ? AppDimensions.FONT_SIZE_14
                                  : AppDimensions.FONT_SIZE_15),
                        ),
                        const SizedBox(width: 5),
                        const Icon(Icons.keyboard_arrow_down_sharp, size: 20, color: AppColors.PURE_BLACK_COLOR)
                      ],
                    ),
                  ),
                ),
              )),
        ),
        GetBuilder<RegisterController>(builder: (ctx) => controller.genderValidation.isEmpty
            ? Text(
          'Please select gender',
          style: const TextStyle(
              color: AppColors.PURE_RED_COLOR,
              fontSize: AppDimensions.FONT_SIZE_14),
        )
            : const SizedBox.shrink()),
        // phone number field
        const SizedBox(height: 2),
        Text("Phone Number", style: TextStyles.regularTextStyle()),
        const SizedBox(height: 5),
        CustomTextField(
            keyBoardType: TextInputType.number,
            borderColor: AppColors.greyColorApp,
            hintText: 'Phone number',
            controller: controller.phoneController,
            validator: (value) {
              controller.validatePhone(value!);
              return null;
            },
          ),
        Obx(
          () => controller.phoneError.isNotEmpty
              ? Text(
                  controller.phoneError.toString(),
                  style: const TextStyle(
                      color: AppColors.PURE_RED_COLOR,
                      fontSize: AppDimensions.FONT_SIZE_14),
                )
              : const SizedBox.shrink(),
        ),

        // email field
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

        // password field
        const SizedBox(height: 2),
        Text("Password", style: TextStyles.regularTextStyle()),
        const SizedBox(height: 5),
        CustomTextField(
            borderColor: AppColors.greyColorApp,
            hintText: 'Password',
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

        // location field
        const SizedBox(height: 2),
        Text("Location", style: TextStyles.regularTextStyle()),
        const SizedBox(height: 5),
        CustomTextField(
            borderColor: AppColors.greyColorApp,
            hintText: 'Enter Location',
            suffixIcon: Icons.location_on_outlined,
            controller: controller.locationController,
            validator: (value) {
              controller.validateLocation(value!);
              return null;
            },
          ),
        Obx(
              () => controller.locationError.isNotEmpty
              ? Text(
            controller.locationError.toString(),
            style: const TextStyle(
                color: AppColors.PURE_RED_COLOR,
                fontSize:
                AppDimensions.FONT_SIZE_14),
          )
              : const SizedBox.shrink(),
        ),

        // privacy policy line ...
        const SizedBox(height: 15),
        Row(
          children: [
            GetBuilder<RegisterController>(
              builder: (ctx) => Checkbox(
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                value: controller.privacyCheck,
                onChanged: (value) {
                    controller.acceptPrivacy(value!);
                },
              ),
            ),
            MultiText(firstText: 'I agree to the', secondText: ' Privacy & Policy', style1: TextStyles.regularTextStyle(), style2: TextStyles.mediumTextStyle(), recognizer: TapGestureRecognizer()..onTap = () => print('Tap Here onTap'))
          ],
        ),
        // sign up button ...
        const SizedBox(height: 10),
        CustomButtonWithoutIcon(
            text: 'Sign Up',
            onPressed: () {
              // controller.checkGender();
              if(GlobalKeys.registerKey.currentState!.validate()) {
                controller.checkRegister(context);
              }
            },
            textVerticalPadding: 14),
        const SizedBox(height: 15),
        Center(child: MultiText(firstText: 'Already have an account? ', secondText: 'Login Here', style1: TextStyles.regularTextStyle(), style2: TextStyles.mediumTextStyle(), recognizer: TapGestureRecognizer()..onTap = () => Get.offNamed(Routes.SIGNIN))),
        const SizedBox(height: 15),
      ],
    ),
  );
}





