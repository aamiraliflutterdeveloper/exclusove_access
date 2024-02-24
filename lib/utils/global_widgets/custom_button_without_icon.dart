import 'package:exclusive_access/utils/constants/app_images.dart';
import 'package:exclusive_access/utils/fonts/app_dimensions.dart';
import 'package:exclusive_access/utils/global_widgets/text_styles.dart';
import 'package:exclusive_access/utils/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class CustomButtonWithoutIcon extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double textVerticalPadding;
  final double textHorizontalPadding;
  final Color textColor;
  final bool hasImage;
  final String? image;

  const CustomButtonWithoutIcon({Key? key, required this.text, required this.onPressed, this.textVerticalPadding = 0, this.textHorizontalPadding = 0, this.textColor = Colors.white, this.hasImage = false, this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: AppColors.PURE_BLACK_COLOR,
          shadowColor: Colors.white,
          // foregroundColor: Colors.red,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8), // <-- Radius
          ),
        ),
        onPressed: onPressed,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: textVerticalPadding, horizontal: textHorizontalPadding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if(hasImage == true) Image.asset(image!, height: 15),
              if(hasImage == true) const SizedBox(width: 10),
              Text(text, style: TextStyles.mediumTextStyle(textColor: textColor, fontSize: AppDimensions.FONT_SIZE_15)),
            ],
          ),
        ),
      ),
    );
  }
}

