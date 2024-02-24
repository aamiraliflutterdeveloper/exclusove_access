import 'package:exclusive_access/features/Home/bindings/home_bindings.dart';
import 'package:exclusive_access/features/Home/view/home_view.dart';
import 'package:exclusive_access/features/Profile/bindings/profile_bindings.dart';
import 'package:exclusive_access/features/Profile/view/profile_view.dart';
import 'package:exclusive_access/features/Settings/bindings/setting_bindings.dart';
import 'package:exclusive_access/features/Settings/view/setting_view.dart';
import 'package:exclusive_access/features/Ticket/bindings/ticket_binding.dart';
import 'package:exclusive_access/features/Ticket/view/ticket_view.dart';
import 'package:exclusive_access/utils/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {

  int selectedIndex = 0;
  final pages = <String>[Routes.HOME, Routes.TICKET, Routes.PROFILE, Routes.SETTING];
  void changeIndex(int index) {
    if (selectedIndex == index) {
      return;
    }
      Get.offNamed(pages[index], id: 1);
      selectedIndex = index;
    update();
  }

  Route? onGenerateRoute(RouteSettings settings) {
    if (settings.name == Routes.HOME)
      return GetPageRoute(
        settings: settings,
        page: () => HomeView(),
        binding: HomeBindings(),
      );

    if (settings.name == Routes.TICKET)
      return GetPageRoute(
        settings: settings,
        page: () => TicketView(),
        binding: TicketBinding(),
      );

    if (settings.name == Routes.PROFILE)
      return GetPageRoute(
        settings: settings,
        page: () => ProfileView(),
        binding: ProfileBindings(),
      );

    if (settings.name == Routes.SETTING)
      return GetPageRoute(
        settings: settings,
        page: () => SettingView(),
        binding: SettingBindings(),
      );
    return null;
  }

  @override
  void onInit() {
    super.onInit();
      // Get.offNamed(pages[0]);
  }

}