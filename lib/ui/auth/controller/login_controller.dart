import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../config/app_routes.dart';
import '../../../config/app_utils.dart';
import '../repository/auth_repo.dart';

class LoginController extends GetxController with ProgressHUDMixin {

  final mobileNoController = TextEditingController();

  final AuthRepo _authRepo = AuthRepo();
  final RxBool shouldDisableBtn = RxBool(true);

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

  Future<void> onLoginPressed(BuildContext context) async {
    String phone = mobileNoController.text.trim();
    
    show();
    final checkMobileResponse = await _authRepo.checkMobile('221', phone);
    dismiss();
    ToastUtils.showToast(checkMobileResponse.message);
    if (!checkMobileResponse.isSuccess) return;
    Navigator.pushNamed(Get.context!, AppRoutes.otpRoute, arguments: checkMobileResponse);
  }
}