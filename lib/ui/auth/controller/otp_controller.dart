import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../config/app_enums.dart';
import '../../../config/app_routes.dart';
import '../../../config/app_utils.dart';
import '../../../services/shared_pref_service.dart';
import 'login_controller.dart';
import '../models/login_models.dart';

class OtpController extends GetxController with ProgressHUDMixin {
  
  Future<void> onOtpSubmitted(LoginModels loginModels) async {
    if (loginModels.userModels == null || loginModels.userModels!.otp == null) return;

    if (loginModels.userType == UserType.oldUser) {
      final value = jsonEncode(loginModels.userModels?.toSecondJson());
      await SharedPrefService.setUserAuthentication(value);
      Navigator.pushNamedAndRemoveUntil(Get.context!, AppRoutes.dashboard, (route) => false);
    } else {
      Navigator.pushNamed(Get.context!, AppRoutes.signupRoute, arguments: loginModels);
    }
  }

  Future<void> onOtpResend(BuildContext context, LoginModels loginModels) async {
    if (loginModels.userModels == null) return;

    FocusScope.of(context).unfocus();
    FocusManager.instance.primaryFocus?.unfocus();
    
    LoginController loginController = Get.find();
    loginController.mobileNoController.text = loginModels.userModels!.phone;

    loginController.onLoginPressed(context);
  }
}