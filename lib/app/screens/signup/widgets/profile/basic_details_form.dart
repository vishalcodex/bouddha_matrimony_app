import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/color_pallete.dart';
import '../../../../components/ui/text_view.dart';
import '../../controllers/sign_up_controller.dart';
import '../form_fields.dart';
import '../../../../../../../common/transalations/translation_keys.dart'
    as translations;

class PersonalDetailsForm extends GetView<SignUpController> {
  const PersonalDetailsForm({super.key});

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
                key: controller.basicDetailsFormKey,
                child: Obx(
                  () => Column(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextView(
                        text: translations.basicDetails.tr,
                        color: ColorPallete.secondary,
                        fontSize: 18,
                        weight: FontWeight.bold,
                      ),
                      SizedBox(
                        height: 10 * fem,
                      ),
                      //NAME
                      MyFormField(
                        fieldName: translations.name.tr,
                        initialValue: controller.basicDetails.value.name,
                        type: InputType.TEXT,
                        keyboard: TextInputType.name,
                        required: true,
                        onChanged: (value) {
                          controller.basicDetails.value.name = value;
                        },
                      ),
                      //Height
                      MyFormField(
                        fieldName: translations.height.tr,
                        initialValue: controller.basicDetails.value.height,
                        type: InputType.DROP_DOWN,
                        keyboard: TextInputType.name,
                        required: true,
                        dropDownOptions: controller.heights,
                        // initialValue: controller.basicDetails.value,
                        onChanged: (value) {
                          controller.basicDetails.value.height = value;
                        },
                      ), //DOB
                      MyFormField(
                        fieldName: translations.dateOfBirth.tr,
                        type: InputType.DATE,
                        keyboard: TextInputType.name,
                        required: true,
                        initialValue: controller.basicDetails.value.dOB,
                        onChanged: (value) {
                          controller.basicDetails.value.dOB = value;
                        },
                      ),
                      //Maritial Status
                      MyFormField(
                        fieldName: translations.maritialStatus.tr,
                        type: InputType.DROP_DOWN,
                        keyboard: TextInputType.name,
                        required: true,
                        dropDownOptions: controller.maritialStatuses,
                        initialValue:
                            controller.basicDetails.value.maritalStatus,
                        onChanged: (value) {
                          controller.basicDetails.value.maritalStatus = value;
                        },
                      ),
                      //Hobbies
                      MyFormField(
                        fieldName: translations.hobbies.tr,
                        type: InputType.TEXT,
                        keyboard: TextInputType.name,
                        required: true,
                        initialValue: controller.basicDetails.value.hobbies,
                        onChanged: (value) {
                          controller.basicDetails.value.hobbies = value;
                        },
                      ),
                      //Weight
                      MyFormField(
                        fieldName: translations.weight.tr,
                        type: InputType.TEXT,
                        keyboard: TextInputType.name,
                        required: true,
                        initialValue: controller.basicDetails.value.weight,
                        onChanged: (value) {
                          controller.basicDetails.value.weight = value;
                        },
                      ),
                      //Birth Time
                      MyFormField(
                        fieldName: translations.birthTime.tr,
                        type: InputType.TEXT,
                        keyboard: TextInputType.name,
                        required: true,
                        initialValue: controller.basicDetails.value.birthtime
                            ?.replaceAll(" ", ""),
                        onChanged: (value) {
                          controller.basicDetails.value.birthtime = value;
                        },
                      ),
                      //No of Childern
                      MyFormField(
                        fieldName: translations.noChilderen.tr,
                        type: InputType.TEXT,
                        keyboard: TextInputType.number,
                        required: true,
                        initialValue:
                            controller.basicDetails.value.noofchildren,
                        onChanged: (value) {
                          controller.basicDetails.value.noofchildren = value;
                        },
                      ),
                      //Mothertounge
                      Obx(
                        () => MyFormField(
                          fieldName: translations.mothertounge.tr,
                          type: InputType.DROP_DOWN,
                          keyboard: TextInputType.name,
                          required: true,
                          dropDownOptions: controller.mothertounges
                              .map((element) => element.name)
                              .toList(),
                          initialValue:
                              controller.basicDetails.value.mothertounge,
                          onChanged: (value) {
                            controller.basicDetails.value.mothertounge = value;
                          },
                        ),
                      ),
                      //Languages
                      MyFormField(
                        fieldName: translations.languages.tr,
                        type: InputType.TEXT,
                        keyboard: TextInputType.name,
                        required: true,
                        initialValue: controller.basicDetails.value.languages,
                        onChanged: (value) {
                          controller.basicDetails.value.languages = value;
                        },
                      ),

                      //Birth Place
                      MyFormField(
                        fieldName: translations.birthPlace.tr,
                        type: InputType.TEXT,
                        keyboard: TextInputType.name,
                        required: true,
                        initialValue: controller.basicDetails.value.birthplace,
                        onChanged: (value) {
                          controller.basicDetails.value.birthplace = value;
                        },
                      ),
                      //Birth Place
                      MyFormField(
                        fieldName: translations.profileCreated.tr,
                        type: InputType.DROP_DOWN,
                        keyboard: TextInputType.name,
                        required: true,
                        dropDownOptions: controller.profileCreators,
                        initialValue: controller.basicDetails.value.createdBy,
                        onChanged: (value) {
                          controller.basicDetails.value.createdBy = value;
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
