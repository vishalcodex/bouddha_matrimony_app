import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/api_response.dart';
import '../../../models/package_model.dart';
import '../../../models/user_model.dart';
import '../../../repositories/settings_repository.dart';
import '../../../services/auth_service.dart';
import '../../../services/phonepe_gateway_service.dart';

class SettingsController extends GetxController {
  late SettingsRepository _settingsRepository;
  SettingsController() {
    _settingsRepository = SettingsRepository();
  }

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  void fetchData() {
    fetchPackages();
  }

  RxInt selectedPage = 1.obs;

  RxList<Package> packages = <Package>[].obs;

  void fetchPackages() async {
    await _settingsRepository.fetchPackages().then((value) {
      if (value.status == Status.COMPLETED) {
        packages.value = value.data;
      }
    });
  }

  void makePayment(BuildContext context, Package package) {
    // RazorpayPG.getInstance.razorpayPayment("orderID");
    User user = Get.find<AuthService>().user.value;
    PhonePePG().getInstance.startPGTransaction(
        context,
        package.packAmmount.toString(),
        int.parse(Get.find<AuthService>().token!.replaceAll("BL", "")),
        user.mobile ?? "84595 10732");
  }
}
