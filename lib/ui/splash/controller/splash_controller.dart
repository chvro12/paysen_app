import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paysen/config/app_routes.dart';

class SplashController extends GetxController {

  @override
  void onInit() {
    super.onInit();
    Future.delayed(const Duration(seconds: 4))
    .whenComplete(() => Navigator.pushReplacementNamed(Get.context!, AppRoutes.onboardRoute));
  }


}