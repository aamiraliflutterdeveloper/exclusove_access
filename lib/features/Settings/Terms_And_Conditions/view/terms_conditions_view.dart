import 'package:exclusive_access/features/Settings/Support/view/components/support_header.dart';
import 'package:exclusive_access/features/Settings/Terms_And_Conditions/controller/terms_condition_controller.dart';
import 'package:exclusive_access/utils/global_widgets/message_card_shimmer.dart';
import 'package:exclusive_access/utils/global_widgets/scroll_behavior.dart';
import 'package:exclusive_access/utils/global_widgets/text_styles.dart';
import 'package:exclusive_access/utils/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TermsConditionView extends GetView<TermsConditionController> {
  const TermsConditionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.PURE_WHITE_COLOR,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ScrollConfiguration(
                behavior: MyBehavior(),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      supportHeader(),
                      const SizedBox(height: 35),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Terms and Conditions", style: TextStyles.mediumTextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
                            const SizedBox(height: 20),
                            GetBuilder<TermsConditionController>(builder: (ctx) => (controller.isLoading == false && controller.termsCondition != null)
                                ? Text(controller.termsCondition!.content, style: TextStyles.regularTextStyle())
                                :
                            ListView.builder(
                              itemCount: 10,
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return const MessageCardShimmer();
                              },
                            )),
                          ],
                        ),
                      ),
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
