import 'package:exclusive_access/utils/themes/custom_app_theme.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class EventCardShimmer extends StatelessWidget {
  const EventCardShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size med = MediaQuery.of(context).size;
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 0, right: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Shimmer.fromColors(
                baseColor: CustomAppTheme().lightGreyColor,
                highlightColor: CustomAppTheme().backgroundColor,
                child: Container(
                  height: med.height * .2,
                  width: med.width - 30,
                  decoration: BoxDecoration(
                      color: CustomAppTheme().lightGreyColor,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(8),
                        topLeft: Radius.circular(8),
                      )),
                ),
              ),
              SizedBox(height: 2),
              Shimmer.fromColors(
                baseColor: CustomAppTheme().lightGreyColor,
                highlightColor: CustomAppTheme().backgroundColor,
                child: Container(
                  margin: EdgeInsets.only(bottom: 10),
                  height: med.height * 0.07,
                  width: med.width - 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(8),
                      bottomLeft: Radius.circular(8),
                    ),
                    color: CustomAppTheme().lightGreyColor,
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
