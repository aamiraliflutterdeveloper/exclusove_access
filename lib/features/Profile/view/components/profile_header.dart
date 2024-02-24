import 'package:exclusive_access/utils/constants/app_images.dart';
import 'package:flutter/cupertino.dart';

Widget profileHeader() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(),
        Container(
          padding: const EdgeInsets.only(left: 0),
          child: Image.asset(AppImages.black_logo, height: 35),
        ),
        Container(),
      ],
    ),
  );
}




