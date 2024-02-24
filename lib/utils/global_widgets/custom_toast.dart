import 'package:exclusive_access/utils/global_widgets/text_styles.dart';
import 'package:exclusive_access/utils/themes/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

customToast(BuildContext context, String message) {
  showToast(message,
    context: context,
    backgroundColor: AppColors.PURE_BLACK_COLOR,
    textStyle: TextStyles.regularTextStyle(textColor: AppColors.PURE_WHITE_COLOR),
    textAlign: TextAlign.center,
    dismissOtherToast: true,
    animation: StyledToastAnimation.scale,
    reverseAnimation: StyledToastAnimation.fade,
    position: StyledToastPosition.top,
    animDuration: Duration(milliseconds: 250),
    duration: Duration(seconds: 3),
    curve: Curves.elasticOut,
    reverseCurve: Curves.linear,
    shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100))
  );

}






