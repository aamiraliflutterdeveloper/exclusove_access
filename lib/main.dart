import 'package:exclusive_access/global_controller.dart';
import 'package:exclusive_access/utils/constants/const_strings.dart';
import 'package:exclusive_access/utils/prefs/preference_manager.dart';
import 'package:exclusive_access/utils/routes/app_routes.dart';
import 'package:exclusive_access/utils/routes/routes.dart';
import 'package:exclusive_access/utils/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  GlobalController controller = Get.put<GlobalController>(GlobalController(), permanent: true);
  await PreferenceManager.instance.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: ConstStrings.appName,
      theme: lightTheme,
      initialRoute: Routes.SPLASH,
      defaultTransition: Transition.fade,
      getPages: AppRoutes.appRoutes,
      debugShowCheckedModeBanner: false,
    );
  }
}


