import '../../../components/ui/my_list_view.dart';
import '../../../components/ui/text_field.dart';
import '../../../components/ui/text_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/color_pallete.dart';
import '../../../components/ui/rounded_container.dart';
import '../controller/auth_controller.dart';
import '../../../../../../../common/transalations/translation_keys.dart'
    as translations;

class ForgotPasswordScreen extends GetView<AuthController> {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 393;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    // double ffem = fem * 0.97;
    return Scaffold(
      backgroundColor: ColorPallete.primary,
      body: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: ColorPallete.theme,
          appBar: AppBar(
            backgroundColor: ColorPallete.theme,
            leading: Padding(
              padding: EdgeInsets.only(left: 10.0 * fem),
              child: InkWell(
                onTap: () {
                  Get.back();
                  controller.errorMessage.value = "";
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.0 * fem),
                  child: Image.asset(
                    "assets/ui/back.png",
                    width: 10 * fem,
                    color: ColorPallete.primary,
                  ),
                ),
              ),
            ),
            elevation: 0,
          ),
          body: WillPopScope(
            onWillPop: () {
              if (controller.viaPassword.value) {
                controller.viaPassword.value = false;
                controller.viaPassword.refresh();
                return Future.value(false);
              }
              controller.errorMessage.value = "";
              return Future.value(true);
            },
            child: RoundedContainer(
              radius: 0,
              height: MediaQuery.of(context).size.height * 0.85,
              color: ColorPallete.theme,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0 * fem),
                child: Column(
                  children: [
                    Expanded(
                      child: MyListView(
                        // mainAxisSize: MainAxisSize.max,
                        // mainAxisAlignment: MainAxisAlignment.start,
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 20 * fem,
                          ),
                          SizedBox(
                            height: 10 * fem,
                          ),
                          TextView(
                            text: translations.forgotPassword.tr,
                            color: ColorPallete.secondary,
                            fontSize: 32,
                            weight: FontWeight.bold,
                          ),
                          SizedBox(
                            height: 15 * fem,
                          ),
                          TextView(
                            text: translations.forgotPassDesc.tr,
                            color: ColorPallete.grey,
                            fontSize: 14,
                          ),
                          SizedBox(
                            height: 25 * fem,
                          ),
                          TextView(
                            text: "${translations.email.tr} *",
                            color: ColorPallete.secondary,
                            fontSize: 16,
                          ),
                          SizedBox(
                            height: 10 * fem,
                          ),
                          RoundedContainer(
                            radius: 7.5,
                            // borderColor: ColorPallete.primary,
                            color: ColorPallete.grey.withOpacity(0.15),
                            child: Row(
                              children: [
                                // Padding(
                                //   padding: EdgeInsets.symmetric(
                                //       horizontal: 10.0 * fem),
                                //   child: const Icon(
                                //     Icons.person_outline,
                                //     color: ColorPallete.primary,
                                //   ),
                                // ),
                                SizedBox(
                                  width: 15 * fem,
                                ),
                                Expanded(
                                  child: MyTextField(
                                    // initialValue: controller.creds["email"],
                                    hintText: "hello@gmail.com",
                                    fontSize: 16,
                                    keyboardType: TextInputType.emailAddress,
                                    onChanged: (value) {
                                      controller.creds["email"] = value;
                                      // controller.errorMessage.value = "";
                                      controller.checkEmail();
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 15.0 * fem),
                                  child: InkWell(
                                      // onTap: () {
                                      //   controller.showPassword.value =
                                      //       !controller.showPassword.value;
                                      // },
                                      child: Obx(
                                    () => Icon(
                                      Icons.check_circle,
                                      color: controller.validEmail.value
                                          ? ColorPallete.primary
                                          : ColorPallete.grey.withOpacity(0.5),
                                    ),
                                  )),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 25 * fem,
                          ),

                          Obx(
                            () => controller.errorMessage.value != ""
                                ? TextView(
                                    text: controller.errorMessage.value,
                                    color: ColorPallete.red,
                                    fontSize: 14,
                                    weight: FontWeight.bold,
                                  )
                                : SizedBox.shrink(),
                          )
                          // if (controller.errorMessage.value != "")
                          //   SizedBox(
                          //     height: 25 * fem,
                          //   ),
                        ],
                      ),
                    ),
                    Obx(
                      () => InkWell(
                        onTap: () {
                          if (controller.validEmail
                                  .value // &&  controller.validPhone.value
                              ) {
                            if (!controller.isLoading.value)
                              controller.forgotPassword();
                          }
                        },
                        child: RoundedContainer(
                          radius: 10,
                          height: 55,
                          color: controller.validEmail.value
                              // &&  controller.validPhone.value
                              ? ColorPallete.primary
                              : ColorPallete.primary.withOpacity(0.2),
                          child: controller.isLoading.value
                              ? const RoundedContainer(
                                  radius: 0,
                                  height: 50,
                                  width: 50,
                                  child: Center(
                                    child: CircularProgressIndicator(
                                      color: ColorPallete.theme,
                                    ),
                                  ),
                                )
                              : Center(
                                  child: TextView(
                                    text: translations.sendInst.tr,
                                    color: ColorPallete.theme,
                                    fontSize: 22,
                                  ),
                                ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10 * fem,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
