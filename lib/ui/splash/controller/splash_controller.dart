import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../config/app_routes.dart';
import '../../../services/shared_pref_service.dart';

class SplashController extends GetxController {

  @override
  void onInit() {
    super.onInit();
    Future.delayed(const Duration(seconds: 4))
    .whenComplete(() async {
      final bool value = (await SharedPrefService.userAuthentication) == null;
      String redirectRoute;
      if (value) {
        redirectRoute = AppRoutes.onboardRoute;
      } else {
        redirectRoute = AppRoutes.dashboard;
      }
      Navigator.pushReplacementNamed(Get.context!, redirectRoute);
    });
  }
}