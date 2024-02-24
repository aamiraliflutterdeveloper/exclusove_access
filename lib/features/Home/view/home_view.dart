import 'package:exclusive_access/features/Home/controller/home_controller.dart';
import 'package:exclusive_access/features/Home/model/upcoming_events_model.dart';
import 'package:exclusive_access/features/Home/view/components/eclusive_card.dart';
import 'package:exclusive_access/features/Home/view/components/home_header.dart';
import 'package:exclusive_access/utils/global_widgets/event_card_shimmer.dart';
import 'package:exclusive_access/utils/global_widgets/scroll_behavior.dart';
import 'package:exclusive_access/utils/global_widgets/text_styles.dart';
import 'package:exclusive_access/utils/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            homeHeader(),
            const SizedBox(height: 35),

            GetBuilder<HomeController>(
              builder: (ctx) => SizedBox(
                  width: 370,
                  height: 52,
                  child: TypeAheadFormField(
                    suggestionsCallback: (pattern) async {
                      if (pattern.isNotEmpty) {
                        return await controller.searchEvents(context, pattern);
                      } else {
                        return [];
                      }
                    },
                    onSuggestionSelected:
                        (value) {
                      // address.text = value.description;
                    },
                    itemBuilder: (_, item) =>
                        Card(
                          color: Colors.white,
                          child: ListTile(
                            title: Text(item.name),
                          ),
                        ),
                    getImmediateSuggestions: true,
                    hideOnEmpty: false,
                    noItemsFoundBuilder: (_) =>
                        const Padding(
                          padding: EdgeInsets.all(5.0),
                          child: Text("No Items"),
                        ),
                    textFieldConfiguration:
                    TextFieldConfiguration(
                      decoration: InputDecoration(
                        // prefixIcon: Icon(
                        //   CupertinoIcons.search,
                        //   size: 17,
                        // ),
                        // suffixIcon: Icon(
                        //   CupertinoIcons.mic_fill,
                        //   size: 17,
                        // ),
                        //hintText: 'Search',
                          border: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.circular(
                                5),
                            borderSide: const BorderSide(
                                color: Colors.grey,
                                width: 1),
                          ),
                          enabledBorder:
                          OutlineInputBorder(
                            borderRadius:
                            BorderRadius.circular(
                                5),
                            borderSide: const BorderSide(
                                color: Colors.grey,
                                width: 1),
                          ),
                          contentPadding:
                          const EdgeInsets.symmetric(
                            horizontal: 10,
                          ),
                          hintText: 'Enter Physical Address',
                          hintStyle: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          )
                        // hintStyle: TextStyle(
                        //   fontSize: 10,
                        //   fontWeight: FontWeight.w400,
                        //   color: kUILight2,
                        // ),
                      ),
                      controller: controller.searchController,
                      onChanged: ((value) {
                        if (value != '') {
                          // getPredictions(address.text);
                          // locationPrediction(address.text);
                          //apiAddress.clear();
                          // getAddress(value);
                        }
                      }),
                      onSubmitted: (value) {
                        // getLatLong(value);
                      },
                    ),
                  )),
            ),


            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 15.0),
            //   child: CustomTextField(
            //     borderColor: AppColors.greyColor,
            //     hintText: 'Search',
            //     controller: controller.searchController,
            //     validator: (value) {},
            //     suffixIcon: Icons.search_outlined,
            //   ),
            // ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Text("Upcoming Events", style: TextStyles.mediumTextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
            ),
            const SizedBox(height: 5),
            GetBuilder<HomeController>(
              builder: (ctx) => controller.isLoading == false && controller.upcomingEventsModel != null ? Expanded(
                child: ScrollConfiguration(
                  behavior: MyBehavior(),
                  child: ListView.builder(
                    padding: const EdgeInsets.only(bottom: 10),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                      itemCount: controller.upcomingEventsModel!.data.length,
                      itemBuilder: (context, index) {
                      final UpcomingEvents upcomingEvent = controller.upcomingEventsModel!.data[index];
                        return GestureDetector(
                            onTap: () {
                              Get.toNamed(Routes.EXCLUSIVEDETAIL);
                            },
                            child: ExclusiveCard(upcomingEvent: upcomingEvent));
                      }),
                ),
              )
                  :
              Expanded(
                child: ScrollConfiguration(
                  behavior: MyBehavior(),
                  child: ListView.builder(
                    itemCount: 5,
                    padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 15),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return const EventCardShimmer();
                    },
                  ),
                ),
              )
            ),
          ],
      ),
    );
  }


}






