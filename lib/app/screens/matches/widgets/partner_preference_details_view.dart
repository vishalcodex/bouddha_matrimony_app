import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/color_pallete.dart';
import '../../../components/ui/my_list_view.dart';
import '../../../components/ui/rounded_container.dart';
import '../../../components/ui/text_view.dart';
import '../../../models/partner_preference_model.dart';
import '../controllers/match_controller.dart';
import 'entry_widget.dart';
import '../../../../../../../common/transalations/translation_keys.dart'
    as translations;

class PartnerPreferenceDetailView extends GetView<MatchController> {
  const PartnerPreferenceDetailView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    BasicPreference basicPreference = BasicPreference.fromJson(
        controller.selectedProfile.value.partnerPreferance?.toJson() ?? {});
    // ReligiousPreference religiousPreference = ReligiousPreference.fromJson(
    //     controller.selectedProfile.value.partnerPreferance?.toJson() ?? {});
    LocationPreference locationPreference = LocationPreference.fromJson(
        controller.selectedProfile.value.partnerPreferance?.toJson() ?? {});
    EducationPreference educationPreference = EducationPreference.fromJson(
        controller.selectedProfile.value.partnerPreferance?.toJson() ?? {});
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: 10.0 * fem, vertical: 7.5 * fem),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10 * fem),
            boxShadow: [
              BoxShadow(
                  blurRadius: 15 * fem,
                  spreadRadius: 2 * fem,
                  color: ColorPallete.grey.withOpacity(0.2),
                  offset: Offset(0, 5 * fem))
            ]),
        child: Padding(
          padding: EdgeInsets.all(5.0 * fem),
          child: RoundedContainer(
            radius: 10,
            color: ColorPallete.theme,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 15 * fem, vertical: 10 * fem),
              child: MyListView(
                scroll: true,
                children: [
                  TextView(
                    text: "${translations.basicPref.tr} :-",
                    fontSize: 14,
                    weight: FontWeight.bold,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5 * fem),
                    child: MyListView(
                      children: [
                        EntryWidget(
                          title: translations.lookingFor.tr,
                          value: basicPreference.lookingFor,
                        ),
                        EntryWidget(
                          title: translations.skinTone.tr,
                          value: basicPreference.skinTone,
                        ),
                        EntryWidget(
                          title: translations.age.tr,
                          value:
                              "${basicPreference.fromAge} to ${basicPreference.toAge} Yrs",
                        ),
                        EntryWidget(
                          title: translations.height.tr,
                          value:
                              "${basicPreference.fromHeight} - ${basicPreference.toHeight}",
                        ),
                        EntryWidget(
                          title: translations.mothertounge.tr,
                          value: basicPreference.mothertounge,
                        ),
                        EntryWidget(
                          title: translations.eatingHabit.tr,
                          value: basicPreference.eatingHabit,
                        ),
                        EntryWidget(
                          title: translations.smokingHabit.tr,
                          value: basicPreference.drinkingHabit,
                        ),
                        EntryWidget(
                          title: translations.drinkingHabit.tr,
                          value: basicPreference.drinkingHabit,
                        ),
                        EntryWidget(
                          title: translations.genralExpectation.tr,
                          value: basicPreference.generalExpt,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5 * fem,
                  ),
                  TextView(
                    text: "${translations.locationPref.tr} :-",
                    fontSize: 14,
                    weight: FontWeight.bold,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5 * fem),
                    child: MyListView(
                      children: [
                        EntryWidget(
                          title: translations.country.tr,
                          value: locationPreference.country,
                        ),
                        EntryWidget(
                          title: translations.state.tr,
                          value: locationPreference.state,
                        ),
                        EntryWidget(
                          title: translations.city.tr,
                          value: locationPreference.city,
                        ),
                        EntryWidget(
                          title: translations.residence.tr,
                          value: locationPreference.residence,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5 * fem,
                  ),
                  TextView(
                    text: "${translations.educationOccup.tr} :-",
                    fontSize: 14,
                    weight: FontWeight.bold,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5 * fem),
                    child: MyListView(
                      children: [
                        EntryWidget(
                          title: translations.education.tr,
                          value: educationPreference.education,
                        ),
                        EntryWidget(
                          title: translations.occupation.tr,
                          value: educationPreference.occupation,
                        ),
                        EntryWidget(
                          title: translations.annualIncome.tr,
                          value: educationPreference.annualIncome,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
