// loading dialog
import 'dart:async';
import 'package:exclusive_access/utils/global_widgets/text_styles.dart';
import 'package:exclusive_access/utils/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


Future loadingDialog(BuildContext context) async{
  return showDialog(
      context: context,
      barrierColor: Colors.transparent,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return  MyLoading();
      });
}


class MyLoading extends StatelessWidget {
  const MyLoading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      height: 50,
      child: CircularProgressIndicator(
        backgroundColor: Colors.white,
        color: Colors.blue,
        strokeWidth: 5,
      ),
    );
  }
}


// BottomLoader customBottomLoader(BuildContext context) {
//   return BottomLoader(
//     context,
//     showLogs: false,
//     isDismissible: false,
//     shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(
//       topRight: Radius.circular(15),
//       topLeft: Radius.circular(15),
//     )),
//     loader: MyLoading()
//   );
// }


void openBottomSheet(String title) {
  Get.bottomSheet(
    Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 35),
                  Text("Please wait", style: TextStyles.boldTextStyle(textColor: AppColors.PURE_WHITE_COLOR)),
                  SizedBox(height: 5),
                  Text(title, style: TextStyles.mediumTextStyle(textColor: AppColors.PURE_WHITE_COLOR)),
                  SizedBox(height: 15),
                ],
              ),
              MyLoading(),
            ],
          ),
        ],
      ),
    ),
    isDismissible: false,
    backgroundColor: Colors.black,
    elevation: 0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15),
    ),
  );
}
