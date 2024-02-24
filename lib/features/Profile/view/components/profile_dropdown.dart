import 'package:exclusive_access/features/Auth/Signup/controller/register_controller.dart';
import 'package:exclusive_access/features/Profile/controller/profile_controller.dart';
import 'package:exclusive_access/utils/global_widgets/text_styles.dart';
import 'package:exclusive_access/utils/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget profileDropDown({required List<String> list, required Widget widget, required PopupMenuItemSelected onSelected, required double width}) {
  final controller = Get.find<ProfileController>();
  return PopupMenuButton(
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(10.0),
      ),
    ),
    color: AppColors.PURE_WHITE_COLOR,
    offset: const Offset(0, 55),
    onSelected: onSelected,
    constraints: BoxConstraints(
        minWidth: width, maxWidth: width, maxHeight: 350),
    itemBuilder: (BuildContext bc) {
      return List.generate(
          list.length, (index) {
        return PopupMenuItem(
          padding:
          const EdgeInsets.symmetric(horizontal: 12),
          value: list[index],
          child: SizedBox(
            width: width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  list[index],
                  style: TextStyles.regularTextStyle(),
                ),
                Container(
                  height: 18,
                  width: 18,
                  decoration: BoxDecoration(
                    // color: Colors.black,
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(width: 1, color: AppColors.PURE_BLACK_COLOR)
                  ),
                  child: Container(
                    height: 14,
                    width: 14,
                    decoration: BoxDecoration(
                        color: controller.selectedGender == list[index] ? Colors.black : Colors.white,
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(width: 1, color: Colors.white)
                    ),
                  ),
                )
                // Text("123456", style: TextStyles.regularTextStyle(textColor: controller.selectedCountry == list[index] ? AppColors.APPBAR_GREY_COLOR : AppColors.BG_CARD_COLOR),)
              ],
            ),
          ),
        );
      });
    },
    child: widget,
  );
}







