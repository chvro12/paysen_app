import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:paysen/config/app_routes.dart';

import '../../../config/app_utils.dart';
import '../repository/login_repo.dart';

class LoginController extends GetxController with ProgressHUDMixin {

  final mobileNoController = TextEditingController();

  final LoginRepo _loginRepo = LoginRepo();
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
    
    show(context);
    final checkMobileResponse = await _loginRepo.checkMobile('221', phone);
    dismiss();
    if (!checkMobileResponse.isSuccess) {
      ToastUtils.showToast(checkMobileResponse.message);
      return;
    }
    Navigator.pushNamed(Get.context!, AppRoutes.otpRoute, arguments: checkMobileResponse);
  }
}