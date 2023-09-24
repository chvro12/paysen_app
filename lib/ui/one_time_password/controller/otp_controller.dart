import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paysen/config/app_routes.dart';

class OtpController extends GetxController {
  

  Future<void> onOtpSubmitted(String otp, String mobileNoWithCountryCode) async {
    Navigator.pushNamed(Get.context!, AppRoutes.signupRoute, arguments: mobileNoWithCountryCode);
  }

  Future<void> onOtpResend() async {}
}