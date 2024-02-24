import 'package:exclusive_access/features/Dashboard/model/navbar_item_data.dart';
import 'package:exclusive_access/features/Dashboard/view/components/bottom_nav_bar_bottom_widget.dart';
import 'package:exclusive_access/utils/themes/app_colors.dart';
import 'package:flutter/material.dart';


class CustomBottomAppbar extends StatefulWidget {
  const CustomBottomAppbar({
    Key? key,
    required this.currentIndex,
    required this.onChanged,
  }) : super(key: key);
  final int currentIndex;
  final Function(int index) onChanged;

  @override
  State<CustomBottomAppbar> createState() => _CustomBottomAppbarState();
}

class _CustomBottomAppbarState extends State<CustomBottomAppbar> {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      elevation: 0,
      shape: const CircularNotchedRectangle(),
      color: Colors.transparent,
      child: Container(
        padding:  const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
        decoration: const BoxDecoration(
          color: AppColors.PURE_WHITE_COLOR,
          border: Border(
            top: BorderSide(width: 1.0, color: AppColors.lightGreyColor),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
            navBarItems.length,
                (index) => InkWell(
              splashColor: AppColors.lightGreyColor,
              radius: 30,
              onTap: () {
                widget.onChanged(index);
              },
              child: BottomNavBarItemWidget(
                image: navBarItems[index].image,
                enabled: widget.currentIndex == index,
                index: index,
              ),
            ),
          ),
        ),
      ),
    );
  }
}


