import 'package:exclusive_access/features/Home/model/upcoming_events_model.dart';
import 'package:exclusive_access/utils/constants/app_images.dart';
import 'package:exclusive_access/utils/global_widgets/text_styles.dart';
import 'package:exclusive_access/utils/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';


class ExclusiveCard extends StatelessWidget {
  final UpcomingEvents upcomingEvent;
  const ExclusiveCard({Key? key, required this.upcomingEvent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const Map<int, String> monthName = {1: "Jan", 2: "Feb", 3: "Mar", 4: "Apr", 5: "May", 6: "Jun", 7: "Jul", 8: "Aug", 9: "Sep", 10: "Oct", 11: "Nov", 12: "Dec"};
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 15),
      child: Container(
        width: Get.width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(5),
              topRight: Radius.circular(5),
              bottomLeft: Radius.circular(5),
              bottomRight: Radius.circular(5)
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: .5,
              blurRadius: 3,
              offset: const Offset(0, 0), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5),
                  topRight: Radius.circular(5),
                ),
              ),
              width: Get.width,
              child: Stack(
                alignment: Alignment.center,
                children: [
                upcomingEvent.image.isEmpty ? SizedBox(
                      height: 200,
                      child: Image.asset(AppImages.splash_logo, color: Colors.white, alignment: Alignment.center))
                    :
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(5),
                    topLeft: Radius.circular(5),
                  ),
                  child: Image.network(
                    "https://app2.zatsole.biz/public/${upcomingEvent.image}",
                    height: 200,
                    width: Get.width,
                    fit: BoxFit.cover,
                  ),
                ),
                // SizedBox(
                //   height: 200,
                //   child: Image.network("https://app2.zatsole.biz/public/${upcomingEvent.image}", width: Get.width, fit: BoxFit.cover,),
                // ),
                  Positioned(
                    right: 20,
                    top: 20,
                    child: Container(
                      alignment: Alignment.center,
                      height: 42,
                      width: 42,
                      decoration: BoxDecoration(
                        color: AppColors.PURE_WHITE_COLOR,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      // radius: 25,
                      // backgroundColor: AppColors.PURE_WHITE_COLOR,
                      child: Text("${upcomingEvent.createdAt.day}\n${monthName[upcomingEvent.createdAt.month]}", style: TextStyles.mediumTextStyle(fontSize: 14, height: 1, fontWeight: FontWeight.w700), textAlign: TextAlign.center),
                    ),
                  ),

                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(upcomingEvent.name, style: TextStyles.mediumTextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                      Text("${upcomingEvent.address} - ${DateFormat.jm().format(upcomingEvent.createdAt)}", style: TextStyles.regularTextStyle())
                    ],
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: 45,
                    width: 90,
                    decoration: BoxDecoration(
                      color: AppColors.PURE_BLACK_COLOR,
                      borderRadius: BorderRadius.circular(60),
                    ),
                    child: Text('\$${upcomingEvent.price}', style: TextStyles.regularTextStyle(textColor: AppColors.PURE_WHITE_COLOR)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

          ],
        ),
      ),
    );
  }
}
