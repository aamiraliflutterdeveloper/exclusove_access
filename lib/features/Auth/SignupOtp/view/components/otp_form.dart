import 'package:exclusive_access/features/Auth/Otp/controller/otp_controller.dart';
import 'package:exclusive_access/features/Auth/SignupOtp/controller/otp_controller.dart';
import 'package:exclusive_access/utils/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';

Widget otpSignUpFormComponent() {
  final controller = Get.find<SignUpOTPController>();
  const focusedBorderColor = AppColors.PURE_BLACK_COLOR;
  const borderColor = AppColors.PURE_BLACK_COLOR;
  final defaultPinTheme = PinTheme(
    width: 45,
    height: 45,
    textStyle: GoogleFonts.poppins(
      fontSize: 22,
      color: AppColors.PURE_WHITE_COLOR,
    ),
    decoration: BoxDecoration(
      color: AppColors.PURE_BLACK_COLOR,
      borderRadius: BorderRadius.circular(5),
      border: Border.all(color: borderColor),
    ),
  );
  return Directionality(
    // Specify direction if desired
    textDirection: TextDirection.ltr,
    child: Pinput(
      mainAxisAlignment: MainAxisAlignment.center,
      length: 5,
      controller: controller.pinController,
      focusNode: controller.focusNode,
      androidSmsAutofillMethod:
      AndroidSmsAutofillMethod.smsUserConsentApi,
      listenForMultipleSmsOnAndroid: true,
      defaultPinTheme: PinTheme(
        width: 45,
        height: 45,
        textStyle: GoogleFonts.poppins(
          fontSize: 22,
          color: AppColors.PURE_BLACK_COLOR,
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: AppColors.lightGreyColor),
            color: AppColors.PURE_BLACK_COLOR
        ),
      ),
      validator: (value) {
        // return value == '2222' ? null : 'Pin is incorrect';
      },
      hapticFeedbackType: HapticFeedbackType.lightImpact,
      onCompleted: (pin) {
        debugPrint('onCompleted: $pin');
      },
      onChanged: (value) {
        debugPrint('onChanged: $value');
      },
      cursor: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            // margin: const EdgeInsets.only(bottom: 9),
            width: 1,
            height: 40,
            color: AppColors.BG_CARD_COLOR,
          ),
        ],
      ),
      focusedPinTheme: defaultPinTheme.copyWith(
        decoration: defaultPinTheme.decoration!.copyWith(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: focusedBorderColor),
        ),
      ),
      submittedPinTheme: defaultPinTheme.copyWith(
        decoration: defaultPinTheme.decoration!.copyWith(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: focusedBorderColor),
        ),
      ),
      errorPinTheme: defaultPinTheme.copyBorderWith(
        border: Border.all(color: Colors.redAccent),
      ),
    ),
  );

}





