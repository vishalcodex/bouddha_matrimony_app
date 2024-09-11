import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../common/color_pallete.dart';
import '../../../components/ui/my_list_view.dart';
import '../../../components/ui/rounded_container.dart';
import '../../../components/ui/text_view.dart';
import '../../../routes/app_routes.dart';
import '../../../services/auth_service.dart';
import '../controllers/settings_controller.dart';
import 'contact_us_screen.dart';
import 'privacy_policy_screen.dart';
import 'terms_n_conditions_screen.dart';

import '../../../../../../../common/transalations/translation_keys.dart'
    as translations;

// ignore: must_be_immutable
class SettingsScreen extends GetView<SettingsController> {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // double baseWidth = 360;
    // double fem = MediaQuery.of(context).size.width / baseWidth;
    // double ffem = fem * 0.97;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: ColorPallete.theme),
        backgroundColor: ColorPallete.primary,
        title: TextView(
          text: translations.settings.tr,
          color: ColorPallete.theme,
          fontSize: 18,
          weight: FontWeight.bold,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: MyListView(
                scroll: true,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: RoundedContainer(
                      radius: 5,
                      color: ColorPallete.theme,
                      borderColor: ColorPallete.grey,
                      child: MyListView(
                        children: [
                          InkWell(
                            onTap: () {
                              Share.share("Welcome to Bouddha Matrimony !");
                            },
                            child: _getEntry(
                              icon: Icons.person_add_alt_sharp,
                              title: translations.inviteFriend.tr,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return ContactUsScreen();
                                  },
                                ),
                              );
                            },
                            child: _getEntry(
                              icon: Icons.contact_phone,
                              title: translations.contactUs.tr,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Get.toNamed(Routes.SUBSCRIPTIONS);
                            },
                            child: _getEntry(
                              icon: Icons.price_change_outlined,
                              title: translations.subscriptions.tr,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              if (Platform.isAndroid || Platform.isIOS) {
                                final appId = Platform.isAndroid
                                    ? 'com.codex.bouddham'
                                    : 'YOUR_IOS_APP_ID';
                                final url = Uri.parse(
                                  Platform.isAndroid
                                      ? "market://details?id=$appId"
                                      : "https://apps.apple.com/app/id$appId",
                                );
                                launchUrl(
                                  url,
                                  mode: LaunchMode.externalApplication,
                                );
                              }
                            },
                            child: _getEntry(
                              icon: Icons.star,
                              title: translations.rateTheApp.tr,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Get.toNamed(Routes.FORGOT_PASSWORD);
                            },
                            child: _getEntry(
                              icon: Icons.password,
                              title: translations.forgotPassword.tr,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return TermsNConditionsScreen();
                                  },
                                ),
                              );
                            },
                            child: _getEntry(
                              icon: Icons.edit_document,
                              title: translations.termsCondition.tr,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return PrivacyPolicyScreen();
                                  },
                                ),
                              );
                            },
                            child: _getEntry(
                              icon: Icons.privacy_tip_sharp,
                              title: translations.privacyPolicy.tr,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Get.find<AuthService>()
                                  .removeCurrentUser()
                                  .then((value) {
                                Get.offAllNamed(Routes.LOGIN);
                              });
                            },
                            child: _getEntry(
                              icon: Icons.logout,
                              title: translations.logout.tr,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _getEntry({IconData? icon, required String title}) {
    return MyListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              SizedBox(
                width: 60,
                child: icon == null
                    ? SizedBox.shrink()
                    : Center(
                        child: Icon(
                          icon,
                          color: ColorPallete.grey,
                          size: 25,
                        ),
                      ),
              ),
              Expanded(
                child: TextView(
                  text: title,
                  color: ColorPallete.grey,
                  fontSize: 14,
                  weight: FontWeight.w600,
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: ColorPallete.grey,
                size: 20,
              )
            ],
          ),
        ),
        Divider(
          thickness: 1,
          height: 1,
          color: ColorPallete.grey,
        )
      ],
    );
  }
}
