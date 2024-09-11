import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/color_pallete.dart';
import '../../../components/ui/my_list_view.dart';
import '../../../components/ui/rounded_container.dart';
import '../../../models/user_model.dart';
import '../controllers/match_controller.dart';
import 'entry_widget.dart';

import '../../../../../../../common/transalations/translation_keys.dart'
    as translations;

class FamilyDetailsView extends GetView<MatchController> {
  const FamilyDetailsView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    FamilyDetails profile =
        FamilyDetails.fromJson(controller.selectedProfile.value.toJson());
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
                  EntryWidget(
                      title: translations.familyType.tr,
                      value: profile.familyType),
                  EntryWidget(
                      title: translations.fathersName.tr,
                      value: profile.fathersName),
                  EntryWidget(
                      title: translations.fathersOccupation.tr,
                      value: profile.fathersOccupation),
                  EntryWidget(
                      title: translations.mothersName.tr,
                      value: profile.mothersName),
                  EntryWidget(
                      title: translations.mothersOccupation.tr,
                      value: profile.mothersOccupation),
                  EntryWidget(
                      title: translations.noOfBrothers.tr,
                      value: profile.noOfBrothers),
                  EntryWidget(
                      title: translations.noOfMarriedBrothers.tr,
                      value: profile.noOfMarriedBrothers),
                  EntryWidget(
                      title: translations.noOfSisters.tr,
                      value: profile.noOfSisters),
                  EntryWidget(
                      title: translations.noOfMarriedSisters.tr,
                      value: profile.noOfMarriedSisters),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
