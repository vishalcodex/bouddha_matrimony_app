import '../../../../common/color_pallete.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/ui/loading_widget.dart';
import '../../../components/ui/my_list_view.dart';
import '../../../components/ui/tab_switcher.dart';
import '../../../components/ui/text_view.dart';
import '../../matches/controllers/match_controller.dart';
import '../controllers/home_controller.dart';
import '../../matches/widgets/match_card_widget.dart';

import '../../../../../../../common/transalations/translation_keys.dart'
    as translations;

// ignore: must_be_immutable
class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    // double ffem = fem * 0.97;
    return Scaffold(
      extendBody: true,
      backgroundColor: ColorPallete.theme,
      body: SafeArea(
        child: Scaffold(
          backgroundColor: ColorPallete.theme,
          body: Column(
            children: [
              Expanded(
                  child: Obx(
                () => TabSwitcher(
                  tabs: [
                    {
                      "name": translations.matches.tr,
                      "view": RefreshIndicator(
                        onRefresh: () {
                          controller.fetchMatchedProfiles(true);
                          return Future.value();
                        },
                        child: MyListView(
                          controller: controller.matchesScrollController,
                          scroll: true,
                          children: [
                            controller.macthes.isEmpty &&
                                    !controller.isLoading.value
                                ? SizedBox(
                                    height: 200 * fem,
                                    child: Center(
                                      child: TextView(
                                        text: translations.noMatches.tr,
                                        color: ColorPallete.grey,
                                        fontSize: 16,
                                      ),
                                    ),
                                  )
                                : MyListView(
                                    children: controller.macthes
                                        .map((e) => MatchCardWidget(
                                              profile: e,
                                              sendInterest: () async {
                                                return await Get.find<
                                                        MatchController>()
                                                    .sendIntrestTo(e)
                                                    .then((value) {
                                                  value == true
                                                      ? controller.macthes
                                                          .remove(e)
                                                      : () {};
                                                  return value;
                                                });
                                              },
                                              addToShortlist: () async {
                                                return await Get.find<
                                                        MatchController>()
                                                    .addToShorlist(e)
                                                    .then((value) {
                                                  value == true
                                                      ? controller.macthes
                                                          .remove(e)
                                                      : () {};
                                                  return value;
                                                });
                                              },
                                            ))
                                        .toList(),
                                  ),
                            if (controller.isLoading.value) const Loading()
                          ],
                        ),
                      )
                    },
                    {
                      "name": translations.profileVisitors.tr,
                      "view": RefreshIndicator(
                        onRefresh: () {
                          controller.fetchViewedMyProfiles();
                          return Future.value();
                        },
                        child: MyListView(
                          scroll: true,
                          children: controller.isLoading.value
                              ? [const Loading()]
                              : controller.viewedMyProfiles.isEmpty
                                  ? [
                                      SizedBox(
                                        height: 200 * fem,
                                        child: Center(
                                            child: TextView(
                                          text: translations.noProfiles.tr,
                                          color: ColorPallete.grey,
                                          fontSize: 16,
                                        )),
                                      )
                                    ]
                                  : controller.viewedMyProfiles
                                      .map((e) => MatchCardWidget(
                                            profile: e,
                                            sendInterest: () async {
                                              return await Get.find<
                                                      MatchController>()
                                                  .sendIntrestTo(e)
                                                  .then((value) {
                                                value == true
                                                    ? controller
                                                        .viewedMyProfiles
                                                        .remove(e)
                                                    : () {};
                                                return value;
                                              });
                                            },
                                            // addToShortlist: () async {
                                            //   return await Get.find<
                                            //           MatchController>()
                                            //       .addToShorlist(e)
                                            //       .then((value) {
                                            //     value == true
                                            //         ? controller
                                            //             .shortlistedProfiles
                                            //             .remove(e)
                                            //         : () {};
                                            //     return value;
                                            //   });
                                            // },
                                          ))
                                      .toList(),
                        ),
                      )
                    },
                    {
                      "name": translations.shortlist.tr,
                      "view": RefreshIndicator(
                        onRefresh: () {
                          controller.fetchshortlistedProfiles();
                          return Future.value();
                        },
                        child: MyListView(
                          scroll: true,
                          children: controller.isLoading.value
                              ? [const Loading()]
                              : controller.shortlistedProfiles.isEmpty
                                  ? [
                                      SizedBox(
                                        height: 200 * fem,
                                        child: Center(
                                            child: TextView(
                                          text: translations.shortlist.tr,
                                          color: ColorPallete.grey,
                                          fontSize: 16,
                                        )),
                                      )
                                    ]
                                  : controller.shortlistedProfiles
                                      .map((e) => MatchCardWidget(
                                            profile: e,
                                            sendInterest: () async {
                                              return await Get.find<
                                                      MatchController>()
                                                  .sendIntrestTo(e)
                                                  .then((value) {
                                                value == true
                                                    ? controller
                                                        .shortlistedProfiles
                                                        .remove(e)
                                                    : () {};
                                                return value;
                                              });
                                            },
                                            // addToShortlist: () async {
                                            //   return await Get.find<
                                            //           MatchController>()
                                            //       .addToShorlist(e)
                                            //       .then((value) {
                                            //     value == true
                                            //         ? controller
                                            //             .shortlistedProfiles
                                            //             .remove(e)
                                            //         : () {};
                                            //     return value;
                                            //   });
                                            // },
                                          ))
                                      .toList(),
                        ),
                      )
                    }
                  ],
                  onTabsChanged: (value) {
                    controller.onTabChanged(value);
                  },
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
