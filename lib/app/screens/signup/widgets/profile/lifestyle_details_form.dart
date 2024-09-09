import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/color_pallete.dart';
import '../../../../components/ui/text_view.dart';
import '../../controllers/sign_up_controller.dart';
import '../form_fields.dart';

import '../../../../../../../common/transalations/translation_keys.dart'
    as translations;

class LifestyleDetailsForm extends GetView<SignUpController> {
  const LifestyleDetailsForm({super.key});

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
                key: controller.lifestyleDetailsFormKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: TextView(
                        text: translations.lifestyleDetails.tr,
                        color: ColorPallete.secondary,
                        fontSize: 18,
                        weight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 30 * fem,
                    ),
                    MyFormField(
                      fieldName: translations.bodyType.tr,
                      // showFieldName: false,
                      type: InputType.DROP_DOWN,
                      keyboard: TextInputType.text,
                      required: true,
                      dropDownOptions: controller.bodyTypes,
                      initialValue: controller.lifestyleDetails.value.bodyType,
                      onChanged: (value) {
                        controller.lifestyleDetails.value.bodyType = value;
                      },
                    ),
                    MyFormField(
                      fieldName: translations.skinTone.tr,
                      // showFieldName: false,
                      type: InputType.DROP_DOWN,
                      keyboard: TextInputType.text,
                      required: true,
                      dropDownOptions: controller.skinTones,
                      initialValue: controller.lifestyleDetails.value.skinTone,
                      onChanged: (value) {
                        controller.lifestyleDetails.value.skinTone = value;
                      },
                    ),
                    MyFormField(
                      fieldName: translations.bloodGrp.tr,
                      // showFieldName: false,
                      type: InputType.DROP_DOWN,
                      dropDownOptions: const [
                        "A+",
                        "A-",
                        "B+",
                        "B-",
                        "AB+",
                        "AB-",
                        "O+",
                        "O-"
                      ],
                      keyboard: TextInputType.text,
                      required: true,
                      initialValue:
                          controller.lifestyleDetails.value.bloodGroup,
                      onChanged: (value) {
                        controller.lifestyleDetails.value.bloodGroup = value;
                      },
                    ),
                    MyFormField(
                      fieldName: translations.eatingHabit.tr,
                      // showFieldName: false,
                      type: InputType.DROP_DOWN,
                      keyboard: TextInputType.text,
                      required: true,
                      dropDownOptions: controller.eatingHabits,
                      initialValue:
                          controller.lifestyleDetails.value.eatingHabbit,
                      onChanged: (value) {
                        controller.lifestyleDetails.value.eatingHabbit = value;
                      },
                    ),
                    MyFormField(
                      fieldName: translations.smokingHabit.tr,
                      // showFieldName: false,
                      type: InputType.DROP_DOWN,
                      keyboard: TextInputType.text,
                      required: true,
                      dropDownOptions: [
                        translations.yes.tr,
                        translations.no.tr
                      ],
                      initialValue:
                          controller.lifestyleDetails.value.smokingHabbit,
                      onChanged: (value) {
                        controller.lifestyleDetails.value.smokingHabbit = value;
                      },
                    ),
                    MyFormField(
                      fieldName: translations.drinkingHabit.tr,
                      // showFieldName: false,
                      type: InputType.DROP_DOWN,
                      keyboard: TextInputType.text,
                      dropDownOptions: [
                        translations.yes.tr,
                        translations.no.tr
                      ],
                      required: true,
                      initialValue:
                          controller.lifestyleDetails.value.drinkingHabbit,
                      onChanged: (value) {
                        controller.lifestyleDetails.value.drinkingHabbit =
                            value;
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
