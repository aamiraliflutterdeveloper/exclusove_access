import 'package:exclusive_access/utils/fonts/app_dimensions.dart';
import 'package:exclusive_access/utils/global_widgets/text_styles.dart';
import 'package:exclusive_access/utils/themes/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final IconData? suffixIcon;
  final FormFieldValidator<String> validator;
  final TextEditingController? controller;
  final Color borderColor;
  final double borderRadius;
  final bool readOnly;
  final bool obscureText;
  final TextInputType keyBoardType;
  final GestureTapCallback? onSuffixTap;
  final int minLines;
  final int maxLines;
  final bool autoValidate;

  const CustomTextField({Key? key, required this.hintText, this.suffixIcon, required this.validator, this.controller, required this.borderColor, this.borderRadius = 7.0, this.readOnly = false, this.obscureText = false, this.onSuffixTap, this.keyBoardType = TextInputType.text, this.minLines = 1, this.maxLines = 1, this.autoValidate = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        minLines: minLines,
        maxLines: maxLines,
        readOnly: readOnly,
        keyboardType: keyBoardType,
        controller: controller,
        validator: validator,
        obscureText: obscureText,
        autovalidateMode: autoValidate == true ? AutovalidateMode.onUserInteraction : AutovalidateMode.disabled,
        style: TextStyles.regularTextStyle(fontSize: 15.0, textColor: AppColors.PURE_BLACK_COLOR),
        decoration: InputDecoration(
          suffixIconConstraints: const BoxConstraints(
              minHeight: 24,
              minWidth: 24
          ),
          filled: true,
          contentPadding: const EdgeInsets.only(left: 10, bottom: 14, top: 14),
          fillColor: AppColors.greyColorApp,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
            // borderSide: BorderSide(width: 1,color: AppColors.lightGreyColor),
            borderSide: BorderSide(width: 1,color: borderColor),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
            borderSide: BorderSide(width: 1,color: borderColor),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
            borderSide: BorderSide(width: 1,color: borderColor),
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
              borderSide: BorderSide(width: 1, color: borderColor)
          ),
          errorBorder:  OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
              borderSide: BorderSide(width: 1,color: borderColor)
          ),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
              borderSide: BorderSide(width: 1,color: borderColor)
          ),
          hintText: hintText,
          hintStyle: const TextStyle(color: AppColors.darkGreyColor, fontSize: AppDimensions.FONT_SIZE_14),
          suffixIcon: suffixIcon != null ? Padding(
            padding: const EdgeInsets.only(top: 0.0),
            child: GestureDetector(
                onTap: onSuffixTap,
                child: Container(
                    margin: const EdgeInsets.only(right: 10),
                    height: 20,
                    width: 20,
                    child: Icon(suffixIcon, color: AppColors.pureBlackColorApp))),
          ) : const SizedBox.shrink(),
        ),
      ),
    );
  }
}









// import 'package:flutter/material.dart';
// import 'package:siriuslink/Utils/Themes/app_colors.dart';
//
// class CustomTextField extends StatelessWidget {
//   final String hintText;
//   final String? suffixIcon;
//   final FormFieldValidator<String> validator;
//   final TextEditingController controller;
//   final Color borderColor;
//   const CustomTextField({
//     Key? key,
//     required this.hintText,
//     this.suffixIcon,
//     required this.validator,
//     required this.controller,
//     this.borderColor = AppColors.lightGreyColor,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.only(top: 0, left: 5, right: 5, bottom: 5),
//       decoration: BoxDecoration(
//         border: Border.all(width: 1, color: borderColor),
//        borderRadius: BorderRadius.circular(8),
//         color: AppColors.lightestGreyColor,
//       ),
//       child: TextFormField(
//         autocorrect: false,
//         enableSuggestions: false,
//         autofocus: false,
//         // autovalidateMode: AutovalidateMode.onUserInteraction,
//         validator: validator,
//         controller: controller,
//         style: const TextStyle(fontSize: 15.0, color: AppColors.PURE_BLACK_COLOR),
//         decoration: InputDecoration(
//           filled: true,
//           isDense: true,
//           fillColor: AppColors.lightestGreyColor,
//           hintText: hintText,
//           suffixIcon: suffixIcon != null ? Padding(
//             padding: const EdgeInsets.only(top: 8.0),
//             child: Image.asset(suffixIcon!, height: 10, width: 10),
//           ) : const SizedBox.shrink(),
//           hintStyle: const TextStyle(color: AppColors.darkGreyColor, fontSize: 14),
//           contentPadding: const EdgeInsets.fromLTRB(10.0, 18, 0, 10.0),
//           border: InputBorder.none,
//         ),
//       ),
//     );
//   }
// }