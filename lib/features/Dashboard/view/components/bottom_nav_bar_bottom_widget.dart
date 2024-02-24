import 'package:exclusive_access/utils/themes/app_colors.dart';
import 'package:flutter/material.dart';

class BottomNavBarItemWidget extends StatelessWidget {
  const BottomNavBarItemWidget({
    Key? key,
    required this.image,
    required this.enabled,
    required this.index,
  }) : super(key: key);

  final String image;
  final int index;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kToolbarHeight + 4,
      decoration: const BoxDecoration(shape: BoxShape.circle),
      padding: const EdgeInsets.all(5),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Image.asset(
            image,
            color:
            enabled ? AppColors.PURE_BLACK_COLOR : const Color(0xff888888),
            height: 15,
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
