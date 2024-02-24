import 'package:exclusive_access/features/Home/ExclusiveDetail/controller/exclusive_controller.dart';
import 'package:exclusive_access/features/Home/ExclusiveDetail/view/components/exclusive_detail_header.dart';
import 'package:exclusive_access/utils/constants/app_images.dart';
import 'package:exclusive_access/utils/global_widgets/custom_button_with_border.dart';
import 'package:exclusive_access/utils/global_widgets/custom_button_without_icon.dart';
import 'package:exclusive_access/utils/global_widgets/scroll_behavior.dart';
import 'package:exclusive_access/utils/global_widgets/text_styles.dart';
import 'package:exclusive_access/utils/routes/routes.dart';
import 'package:exclusive_access/utils/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartDetailView extends GetView<ExclusiveController> {
  const CartDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ScrollConfiguration(
                behavior: MyBehavior(),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      exclusiveDetailHeader(),
                      const SizedBox(height: 20),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Exclusive Access", style: TextStyles.mediumTextStyle(fontWeight: FontWeight.w600)),
                                    Text("Lahore Pakistan", style: TextStyles.regularTextStyle())
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 40,
                                  width: 80,
                                  decoration: BoxDecoration(
                                    color: AppColors.PURE_BLACK_COLOR,
                                    borderRadius: BorderRadius.circular(60),
                                  ),
                                  child: Text('\$400', style: TextStyles.regularTextStyle(textColor: AppColors.PURE_WHITE_COLOR)),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: dataTable(title: 'Date', subTitle: '10 December'),
                                ),
                                Expanded(
                                  child: dataTable(title: 'Time', subTitle: '10:00 pm'),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: dataTable(title: 'Men', subTitle: '10'),
                                ),
                                Expanded(
                                  child: dataTable(title: 'Women', subTitle: '29'),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15.0),
                            child: dataTable(title: 'Event Description', subTitle: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. '),
                          ),
                          const SizedBox(height: 20),
                          Container(
                            height: 2,
                            width: Get.width,
                            color: AppColors.greyColor,
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  controller.removeItem();
                                },
                                child: const CircleAvatar(
                                  radius: 15,
                                  backgroundColor: Color(0xFFC1C1C1),
                                  child: CircleAvatar(
                                    backgroundColor: AppColors.PURE_WHITE_COLOR,
                                    radius: 13,
                                    child: Text("−", style: TextStyle(fontSize: 23, color: AppColors.PURE_BLACK_COLOR)),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              GetBuilder<ExclusiveController>(
                                builder: (ctx) => CircleAvatar(
                                  radius: 15,
                                  backgroundColor: const Color(0xFFC1C1C1),
                                  child: CircleAvatar(
                                    backgroundColor: AppColors.PURE_WHITE_COLOR,
                                    radius: 13,
                                    child: Text(controller.currentItem.toString(), style: const TextStyle(fontSize: 17, color: AppColors.PURE_BLACK_COLOR)),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              GestureDetector(
                                onTap: () {
                                  controller.addItem();
                                },
                                child: const CircleAvatar(
                                  radius: 15,
                                  backgroundColor: Color(0xFFC1C1C1),
                                  child: CircleAvatar(
                                    backgroundColor: AppColors.PURE_WHITE_COLOR,
                                    radius: 13,
                                    child: Text("+", style: TextStyle(fontSize: 17, color: AppColors.PURE_BLACK_COLOR)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15.0),
                            child: CustomButtonWithoutIcon(
                                text: 'Pay Now',
                                onPressed: () {
                                  bottomSheet(context);
                                  // Get.toNamed(Routes.CARTDETAIL);
                                },
                                textVerticalPadding: 14),
                          ),
                          const SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15.0),
                            child: CustomButtonWithBorder(
                                text: 'Guest List',
                                onPressed: () {
                                  // Get.toNamed(Routes.CARTDETAIL);
                                },
                                textVerticalPadding: 14),
                          ),
                          const SizedBox(height: 20),
                        ],
                      )
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



void bottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    // color is applied to main screen when modal bottom screen is displayed
    barrierColor: Colors.grey.withOpacity(.5),
    //background color for modal bottom screen
    backgroundColor: AppColors.PURE_WHITE_COLOR,
    //elevates modal bottom screen
    elevation: 10,
    // gives rounded corner to modal bottom screen
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15.0),
    ),
    builder: (BuildContext context) {
      // UDE : SizedBox instead of Container for whitespaces
      return SizedBox(
        height: 220,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 30),
              Text('Choose Payment Method', style: TextStyles.mediumTextStyle(fontWeight: FontWeight.w600, fontSize: 20)),
              const SizedBox(height: 10),
              Text('Total: \$140', style: TextStyles.mediumTextStyle(fontWeight: FontWeight.w500)),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: CustomButtonWithoutIcon(
                  hasImage: true,
                  image: AppImages.apple,
                    text: 'Pay',
                    onPressed: () {
                      // Get.toNamed(Routes.CARTDETAIL);
                    },
                    textVerticalPadding: 14),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: CustomButtonWithBorder(
                  hasImage: true,
                    image: AppImages.debit_card,
                    text: 'Pay With Card',
                    onPressed: () {
                      Get.toNamed(Routes.ADDCARD);
                    },
                    textVerticalPadding: 14),
              ),
              //
            ],
          ),
        ),
      );
    },
  );
}


Widget dataTable({required String title, required String subTitle}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(title, style: TextStyles.mediumTextStyle(fontWeight: FontWeight.w600)),
      Text(subTitle, style: TextStyles.regularTextStyle()),
    ],);
}






