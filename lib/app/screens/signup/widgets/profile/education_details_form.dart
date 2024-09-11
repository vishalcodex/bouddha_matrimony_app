import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/color_pallete.dart';
import '../../../../components/ui/text_view.dart';
import '../../controllers/sign_up_controller.dart';
import '../form_fields.dart';

import '../../../../../../../common/transalations/translation_keys.dart'
    as translations;

class EducationDetailsForm extends GetView<SignUpController> {
  const EducationDetailsForm({super.key});

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
                key: controller.educationDetailsFormKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: TextView(
                        text: translations.educationOccup.tr,
                        color: ColorPallete.secondary,
                        fontSize: 18,
                        weight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 30 * fem,
                    ),
                    MyFormField(
                      fieldName: translations.education.tr,
                      // showFieldName: false,
                      type: InputType.MULTI_SELECT,
                      dropDownOptions: controller.educationalOptions
                          .map((element) => element.category)
                          .toList(),
                      keyboard: TextInputType.text,
                      required: true,
                      initialValue: controller.educationDetails.value.education,
                      onChanged: (value) {
                        controller.educationDetails.value.education = value;
                      },
                    ),
                    MyFormField(
                      fieldName: translations.occupation.tr,
                      // showFieldName: false,
                      type: InputType.TEXT,
                      keyboard: TextInputType.text,
                      required: true,
                      initialValue:
                          controller.educationDetails.value.occupation,
                      onChanged: (value) {
                        controller.educationDetails.value.occupation = value;
                      },
                    ),
                    MyFormField(
                      fieldName: translations.employeeIn.tr,
                      // showFieldName: false,
                      type: InputType.TEXT,
                      keyboard: TextInputType.text,
                      required: true,
                      initialValue:
                          controller.educationDetails.value.employeeIn,
                      onChanged: (value) {
                        controller.educationDetails.value.employeeIn = value;
                      },
                    ),
                    MyFormField(
                      fieldName: translations.designation.tr,
                      // showFieldName: false,
                      type: InputType.TEXT,
                      keyboard: TextInputType.text,
                      required: true,
                      initialValue:
                          controller.educationDetails.value.designation,
                      onChanged: (value) {
                        controller.educationDetails.value.designation = value;
                      },
                    ),
                    MyFormField(
                      fieldName: translations.annualIncome.tr,
                      // showFieldName: false,
                      type: InputType.DROP_DOWN,
                      keyboard: TextInputType.text,
                      required: true,
                      dropDownOptions: controller.annualIncome,
                      initialValue:
                          controller.educationDetails.value.annualIncome,
                      onChanged: (value) {
                        controller.educationDetails.value.annualIncome = value;
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
