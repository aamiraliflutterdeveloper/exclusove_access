import 'package:exclusive_access/features/Settings/Support/controller/support_controller.dart';
import 'package:exclusive_access/features/Settings/Support/view/components/support_header.dart';
import 'package:exclusive_access/utils/fonts/app_dimensions.dart';
import 'package:exclusive_access/utils/global_widgets/custom_button_without_icon.dart';
import 'package:exclusive_access/utils/global_widgets/custom_text_field.dart';
import 'package:exclusive_access/utils/global_widgets/text_styles.dart';
import 'package:exclusive_access/utils/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SupportView extends GetView<SupportController> {
  const SupportView({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> supportKey = GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: AppColors.PURE_WHITE_COLOR,
      body: SafeArea(
        child: Form(
          key: supportKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              supportHeader(),
              const SizedBox(height: 35),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Support", style: TextStyles.mediumTextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
                        const SizedBox(height: 20),
                        Text("Name", style: TextStyles.regularTextStyle()),
                        const SizedBox(height: 5),
                        CustomTextField(
                          autoValidate: false,
                          borderColor: AppColors.greyColor,
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
                        const SizedBox(height: 2),
                        Text("Email", style: TextStyles.regularTextStyle()),
                        const SizedBox(height: 5),
                        CustomTextField(
                          autoValidate: false,
                          borderColor: AppColors.greyColor,
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
                                fontSize: AppDimensions.FONT_SIZE_14),
                          )
                              : const SizedBox.shrink(),
                        ),
                        const SizedBox(height: 2),
                        Text("Message", style: TextStyles.regularTextStyle()),
                        const SizedBox(height: 5),
                        CustomTextField(
                          autoValidate: false,
                          maxLines: 8,
                          minLines: 5,
                          keyBoardType: TextInputType.multiline,
                          borderColor: AppColors.greyColor,
                          hintText: 'Enter Message',
                          controller: controller.messageController,
                          validator: (value) {
                            controller.validateMessage(value!);
                            return null;
                          },
                        ),
                        Obx(
                              () => controller.messageError.isNotEmpty
                              ? Text(
                            controller.messageError.toString(),
                            style: const TextStyle(
                                color: AppColors.PURE_RED_COLOR,
                                fontSize: AppDimensions.FONT_SIZE_14),
                          )
                              : const SizedBox.shrink(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              // send button ...
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: CustomButtonWithoutIcon(
                    text: 'Send',
                    onPressed: () {
                      if(supportKey.currentState!.validate()) {
                        controller.checkSupport(context);
                      }
                    },
                    textVerticalPadding: 14),
              ),
              const SizedBox(height: 35),
            ],
          ),
        ),
      ),
    );
  }
}



