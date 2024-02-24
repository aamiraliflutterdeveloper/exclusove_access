import 'package:exclusive_access/features/Home/AddCard/controller/add_card_controller.dart';
import 'package:exclusive_access/utils/constants/app_images.dart';
import 'package:exclusive_access/utils/fonts/app_dimensions.dart';
import 'package:exclusive_access/utils/global_widgets/custom_button_without_icon.dart';
import 'package:exclusive_access/utils/global_widgets/custom_text_field.dart';
import 'package:exclusive_access/utils/global_widgets/scroll_behavior.dart';
import 'package:exclusive_access/utils/global_widgets/text_styles.dart';
import 'package:exclusive_access/utils/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class AddCardView extends GetView<AddCardController> {
  const AddCardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.PURE_WHITE_COLOR,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ScrollConfiguration(
                behavior: MyBehavior(),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 15),
                      GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: Image.asset(AppImages.back_icon, height: 17),
                        ),
                      ),
                      const SizedBox(height: 15),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: Text("Add Card", style: TextStyles.mediumTextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
                      ),
                      const SizedBox(height: 15),
                      Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.asset(
                              AppImages.card_image,
                              width: Get.width,
                              height: 180.0,
                              fit: BoxFit.fill,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 25),
                            alignment: Alignment.centerLeft,
                            height: 180,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Total Amount", style: TextStyles.regularTextStyle(textColor: Color(0xFFF1F1F1))),
                                    Text("\$3,899", style: TextStyles.mediumTextStyle(fontWeight: FontWeight.w600, fontSize: 15, textColor: AppColors.PURE_WHITE_COLOR))
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Card Number", style: TextStyles.regularTextStyle(textColor: Color(0xFFF1F1F1))),
                                    Text("XXXX XXXX XXXX XXXX", style: TextStyles.mediumTextStyle(fontWeight: FontWeight.w600, fontSize: 15, textColor: AppColors.PURE_WHITE_COLOR))
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("Expiry", style: TextStyles.regularTextStyle(textColor: Color(0xFFF1F1F1))),
                                        Text("01 / 16", style: TextStyles.mediumTextStyle(fontWeight: FontWeight.w600, fontSize: 15, textColor: AppColors.PURE_WHITE_COLOR))
                                      ],
                                    ),
                                    Image.asset(AppImages.paypal, height: 30, width: 100, fit: BoxFit.cover),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // email field
                            const SizedBox(height: 2),
                            Text("CardHolder Name", style: TextStyles.regularTextStyle()),
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
                                    fontSize:
                                    AppDimensions.FONT_SIZE_14),
                              )
                                  : const SizedBox.shrink(),
                            ),

                            // Expiry Date and CVV ...
                            const SizedBox(height: 2),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Flexible(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(height: 2),
                                      Text("Card Number", style: TextStyles.regularTextStyle()),
                                      const SizedBox(height: 5),
                                      CustomTextField(
                                        borderColor: AppColors.greyColorApp,
                                        hintText: 'Enter Card Number',
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
                                              fontSize:
                                              AppDimensions.FONT_SIZE_14),
                                        )
                                            : const SizedBox.shrink(),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(width: 10),
                                Flexible(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(height: 2),
                                      Text("Card Number", style: TextStyles.regularTextStyle()),
                                      const SizedBox(height: 5),
                                      CustomTextField(
                                        borderColor: AppColors.greyColorApp,
                                        hintText: 'Enter Card Number',
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
                                              fontSize:
                                              AppDimensions.FONT_SIZE_14),
                                        )
                                            : const SizedBox.shrink(),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),

                            // Card Number Filed
                            const SizedBox(height: 2),
                            Text("Card Number", style: TextStyles.regularTextStyle()),
                            const SizedBox(height: 5),
                            CustomTextField(
                              borderColor: AppColors.greyColorApp,
                              hintText: 'Enter Card Number',
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
                                    fontSize:
                                    AppDimensions.FONT_SIZE_14),
                              )
                                  : const SizedBox.shrink(),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 30),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: CustomButtonWithoutIcon(
                            text: 'Pay Now',
                            onPressed: () {
                              // Get.toNamed(Routes.CARTDETAIL);
                            },
                            textVerticalPadding: 14),
                      ),
                      const SizedBox(height: 25),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
