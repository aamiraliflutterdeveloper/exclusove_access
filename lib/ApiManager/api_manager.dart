// ignore_for_file: avoid_print, prefer_typing_uninitialized_variables
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:exclusive_access/utils/app_button.dart';
import 'package:exclusive_access/utils/constants/api_constants.dart';
import 'package:exclusive_access/utils/fonts/app_dimensions.dart';
import 'package:exclusive_access/utils/global_widgets/text_styles.dart';
import 'package:exclusive_access/utils/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lottie/lottie.dart';

enum APIMethod { get, post, put, patch, delete, multipart }


class ApiManager extends GetConnect {
  final GetConnect _connect = GetConnect(
    timeout: const Duration(seconds: 10),
  );
  Future<dynamic> requestAPi(
      String endPoint, {
        String baseUrl = ApiConstant.base_url,
        APIMethod method = APIMethod.post,
        String? token,
        var data,
        bool isAuthenticated = true,
      }) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi ||
        connectivityResult == ConnectivityResult.ethernet) {
      final url = baseUrl + endPoint;
      final headers = {
        'Content-Type': 'application/json',
        "Accept": 'application/json',
        'Authorization':
        'Bearer ${token ?? GetStorage().read("remember_token")}'
      };
      print("******************* Url *******************\n");
      print(url);
      print("\n*******************************************");
      print("******************* Token *******************\n");
      print(GetStorage().read("remember_token"));
      print("\n*********************************************");
      print("******************* Header *******************\n");
      print(headers);
      print("\n*******************************************");
      print("******************* Data *******************\n");
      print(data);
      print("\n*******************************************");
      final response;
      try {
        switch (method) {
          case APIMethod.get:
            response = await get(url, headers: headers);
            print("******************* Response *******************\n");
            print("MeThod : $method");
            print(response.body);
            print("\n*******************************************");
            break;
          case APIMethod.post:
            response = await post(url, data, headers: headers);
            print("******************* Response *******************\n");
            print("MeThod : $method");
            print(response.body);
            print("\n*******************************************");
            break;
          case APIMethod.put:
            response = await put(url, data, headers: headers);
            print("******************* Response *******************\n");
            print("MeThod : $method");
            print(response.body);
            print("this is post method ");
            print("\n*******************************************");
            break;
          case APIMethod.patch:
            response = await patch(
              url,
              data,
              headers: headers,
            );
            print("******************* Response *******************\n");
            print("MeThod : $method");
            print(response.body);
            print("\n*******************************************");
            break;
          case APIMethod.delete:
            response = await delete(url, headers: headers);
            print("******************* Response *******************\n");
            print("MeThod : $method");
            print(response.body);
            print("\n*******************************************");
            break;
          case APIMethod.multipart:
            response = await _connect.post(
              url,
              data,
            );
            print("******************* Response *******************\n");
            print("MeThod : $method");
            print(response.body);
            print("\n*******************************************");
            break;
        }

        return _handleResponse(response);
      } catch (e) {
        print(e);
        print("this is i want to know");
        print(e.toString());
      }
    } else {
      Get.back();
      Get.defaultDialog(
          titlePadding: EdgeInsets.zero,
          titleStyle: const TextStyle(inherit: false),
          contentPadding: EdgeInsets.zero,
          content: Column(
            children: [
              SizedBox(
                  height: Get.height / 6,
                  width: Get.height / 6,
                  child: Lottie.asset('assets/lotifiles/errorloti.json')),
              SizedBox(
                height: Get.height / 30,
              ),
              Text("Connection Error", style: TextStyles.boldTextStyle()),
              SizedBox(
                height: Get.height / 50,
              ),
              AppButton(
                  buttonName: "Try Again",
                  buttonHeight: Get.height / 20,
                  textSize: AppDimensions.FONT_SIZE_20,
                  buttonColor: AppColors.PRIMARY_COLOR,
                  textColor: AppColors.WHITE_COLOR,
                  buttonRadius: BorderRadius.circular(25),
                  onTap: () {
                    Get.back();
                  }),
              SizedBox(
                height: Get.height / 100,
              ),
            ],
          ));
    } // return "Connection Error..!!";
  }
  _handleResponse(var response) {
    print("============= ============ =============");
    if(response.body == 'null' || response.body == null) {
      Get.back();
      Get.defaultDialog(
          titlePadding: EdgeInsets.zero,
          titleStyle: const TextStyle(inherit: false),
          contentPadding: EdgeInsets.zero,
          content: Column(
            children: [
              SizedBox(
                  height: Get.height / 6,
                  width: Get.height / 6,
                  child: Lottie.asset('assets/lotifiles/errorloti.json')),
              SizedBox(
                height: Get.height / 30,
              ),
              Text("Connection Error", style: TextStyles.boldTextStyle()),
              SizedBox(
                height: Get.height / 50,
              ),
              AppButton(
                  buttonName: "Try Again",
                  buttonHeight: Get.height / 20,
                  textSize: AppDimensions.FONT_SIZE_20,
                  buttonColor: AppColors.PRIMARY_COLOR,
                  textColor: AppColors.WHITE_COLOR,
                  buttonRadius: BorderRadius.circular(25),
                  onTap: () {
                    Get.back();
                  }),
              SizedBox(
                height: Get.height / 100,
              ),
            ],
          ));
    } else {
       return response.body;
    }
  }
}





