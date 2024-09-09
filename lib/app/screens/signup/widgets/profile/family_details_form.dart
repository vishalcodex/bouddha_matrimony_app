import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../../../common/color_pallete.dart';
import '../../../../components/ui/text_view.dart';
import '../../controllers/sign_up_controller.dart';
import '../form_fields.dart';

import '../../../../../../../common/transalations/translation_keys.dart'
    as translations;

class FamilyDetailsForm extends GetView<SignUpController> {
  const FamilyDetailsForm({super.key});

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
                key: controller.familyDetailsFormKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextView(
                      text: translations.familyDetails.tr,
                      color: ColorPallete.secondary,
                      fontSize: 18,
                      weight: FontWeight.bold,
                    ),
                    SizedBox(
                      height: 10 * fem,
                    ),
                    MyFormField(
                      fieldName: translations.familyType.tr,
                      // showFieldName: false,
                      type: InputType.DROP_DOWN,
                      keyboard: TextInputType.text,
                      required: true,
                      dropDownOptions: [
                        translations.joint.tr,
                        translations.nuclear.tr
                      ],
                      initialValue: controller.familyDetails.value.familyType,
                      onChanged: (value) {
                        controller.familyDetails.value.familyType = value;
                      },
                    ),
                    MyFormField(
                      fieldName: translations.fathersName.tr,
                      // showFieldName: false,
                      type: InputType.TEXT,
                      keyboard: TextInputType.text,
                      required: true,
                      initialValue: controller.familyDetails.value.fathersName,
                      onChanged: (value) {
                        controller.familyDetails.value.fathersName = value;
                      },
                    ),
                    MyFormField(
                      fieldName: translations.fathersOccupation.tr,
                      // showFieldName: false,
                      type: InputType.TEXT,
                      keyboard: TextInputType.text,
                      required: true,
                      initialValue:
                          controller.familyDetails.value.fathersOccupation,
                      onChanged: (value) {
                        controller.familyDetails.value.fathersOccupation =
                            value;
                      },
                    ),
                    MyFormField(
                      fieldName: translations.mothersName.tr,
                      // showFieldName: false,
                      type: InputType.TEXT,
                      keyboard: TextInputType.text,
                      required: true,
                      initialValue: controller.familyDetails.value.mothersName,
                      onChanged: (value) {
                        controller.familyDetails.value.mothersName = value;
                      },
                    ),
                    MyFormField(
                      fieldName: translations.mothersOccupation.tr,
                      // showFieldName: false,
                      type: InputType.TEXT,
                      keyboard: TextInputType.text,
                      required: true,
                      initialValue:
                          controller.familyDetails.value.mothersOccupation,
                      onChanged: (value) {
                        controller.familyDetails.value.mothersOccupation =
                            value;
                      },
                    ),
                    MyFormField(
                      fieldName: translations.noOfBrothers.tr,
                      // showFieldName: false,
                      type: InputType.TEXT,
                      keyboard: TextInputType.number,
                      required: true,
                      initialValue: controller.familyDetails.value.noOfBrothers,
                      onChanged: (value) {
                        controller.familyDetails.value.noOfBrothers = value;
                      },
                    ),
                    MyFormField(
                      fieldName: translations.noOfMarriedBrothers.tr,
                      // showFieldName: false,
                      type: InputType.TEXT,
                      keyboard: TextInputType.number,
                      required: true,
                      initialValue:
                          controller.familyDetails.value.noOfMarriedBrothers,
                      onChanged: (value) {
                        controller.familyDetails.value.noOfMarriedBrothers =
                            value;
                      },
                    ),
                    MyFormField(
                      fieldName: translations.noOfSisters.tr,
                      // showFieldName: false,
                      type: InputType.TEXT,
                      keyboard: TextInputType.number,
                      required: true,
                      initialValue: controller.familyDetails.value.noOfSisters,
                      onChanged: (value) {
                        controller.familyDetails.value.noOfSisters = value;
                      },
                    ),
                    MyFormField(
                      fieldName: translations.noOfMarriedSisters.tr,
                      // showFieldName: false,
                      type: InputType.TEXT,
                      keyboard: TextInputType.number,
                      required: true,
                      initialValue:
                          controller.familyDetails.value.noOfMarriedSisters,
                      onChanged: (value) {
                        controller.familyDetails.value.noOfMarriedSisters =
                            value;
                      },
                    ),
                    MyFormField(
                      fieldName: translations.abtMyFamily.tr,
                      // showFieldName: false,
                      type: InputType.TEXT,
                      keyboard: TextInputType.text,
                      required: true,
                      initialValue: controller.familyDetails.value.aboutFamily,
                      onChanged: (value) {
                        controller.familyDetails.value.aboutFamily = value;
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