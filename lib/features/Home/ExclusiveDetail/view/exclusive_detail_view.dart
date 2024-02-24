import 'dart:async';
import 'package:exclusive_access/features/Home/ExclusiveDetail/controller/exclusive_controller.dart';
import 'package:exclusive_access/features/Home/ExclusiveDetail/view/components/exclusive_detail_header.dart';
import 'package:exclusive_access/global_controller.dart';
import 'package:exclusive_access/theme_changer.dart';
import 'package:exclusive_access/utils/global_widgets/custom_button_without_icon.dart';
import 'package:exclusive_access/utils/global_widgets/custom_text_field.dart';
import 'package:exclusive_access/utils/global_widgets/scroll_behavior.dart';
import 'package:exclusive_access/utils/global_widgets/text_styles.dart';
import 'package:exclusive_access/utils/routes/routes.dart';
import 'package:exclusive_access/utils/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ExclusiveDetailView extends GetView<ExclusiveController> {
  ExclusiveDetailView({Key? key}) : super(key: key);

  final Completer<GoogleMapController> _controller = Completer();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: PreferredSize(
      //     preferredSize: Size.fromHeight(0.0),
      //     child: AppBar(
      //       backgroundColor: AppColors.PURE_BLACK_COLOR,
      //       systemOverlayStyle: SystemUiOverlayStyle(
      //           statusBarColor: Colors.transparent,
      //           statusBarIconBrightness: Brightness.light),
      //     )),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ScrollConfiguration(
                behavior: MyBehavior(),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      exclusiveDetailHeader(),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Exclusive Access",
                                        style: TextStyles.mediumTextStyle(
                                            fontWeight: FontWeight.w600)),
                                    Text("Lahore Pakistan",
                                        style: TextStyles.regularTextStyle())
                                  ],
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  height: 40,
                                  width: 80,
                                  decoration: BoxDecoration(
                                    color: AppColors.PURE_BLACK_COLOR,
                                    borderRadius: BorderRadius.circular(60),
                                  ),
                                  child: Text('\$400',
                                      style: TextStyles.regularTextStyle(
                                          textColor:
                                              AppColors.PURE_WHITE_COLOR)),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: dataTable(
                                      title: 'Date', subTitle: '10 December'),
                                ),
                                Expanded(
                                  child: dataTable(
                                      title: 'Time', subTitle: '10:00 pm'),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                  child:
                                      dataTable(title: 'Men', subTitle: '10'),
                                ),
                                Expanded(
                                  child:
                                      dataTable(title: 'Women', subTitle: '29'),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: dataTable(
                                      title: 'Average Age', subTitle: '29'),
                                ),
                                Expanded(
                                  child: dataTable(
                                      title: 'Tickets/Guest List Secured',
                                      subTitle: '58'),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            dataTable(
                                title: 'Event Description',
                                subTitle:
                                    'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. '),
                            const SizedBox(height: 20),
                            Text("Map Location",
                                style: TextStyles.mediumTextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w600)),
                            const SizedBox(height: 10),
                            SizedBox(
                              height: 200,
                              child: GoogleMap(
                                mapType: MapType.normal,
                                initialCameraPosition: _kGooglePlex,
                                onMapCreated: (GoogleMapController controller) {
                                  _controller.complete(controller);
                                },
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text("Promo Code",
                                style: TextStyles.mediumTextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w600)),
                            const SizedBox(height: 10),
                            CustomTextField(
                              borderColor: AppColors.greyColor,
                              hintText: 'Promo Code',
                              controller: controller.promoCode,
                              validator: (value) {},
                            ),
                            const SizedBox(height: 20),
                            CustomButtonWithoutIcon(
                                text: 'Buy Tickets/Guest List',
                                onPressed: () {
                                  Get.toNamed(Routes.CARTDETAIL);
                                },
                                textVerticalPadding: 14),
                            const SizedBox(height: 20),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget dataTable({required String title, required String subTitle}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(title,
          style: TextStyles.mediumTextStyle(
              fontSize: 16, fontWeight: FontWeight.w600)),
      Text(subTitle, style: TextStyles.regularTextStyle()),
    ],
  );
}
