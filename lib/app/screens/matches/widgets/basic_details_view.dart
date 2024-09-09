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

class BasicDetailsView extends GetView<MatchController> {
  const BasicDetailsView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    BasicDetails profile =
        BasicDetails.fromJson(controller.selectedProfile.value.toJson());

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
                  EntryWidget(title: "ID", value: profile.id),
                  EntryWidget(
                    title: translations.name.tr,
                    value:
                        "${profile.name.toString().split(" ")[0].capitalize} ${profile.name.toString().split(" ").length > 2 ? profile.name.toString().split(" ")[2].substring(0, 1) : profile.name.toString().split(" ").length > 1 ? profile.name.toString().split(" ")[1].substring(0, 1).capitalize! : ""}",
                  ),
                  EntryWidget(
                      title: translations.mothertounge.tr,
                      value: profile.mothertounge),
                  EntryWidget(
                      title: translations.maritalStatus.tr,
                      value: profile.maritalStatus),
                  EntryWidget(
                      title: translations.dateOfBirth.tr, value: profile.dOB),
                  EntryWidget(
                      title: translations.birthPlace.tr,
                      value: profile.birthplace),
                  EntryWidget(
                      title: translations.birthTime.tr,
                      value: profile.birthtime),
                  EntryWidget(
                      title: translations.gender.tr, value: profile.gender),
                  EntryWidget(
                      title: translations.height.tr, value: profile.height),
                  EntryWidget(
                      title: translations.languages.tr,
                      value: profile.languages),
                  EntryWidget(
                      title: translations.hobbies.tr, value: profile.hobbies),
                  EntryWidget(
                      title: translations.weight.tr, value: profile.weight),
                  EntryWidget(
                      title: translations.noChilderen.tr,
                      value: profile.noofchildren),

                  // EntryWidget(title: "Weight", value: profile.weight),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
