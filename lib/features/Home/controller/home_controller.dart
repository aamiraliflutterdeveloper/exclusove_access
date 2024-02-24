import 'dart:convert';

import 'package:exclusive_access/ApiManager/api_manager.dart';
import 'package:exclusive_access/features/Home/model/upcoming_events_model.dart';
import 'package:exclusive_access/global_controller.dart';
import 'package:exclusive_access/utils/constants/api_constants.dart';
import 'package:exclusive_access/utils/global_widgets/custom_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {

  final globalController = Get.find<GlobalController>();
  late TextEditingController searchController;

  bool isLoading = false;
  UpcomingEventsModel? upcomingEventsModel;

  @override
  void onInit() {
    print("this controller is initialized");
    searchController = TextEditingController();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      upcomingEvents(Get.context as BuildContext);
    });
    super.onInit();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }


  // match pin method ...
  upcomingEvents(BuildContext context) async{
    print("hahahah");
    // loadingDialog(context);
    // openBottomSheet('Changing Password ...!');
    isLoading = true;
    print("starting point of otp");
    await ApiManager().requestAPi(
        ApiConstant.up_coming_event,
        method: APIMethod.post,
      token: globalController.token,
    ).then((value) {
      if(value['status'] == 200) {
        print("success");
        print(value["message"]);
        
        upcomingEventsModel = UpcomingEventsModel.fromJson(value);
        print(upcomingEventsModel);
        isLoading = false;
        update();
        // customToast(context, value['message']);
      } else {
        print("failure");
        isLoading = false;
        update();
        // Get.back();
        customToast(context, value['message']);
      }
    });
  }
  List<UpcomingEvents> lists = [];
  // match pin method ...
  Future<List<UpcomingEvents>> searchEvents(BuildContext context, String title) async{
    print("hahahah");
    // loadingDialog(context);
    // openBottomSheet('Changing Password ...!');
    isLoading = true;
    Map<String, dynamic> data = {'name': title};
    await ApiManager().requestAPi(
      ApiConstant.event_search,
      method: APIMethod.post,
      token: globalController.token,
      data: data,
    ).then((value) {
      if(value['status'] == 200) {
        print("success");
        print(value["message"]);
        upcomingEventsModel = UpcomingEventsModel.fromJson(value);
        print(upcomingEventsModel);
        isLoading = false;
        update();
        return lists;
        // customToast(context, value['message']);
      } else {
        print("failure");
        isLoading = false;
        update();
        // Get.back();
        customToast(context, value['message']);
        // return lists;
      }

    });
    return lists;
  }



}