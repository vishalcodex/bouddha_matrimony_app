import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/color_pallete.dart';
import '../../../../components/ui/text_view.dart';
import '../../controllers/sign_up_controller.dart';
import '../form_fields.dart';

import '../../../../../../../common/transalations/translation_keys.dart'
    as translations;

class LocationDetailsForm extends GetView<SignUpController> {
  const LocationDetailsForm({super.key});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0 * fem),
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Form(
                key: controller.locationDetailsFormKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: TextView(
                        text: translations.locationDetails.tr,
                        color: ColorPallete.secondary,
                        fontSize: 18,
                        weight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 30 * fem,
                    ),
                    Obx(
                      () => Column(
                        children: [
                          MyFormField(
                            fieldName: translations.country.tr,
                            // showFieldName: false,
                            type: InputType.DROP_DOWN,
                            keyboard: TextInputType.text,
                            required: true,
                            dropDownOptions: controller.countries
                                .map((element) => element.name)
                                .toList(),
                            initialValue:
                                (controller.locationDetails.value.country ??
                                            "") !=
                                        ""
                                    ? controller.countries
                                            .where((p0) =>
                                                p0.id ==
                                                int.parse(controller
                                                        .locationDetails
                                                        .value
                                                        .country ??
                                                    "0"))
                                            .isNotEmpty
                                        ? controller.countries
                                            .where((p0) =>
                                                p0.id ==
                                                int.parse(controller
                                                        .locationDetails
                                                        .value
                                                        .country ??
                                                    "0"))
                                            .first
                                            .name
                                        : null
                                    : "",
                            onChanged: (value) {
                              controller.onCountryChanged(value, true);
                            },
                          ),
                          if (controller.states.isNotEmpty)
                            MyFormField(
                              fieldName: translations.state.tr,
                              // showFieldName: false,
                              type: InputType.DROP_DOWN,
                              keyboard: TextInputType.text,
                              required: true,
                              dropDownOptions: controller.states
                                  .map((element) => element.name)
                                  .toList(),
                              initialValue:
                                  (controller.locationDetails.value.state ??
                                              "") !=
                                          ""
                                      ? controller.states
                                              .where((p0) =>
                                                  p0.id ==
                                                  int.parse(controller
                                                          .locationDetails
                                                          .value
                                                          .state ??
                                                      "0"))
                                              .isNotEmpty
                                          ? controller.states
                                              .where((p0) =>
                                                  p0.id ==
                                                  int.parse(controller
                                                          .locationDetails
                                                          .value
                                                          .state ??
                                                      "0"))
                                              .first
                                              .name
                                          : null
                                      : "",
                              onChanged: (value) {
                                controller.onStateChanged(value, true);
                              },
                            ),
                          if (controller.states.isNotEmpty)
                            MyFormField(
                              fieldName: translations.city.tr,
                              // showFieldName: false,
                              type: InputType.DROP_DOWN,
                              keyboard: TextInputType.text,
                              required: true,
                              dropDownOptions: controller.cities
                                  .map((element) => element.name)
                                  .toList(),
                              initialValue:
                                  (controller.locationDetails.value.city ??
                                              "") !=
                                          ""
                                      ? controller.cities
                                              .where((p0) =>
                                                  p0.id ==
                                                  int.parse(controller
                                                          .locationDetails
                                                          .value
                                                          .city ??
                                                      "0"))
                                              .isNotEmpty
                                          ? controller.cities
                                              .where((p0) =>
                                                  p0.id ==
                                                  int.parse(controller
                                                          .locationDetails
                                                          .value
                                                          .city ??
                                                      "0"))
                                              .first
                                              .name
                                          : null
                                      : null,
                              onChanged: (value) {
                                controller.onCityChanged(value, true);
                              },
                            ),
                        ],
                      ),
                    ),
                    MyFormField(
                      fieldName: translations.address.tr,
                      // showFieldName: false,
                      type: InputType.TEXT,
                      keyboard: TextInputType.text,
                      required: true,
                      initialValue: controller.locationDetails.value.address,
                      onChanged: (value) {
                        controller.locationDetails.value.address = value;
                      },
                    ),
                    // MyFormField(
                    //   fieldName: "Mobile",
                    //   // showFieldName: false,
                    //   type: InputType.TEXT,
                    //   keyboard: TextInputType.phone,
                    //   required: true,
                    //   // initialValue:
                    //   // controller.uss.value.eatingHabbit,
                    //   onChanged: (value) {
                    //     // controller.uss.value.eatingHabbit = value;
                    //   },
                    // ),
                    // MyFormField(
                    //   fieldName: "Phone",
                    //   // showFieldName: false,
                    //   type: InputType.TEXT,
                    //   keyboard: TextInputType.phone,
                    //   required: true,
                    //   // initialValue:
                    //   // controller.lifestyleDetails.value.smokingHabbit,
                    //   onChanged: (value) {
                    //     // controller.lifestyleDetails.value.smokingHabbit = value;
                    //   },
                    // ),
                    MyFormField(
                      fieldName: translations.timeToCall.tr,
                      // showFieldName: false,
                      type: InputType.TEXT,
                      keyboard: TextInputType.text,
                      required: true,
                      initialValue: controller.locationDetails.value.timeToCall,
                      onChanged: (value) {
                        controller.locationDetails.value.timeToCall = value;
                      },
                    ),
                    MyFormField(
                      fieldName: translations.residence.tr,
                      // showFieldName: false,
                      type: InputType.DROP_DOWN,
                      keyboard: TextInputType.text,
                      required: true,
                      dropDownOptions: [
                        translations.nri.tr,
                        translations.citizen.tr
                      ],
                      initialValue: controller.locationDetails.value.residance,
                      onChanged: (value) {
                        controller.locationDetails.value.residance = value;
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
