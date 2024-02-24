import 'dart:convert';

import 'package:exclusive_access/features/Auth/Signup/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';
import 'package:get/get.dart';

import 'utils/prefs/preference_manager.dart';
import 'utils/prefs/prefs.dart';

class GlobalController extends GetxController {




  @override
  void onInit() {
    print("this is global controller");
    super.onInit();
  }



  changeNavigationColor(Color color) async {
    try {
      await FlutterStatusbarcolor.setNavigationBarColor(color, animate: true);
    } on PlatformException catch (e) {
      debugPrint(e.toString());
    }
  }


  // perfs
  User? user;
  String? token;
  Future initSessionUser() async {
    if(user!= null) {
      // User.fromJson(json)
    }
    String userString = PreferenceManager.instance.getString(Prefs.user);
    if (userString == '') return {};
    ///
    user = null;
    print("this is user value $user");
    Map<String, dynamic> userMap =
    jsonDecode(PreferenceManager.instance.getString(Prefs.user));

    user = User.fromJson(userMap);
    print("hahahhahahha");
    print(user!.email);
    print(user!.name);
    // print(user.user.mobile);
  }

  Future initToken() async {
    // String token = PreferenceManager.instance.getString(Prefs.token);
    if (token == '') return {};
    ///
    token =
    PreferenceManager.instance.getString(Prefs.token);
    print(token);
  }

  @override
  void dispose() {
    super.dispose();
  }
}