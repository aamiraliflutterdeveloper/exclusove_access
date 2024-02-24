import 'package:exclusive_access/features/Profile/controller/profile_controller.dart';
import 'package:exclusive_access/features/Profile/view/components/profile_dropdown.dart';
import 'package:exclusive_access/features/Profile/view/components/profile_header.dart';
import 'package:exclusive_access/global_controller.dart';
import 'package:exclusive_access/utils/constants/app_images.dart';
import 'package:exclusive_access/utils/fonts/app_dimensions.dart';
import 'package:exclusive_access/utils/global_widgets/custom_button_without_icon.dart';
import 'package:exclusive_access/utils/global_widgets/custom_text_field.dart';
import 'package:exclusive_access/utils/global_widgets/text_styles.dart';
import 'package:exclusive_access/utils/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ProfileView extends StatelessWidget {
   ProfileView({Key? key}) : super(key: key);

  final GlobalKey<FormState> profileFormKey = GlobalKey<FormState>();
  final globalController = Get.find<GlobalController>();

  @override
  Widget build(BuildContext context) {

    final ProfileController controller = Get.put(ProfileController());
    return Scaffold(
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTap: () {
          print("this is user token ");
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              const SizedBox(height: 20),
              profileHeader(),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Profile", style: TextStyles.mediumTextStyle(fontWeight: FontWeight.w600, fontSize: 20)),
                   GetBuilder<ProfileController>(
                    builder: (controller) {
                      return controller.profileUpdate == false ? GestureDetector(
                          onTap: () {
                            controller.updateProfile();
                          },
                          child: Image.asset(AppImages.edit_icon, height: 20)) : SizedBox.shrink();
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    color: AppColors.PURE_WHITE_COLOR,
                    child: Column(
                      children: [
                        Form(
                          key: profileFormKey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // name text field ...
                              Text("Name", style: TextStyles.regularTextStyle()),
                              const SizedBox(height: 5),
                              GetBuilder<ProfileController>(
                                builder: (ctx) => CustomTextField(
                                  readOnly: controller.profileUpdate == false ? true : false,
                                  borderColor: AppColors.greyColor,
                                  hintText: 'Enter Name',
                                  controller: controller.nameController,
                                  validator: (value) {
                                    controller.validateName(value!);
                                    return null;
                                  },
                                ),
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
                              GetBuilder<ProfileController>(
                                builder: (ctx) => CustomTextField(
                                  readOnly: controller.profileUpdate == false ? true : false,
                                  keyBoardType: TextInputType.number,
                                  borderColor: AppColors.greyColor,
                                  hintText: 'Enter Age',
                                  controller: controller.ageController,
                                  validator: (value) {
                                    controller.validateAge(value!);
                                    return null;
                                  },
                                ),
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
                              const SizedBox(height: 2),
                              Text("Gender", style: TextStyles.regularTextStyle()),
                              const SizedBox(height: 5),
                              GetBuilder<ProfileController>(
                                builder: (ctx) {
                                  if(controller.profileUpdate == false) {
                                    return CustomTextField(
                                      readOnly: controller.profileUpdate == false ? true : false,
                                      keyBoardType: TextInputType.number,
                                      borderColor: AppColors.greyColor,
                                      hintText: controller.selectedGender,
                                      controller: controller.genderController,
                                      validator: (value) {
                                        controller.validateAge(value!);
                                        return null;
                                      },
                                    );
                                  } else {
                                    return SizedBox(
                                      height: 48,
                                      child: profileDropDown(
                                          list: controller.gendersList,
                                          onSelected: (v) {
                                            controller.selectGender(v);
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
                                            child: GetBuilder<ProfileController>(
                                              builder: (ctx) => Padding(
                                                padding: const EdgeInsets.symmetric(horizontal: 9.0),
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsets.only(bottom: 2.0),
                                                      child: Text(
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
                                                    ),
                                                    const SizedBox(width: 5),
                                                    const Icon(Icons.keyboard_arrow_down_sharp, size: 20, color: AppColors.PURE_BLACK_COLOR)
                                                  ],
                                                ),
                                              ),
                                            ),
                                          )),
                                    );
                                  }
                                },
                              ),

                              const SizedBox(height: 2),
                              Text("Phone Number", style: TextStyles.regularTextStyle()),
                              const SizedBox(height: 5),
                              GetBuilder<ProfileController>(
                                builder: (ctx) => CustomTextField(
                                  readOnly: controller.profileUpdate == false ? true : false,
                                  keyBoardType: TextInputType.number,
                                  borderColor: AppColors.greyColor,
                                  hintText: 'Phone number',
                                  controller: controller.phoneController,
                                  validator: (value) {
                                    controller.validatePhone(value!);
                                    return null;
                                  },
                                ),
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
                              GetBuilder<ProfileController>(
                                builder: (ctx) => CustomTextField(
                                  readOnly: controller.profileUpdate == false ? true : false,
                                  borderColor: AppColors.greyColor,
                                  hintText: 'Enter your Email',
                                  controller: controller.emailController,
                                  validator: (value) {
                                    controller.validateEmail(value!);
                                    return null;
                                  },
                                ),
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
                              GetBuilder<ProfileController>(
                                builder: (ctx) => CustomTextField(
                                  readOnly: controller.profileUpdate == false ? true : false,
                                  borderColor: AppColors.greyColor,
                                  hintText: 'Enter Location',
                                  suffixIcon: Icons.location_on_outlined,
                                  controller: controller.locationController,
                                  validator: (value) {
                                    controller.validateLocation(value!);
                                    return null;
                                  },
                                ),
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
                              // sign up button ...
                              const SizedBox(height: 10),
                           GetBuilder<ProfileController>(
                            builder: (controller) {
                              return controller.profileUpdate == true ? CustomButtonWithoutIcon(
                                  text: 'Update',
                                  onPressed: () {
                                    controller.checkProfile(context);
                                  },
                                  textVerticalPadding: 14) : SizedBox.shrink();
                            },
                          ),
                              const SizedBox(height: 15),
                            ],
                          ),
                        ),
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





