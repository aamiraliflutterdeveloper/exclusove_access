import 'package:exclusive_access/features/Settings/controller/setting_controller.dart';
import 'package:exclusive_access/utils/constants/app_images.dart';
import 'package:exclusive_access/utils/dialogs/custom_dialog.dart';
import 'package:exclusive_access/utils/global_widgets/text_styles.dart';
import 'package:exclusive_access/utils/routes/routes.dart';
import 'package:exclusive_access/utils/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingView extends StatelessWidget {
  SettingView({Key? key}) : super(key: key);
  final controller = Get.put<SettingController>(SettingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Container(
            height: Get.height,
            width: Get.width,
            color: AppColors.mediumBlackColorApp.withOpacity(.9),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Align(
              alignment: Alignment.topCenter,
              child: Image.asset(AppImages.black_logo, color: AppColors.PURE_BLACK_COLOR.withOpacity(.4)),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              height: Get.height * .6,
              width: Get.width,
              decoration:  BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(25),
                  topLeft: Radius.circular(25),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: Offset(0, 10), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    Container(
                      alignment: Alignment.center,
                      child: Container(
                        height: 4,
                        width: 75,
                        color: AppColors.APPBAR_GREY_COLOR,
                      ),
                    ),
                    const SizedBox(height: 25),
                    Text("John Doe", style: TextStyles.regularTextStyle(fontWeight: FontWeight.w600, fontSize: 20)),
                    const SizedBox(height: 5),
                    Text("Johndoe@gmail.com", style: TextStyles.mediumTextStyle(fontWeight: FontWeight.normal)),
                    Text("0306-8215509", style: TextStyles.mediumTextStyle(fontWeight: FontWeight.normal)),
                    const SizedBox(height: 30),
                    GestureDetector(
                        onTap: () {
                          Get.toNamed(Routes.SUPPORT);
                        },
                        child: IconButton(image: AppImages.support_icon, title: 'Support')),
                    const SizedBox(height: 12),
                    GestureDetector(
                        onTap: () {
                          Get.toNamed(Routes.PRIVACY);
                        },
                        child: IconButton(image: AppImages.privacy_policy_icon, title: 'Privacy Policy')),
                    const SizedBox(height: 12),
                    GestureDetector(
                        onTap: () {
                          Get.toNamed(Routes.TERMSCONDITION);
                        },
                        child: IconButton(image: AppImages.terms_condition_icon, title: 'Terms and Conditions')),
                    const SizedBox(height: 12),
                    GestureDetector(
                        onTap: () {
                          CustomDialog.autoCloseDialog(context, 'Done', 'You have successfully\nDelete Account');
                        },
                        child: IconButton(image: AppImages.delete_icon, title: 'Delete Account')),
                    const SizedBox(height: 12),
                    GestureDetector(
                        onTap: () {
                          print("this is here inside");
                          controller.logout(context);
                          // CustomDialog.autoCloseDialog(context, 'Done', 'You have successfully\nLogout Account');
                        },child: IconButton(image: AppImages.sign_out_icon, title: 'Sign Out')),
                  ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class IconButton extends StatelessWidget {
  final String image;
  final String title;
  const IconButton({Key? key, required this.image, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipOval(
          child: Material(
            color: AppColors.lightGreyColorApp,
            child: InkWell(
              splashColor:
              AppColors.lightGreyColorApp.withOpacity(.6),
              onTap: () {},
              child: Container(
                  alignment: Alignment.center,
                  width: 40,
                  height: 40,
                  child: Image.asset(image, height: 15)),
            ),
          ),
        ),
        const SizedBox(width: 15),
        Text(title, style: TextStyles.mediumTextStyle(fontWeight: FontWeight.normal))
      ],
    );
  }
}





