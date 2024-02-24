import 'package:dotted_line/dotted_line.dart';
import 'package:exclusive_access/features/Ticket/controller/ticket_controller.dart';
import 'package:exclusive_access/features/Ticket/view/components/ticket_header.dart';
import 'package:exclusive_access/utils/global_widgets/scroll_behavior.dart';
import 'package:exclusive_access/utils/global_widgets/text_styles.dart';
import 'package:exclusive_access/utils/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TicketView extends GetView<TicketController> {
  const TicketView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.PURE_WHITE_COLOR,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            ticketHeader(),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Exclusive Access", style: TextStyles.mediumTextStyle(fontSize: 21, fontWeight: FontWeight.w600)),
            ),
            Expanded(
              child: GestureDetector(
                // onTap: () {
                //   FocusScope.of(context).requestFocus(FocusNode());
                // },
                child: Column(
                  // mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: _menuBar(context),
                    ),
                    Expanded(
                      flex: 2,
                      child: PageView(
                        controller: controller.pageController,
                        // physics: const ClampingScrollPhysics(),
                        onPageChanged: (int i) {
                          FocusScope.of(context).requestFocus(FocusNode());
                          controller.changePage(i);
                        },
                        children: <Widget>[
                          ConstrainedBox(
                            constraints: const BoxConstraints.expand(),
                            child: const TicketsPurchased(),
                          ),
                          ConstrainedBox(
                            constraints: const BoxConstraints.expand(),
                            child: const GuestLists(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _menuBar(BuildContext context) {
    return GetBuilder<TicketController>(
      builder: (ctx) => Container(
        width: Get.width,
        height: 50.0,
        color: AppColors.PURE_WHITE_COLOR,
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              child: InkWell(
                onTap: _onPlaceBidButtonPress,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  alignment: Alignment.center,
                  decoration: (controller.activePageIndex == 0) ? const BoxDecoration(
                    color: AppColors.PURE_WHITE_COLOR,
                    border: Border(
                      bottom: BorderSide(width: 2.0, color: AppColors.PURE_BLACK_COLOR),
                    ),
                    // borderRadius: BorderRadius.all(Radius.circular(50)),
                  ) : null,
                  child: Text(
                    "Tickets Purchased",
                    style: (controller.activePageIndex == 0) ? TextStyles.mediumTextStyle(fontSize: 16, fontWeight: FontWeight.w600) : TextStyles.regularTextStyle(fontWeight: FontWeight.w600)
                  ),
                ),
              ),
            ),
            Expanded(
              child: InkWell(
                onTap: _onBuyNowButtonPress,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  alignment: Alignment.center,
                  decoration: (controller.activePageIndex == 1) ? const BoxDecoration(
                    color: AppColors.PURE_WHITE_COLOR,
                    border: Border(
                      bottom: BorderSide(width: 2.0, color: AppColors.PURE_BLACK_COLOR),
                    ),
                    // borderRadius: BorderRadius.all(Radius.circular(50)),
                  ) : null,
                  child: Text(
                    "Guest Lists",
                    style: (controller.activePageIndex == 1) ? TextStyles.mediumTextStyle(fontSize: 16, fontWeight: FontWeight.w600) : TextStyles.regularTextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onPlaceBidButtonPress() {
    controller.pageController.animateToPage(0,
        duration: const Duration(milliseconds: 5), curve: Curves.easeIn);
  }

  void _onBuyNowButtonPress() {
    controller.pageController.animateToPage(1,
        duration: const Duration(milliseconds: 5), curve: Curves.easeIn);
  }


}

// tickets purchased ...

class TicketsPurchased extends StatefulWidget {
  const TicketsPurchased({Key? key}) : super(key: key);

  @override
  State<TicketsPurchased> createState() => _TicketsPurchasedState();
}

class _TicketsPurchasedState extends State<TicketsPurchased> {

  final List<Map<String, dynamic>> _items = List.generate(
      50,
          (index) => {
        "id": index,
        "title": "Exclusive Access",
        "content":
        "This is the main content of item $index. It is very long and you have to expand the tile to see it."
      });

  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
      child: ScrollConfiguration(
        behavior: MyBehavior(),
        child: ListView.builder(
            itemCount: 20,
            itemBuilder: (_, index) {
              final item = _items[index];
              return Card(
                // this key is required to save and restore ExpansionTile expanded state
                key: PageStorageKey(item['id']),
                // color: AppColors.greyColor,
                color: AppColors.greyColor,
                elevation: 0,
                child: Theme(
                  data: ThemeData(
                    dividerColor: isExpanded == true ? AppColors.PURE_WHITE_COLOR : AppColors.greyColor,
                  ),
                  child: ExpansionTile(
                    onExpansionChanged: (val) {
                      isExpanded = val;
                      setState(() {});
                    },
                    controlAffinity: ListTileControlAffinity.trailing,
                    textColor: AppColors.PURE_BLACK_COLOR,
                    iconColor: AppColors.PURE_BLACK_COLOR,
                    expandedCrossAxisAlignment: CrossAxisAlignment.end,
                    maintainState: true,
                    title: Text(item['title'], style: TextStyles.mediumTextStyle()),
                    // contents
                    children: [
                      Container(
                        height: 20,
                        width: Get.width,
                        color: AppColors.PURE_WHITE_COLOR,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                        decoration: BoxDecoration(
                            color: AppColors.PURE_WHITE_COLOR,
                          border: Border.all(width: 1, color: AppColors.APPBAR_GREY_COLOR)
                        ),
                        child: Column(
                          children: [
                            Container(
                              height: 40,
                              width: Get.width,
                              decoration: BoxDecoration(
                                  color: AppColors.PURE_BLACK_COLOR,
                                border: Border.all(width: 1, color: AppColors.PURE_BLACK_COLOR)
                              ),
                              child: Container(
                                alignment: Alignment.center,
                                height: 38,
                                decoration: BoxDecoration(
                                    color: AppColors.PURE_WHITE_COLOR,
                                    border: Border.all(width: 3, color: AppColors.greyColor)
                                ),
                                child: Text("Ticket Verification", style: TextStyles.mediumTextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                              ),
                            ),
                            const SizedBox(height: 20),
                            rowTitle('Event Name', 'Exclusive Access'),
                            const SizedBox(height: 10),
                            rowTitle('Name', 'John Doe'),
                            const SizedBox(height: 10),
                            rowTitle('Phone Number', '12345678'),
                            const SizedBox(height: 10),
                            rowTitle('Date', '12/12/2023'),
                            const SizedBox(height: 10),
                            rowTitle('Time', '10:00 pm'),
                            const SizedBox(height: 10),
                            rowTitle('Invoice ID', '1234567890'),
                            const SizedBox(height: 10),
                            rowTitle('Total Tickets', '12'),
                            const SizedBox(height: 10),
                            DottedLine(
                              direction: Axis.horizontal,
                              lineLength: double.infinity,
                              lineThickness: 1.0,
                              dashLength: 4.0,
                              dashColor: Colors.white,
                              dashGradient: const [Colors.white, Colors.white],
                              dashRadius: 0.0,
                              dashGapLength: 4.0,
                              dashGapColor: Colors.white,
                              dashGapGradient: const [Colors.black, Colors.black],
                              dashGapRadius: 0.0,
                            ),
                            const SizedBox(height: 10),
                            rowTitle('Total', '\$500'),
                            const SizedBox(height: 10),
                            rowTitle('Paid', '\$500'),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}

// guest lists ...

class GuestLists extends StatefulWidget {
  const GuestLists({Key? key}) : super(key: key);

  @override
  State<GuestLists> createState() => _GuestListsState();
}

class _GuestListsState extends State<GuestLists> {

  final List<Map<String, dynamic>> _items = List.generate(
      50,
          (index) => {
        "id": index,
        "title": "Exclusive Access",
        "content":
        "This is the main content of item $index. It is very long and you have to expand the tile to see it."
      });

  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
      child: ScrollConfiguration(
        behavior: MyBehavior(),
        child: ListView.builder(
            itemCount: 20,
            itemBuilder: (_, index) {
              final item = _items[index];
              return Card(
                // this key is required to save and restore ExpansionTile expanded state
                key: PageStorageKey(item['id']),
                // color: AppColors.greyColor,
                color: AppColors.greyColor,
                elevation: 0,
                child: Theme(
                  data: ThemeData(
                    dividerColor: isExpanded == true ? AppColors.PURE_WHITE_COLOR : AppColors.greyColor,
                  ),
                  child: ExpansionTile(
                    onExpansionChanged: (val) {
                      isExpanded = val;
                      setState(() {});
                    },
                    controlAffinity: ListTileControlAffinity.trailing,
                    textColor: AppColors.PURE_BLACK_COLOR,
                    iconColor: AppColors.PURE_BLACK_COLOR,
                    expandedCrossAxisAlignment: CrossAxisAlignment.end,
                    maintainState: true,
                    title: Text(item['title'], style: TextStyles.mediumTextStyle()),
                    // contents
                    children: [
                      Container(
                        height: 20,
                        width: Get.width,
                        color: AppColors.PURE_WHITE_COLOR,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                        decoration: BoxDecoration(
                            color: AppColors.PURE_WHITE_COLOR,
                            border: Border.all(width: 1, color: AppColors.APPBAR_GREY_COLOR)
                        ),
                        child: Column(
                          children: [
                            Container(
                              height: 40,
                              width: Get.width,
                              decoration: BoxDecoration(
                                  color: AppColors.PURE_BLACK_COLOR,
                                  border: Border.all(width: 1, color: AppColors.PURE_BLACK_COLOR)
                              ),
                              child: Container(
                                alignment: Alignment.center,
                                height: 38,
                                decoration: BoxDecoration(
                                    color: AppColors.PURE_WHITE_COLOR,
                                    border: Border.all(width: 3, color: AppColors.greyColor)
                                ),
                                child: Text("Ticket Verification", style: TextStyles.mediumTextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                              ),
                            ),
                            const SizedBox(height: 20),
                            rowTitle('Event Name', 'Exclusive Access'),
                            const SizedBox(height: 10),
                            rowTitle('Name', 'John Doe'),
                            const SizedBox(height: 10),
                            rowTitle('Phone Number', '12345678'),
                            const SizedBox(height: 10),
                            rowTitle('Date', '12/12/2023'),
                            const SizedBox(height: 10),
                            rowTitle('Time', '10:00 pm'),
                            const SizedBox(height: 10),
                            rowTitle('Invoice ID', '1234567890'),
                            const SizedBox(height: 10),
                            rowTitle('Total Tickets', '12'),
                            const SizedBox(height: 10),
                            DottedLine(
                              direction: Axis.horizontal,
                              lineLength: double.infinity,
                              lineThickness: 1.0,
                              dashLength: 4.0,
                              dashColor: Colors.white,
                              dashGradient: const [Colors.white, Colors.white],
                              dashRadius: 0.0,
                              dashGapLength: 4.0,
                              dashGapColor: Colors.white,
                              dashGapGradient: const [Colors.black, Colors.black],
                              dashGapRadius: 0.0,
                            ),
                            const SizedBox(height: 10),
                            rowTitle('Total', '\$500'),
                            const SizedBox(height: 10),
                            rowTitle('Paid', '\$500'),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}



Widget rowTitle(String title, String subTitle) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(title, style: TextStyles.mediumTextStyle(fontWeight: FontWeight.w500, fontSize: 16)),
      Text(subTitle, style: TextStyles.regularTextStyle()),
    ],
  );
}