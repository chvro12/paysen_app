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
  
  final LoginController _loginController = Get.find();
  final TextEditingController otpController = TextEditingController();
  LoginModels? _loginModels;
  String mobileNoWithCountryCode = '';

  @override
  void onInit() {
    super.onInit();
    if (_loginController.checkMobileResponse != null) {
      _loginModels = _loginController.checkMobileResponse;
      mobileNoWithCountryCode = '+${_loginModels!.userModels!.countryCode}${_loginModels!.userModels!.phone}';
    }
  }

  @override
  void onClose() {
    otpController.dispose();
    super.onClose();
  }

  String? onOtpValidate(String? value) {
    if (_loginModels == null) return null;
    String serverOtp = _loginModels!.userModels!.otp!.trim();
    if (value != null && serverOtp.compareTo(value.trim()) != 0) {
      return 'otp_mismatch_description'.tr;
    }
    return null;
  }
  
  Future<void> onOtpSubmitted(String val) async {
    if (onOtpValidate(val) == null) {
      if (_loginModels?.userModels == null || _loginModels?.userModels!.otp == null) return;
      if (_loginModels?.userType == UserType.oldUser) {
        final value = jsonEncode(_loginModels?.userModels?.toSecondJson());
        await SharedPrefService.setUserAuthentication(value);
        Navigator.pushNamedAndRemoveUntil(Get.context!, AppRoutes.dashboard, (route) => false);
      } else {
        Navigator.pushNamed(Get.context!, AppRoutes.signupRoute, arguments: _loginModels!);
      }
    }
  }

  Future<void> onOtpResend(BuildContext context) async {
    if (_loginModels?.userModels == null) return;

    FocusScope.of(context).unfocus();
    FocusManager.instance.primaryFocus?.unfocus();
    
    LoginController loginController = Get.find();
    loginController.mobileNoController.text = _loginModels!.userModels!.phone;

    loginController.onLoginPressed(context, navigateToOtpScreen: false, onResponseCheckMobile: (val) {
      if (val.isSuccess) {
        otpController.clear();
        _loginModels = val;
      }
    });
  }
}