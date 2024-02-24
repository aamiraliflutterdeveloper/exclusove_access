import 'package:exclusive_access/features/Dashboard/controller/dashboard_controller.dart';
import 'package:exclusive_access/features/Dashboard/view/components/custom_bottom_appbar.dart';
import 'package:exclusive_access/features/Home/view/home_view.dart';
import 'package:exclusive_access/features/Profile/bindings/profile_bindings.dart';
import 'package:exclusive_access/features/Profile/view/profile_view.dart';
import 'package:exclusive_access/features/Settings/view/setting_view.dart';
import 'package:exclusive_access/features/Ticket/bindings/ticket_binding.dart';
import 'package:exclusive_access/features/Ticket/view/ticket_view.dart';
import 'package:exclusive_access/main.dart';
import 'package:exclusive_access/utils/routes/routes.dart';
import 'package:exclusive_access/utils/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({Key? key}) : super(key: key);

  Widget getCurrentScreen(int index) {
    Widget widget = Container();
    switch (index) {
      case 0:
        widget =  HomeView();
        break;
      case 1:
        widget = const TicketView();
        break;
      case 2:
        widget = ProfileView();
        break;
      case 3:
        widget = SettingView();
        break;
    }
    return widget;
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.PURE_WHITE_COLOR,
      extendBody: true,
      bottomNavigationBar: GetBuilder<DashboardController>(
        builder: (ctx) => CustomBottomAppbar(
          currentIndex: controller.selectedIndex,
          onChanged: (int index) {
            controller.changeIndex(index);
          },
        ),
      ),
      body: SafeArea(
        child: Navigator(
            key: Get.nestedKey(1),
            initialRoute: Routes.HOME,
            onGenerateRoute: controller.onGenerateRoute,
          ),
      )
      // body: SafeArea(
      //   child: GetBuilder<DashboardController>(
      //     builder: (ctx) => getCurrentScreen(controller.selectedIndex),
      //   ),
      // ),
    );
  }




}







