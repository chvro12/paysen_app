import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../config/app_routes.dart';
import '../../../config/app_utils.dart';
import '../models/login_models.dart';
import '../repository/auth_repo.dart';
import 'otp_controller.dart';
import 'signup_controller.dart';

class LoginController extends GetxController with ProgressHUDMixin {

  final mobileNoController = TextEditingController();

  final AuthRepo _authRepo = AuthRepo();
  final RxBool shouldDisableBtn = RxBool(true);
  LoginModels? checkMobileResponse;

  @override
  void onInit() {
    super.onInit();
    mobileNoController.addListener(_onTextChangeListener);
  }

  @override
  void onClose() {
    super.onClose();
    mobileNoController.removeListener(_onTextChangeListener);
    mobileNoController.dispose();
  }

  void _onTextChangeListener() {
    shouldDisableBtn.value = mobileNoController.text.length < 9;
    update();
  }

  void resetLoginControllerDefaultValues() {
    mobileNoController.clear();
  }

  void onSignupPressed(BuildContext context) {
    resetLoginControllerDefaultValues();
    Get.delete<SignupController>();
    Navigator.pushNamed(context, AppRoutes.signupRoute);
  }

  Future<void> onLoginPressed(BuildContext context, {bool navigateToOtpScreen = true, ValueChanged<LoginModels>? onResponseCheckMobile}) async {
    String phone = mobileNoController.text.trim();
    
    show(Get.context!);
    checkMobileResponse = await _authRepo.checkMobile('221', phone);
    if (onResponseCheckMobile != null) {
      onResponseCheckMobile(checkMobileResponse!); 
    }
    dismiss(Get.context!);
    ToastUtils.showToast(checkMobileResponse!.message);
    if (!checkMobileResponse!.isSuccess) return;
    if (!navigateToOtpScreen) return;
    Get.delete<OtpController>();
    Navigator.pushNamed(Get.context!, AppRoutes.otpRoute);
  }
}