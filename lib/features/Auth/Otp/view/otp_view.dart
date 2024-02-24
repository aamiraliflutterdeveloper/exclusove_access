import 'package:exclusive_access/features/Auth/Otp/controller/otp_controller.dart';
import 'package:exclusive_access/features/Auth/Otp/view/components/otp_form.dart';
import 'package:exclusive_access/utils/constants/app_images.dart';
import 'package:exclusive_access/utils/global_widgets/custom_button_without_icon.dart';
import 'package:exclusive_access/utils/global_widgets/text_styles.dart';
import 'package:exclusive_access/utils/routes/routes.dart';
import 'package:exclusive_access/utils/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

class OtpView extends GetView<OTPController> {
  const OtpView({Key? key}) : super(key: key);

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
                      key: controller.otpFormKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 30),
                          Text("Phone Verification", style: TextStyles.boldTextStyle()),
                          const SizedBox(height: 5),
                          Text("Input the one time passcode sent to your Email", style: TextStyles.regularTextStyle()),
                          const SizedBox(height: 80),
                          Container(
                            alignment: Alignment.center,
                              child: Image.asset(AppImages.phone_v_icon)),
                          const SizedBox(height: 50),
                          otpFormComponent(),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Resend Code", style: TextStyles.mediumTextStyle()),
                              Countdown(
                                animation: StepTween(
                                  begin: controller.levelClock, // THIS IS A USER ENTERED NUMBER
                                  end: 0,
                                ).animate(controller.animationController),
                              ),
                            ],
                          ),
                          // continue button
                          const SizedBox(height: 50),
                          CustomButtonWithoutIcon(
                              text: 'Continue',
                              onPressed: () {
                                if(controller.pinController.length >=5) {
                                   controller.matchPin(context);
                                }
                                // controller.checkLogin();
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
        )
    );
  }
}

class Countdown extends AnimatedWidget {
  Countdown({Key? key, required this.animation}) : super(key: key, listenable: animation);
  Animation<int> animation;

  @override
  build(BuildContext context) {
    Duration clockTimer = Duration(seconds: animation.value);

    String timerText =
        '${clockTimer.inMinutes.remainder(60).toString()}:${clockTimer.inSeconds.remainder(60).toString().padLeft(2, '0')}';

    print('animation.value  ${animation.value} ');
    print('inMinutes ${clockTimer.inMinutes.toString()}');
    print('inSeconds ${clockTimer.inSeconds.toString()}');
    print('inSeconds.remainder ${clockTimer.inSeconds.remainder(60).toString()}');

    return Text(
      "$timerText",
      style: TextStyles.mediumTextStyle(),
    );
  }
}