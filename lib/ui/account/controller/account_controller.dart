import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../config/app_logger.dart';
import '../../../config/app_routes.dart';
import '../../../config/app_utils.dart';
import '../../../main.dart';
import '../models/profile_models.dart';
import '../modules/change_language/controller/change_language_controller.dart';
import '../modules/change_plan/controller/change_plan_controller.dart';
import '../repository/account_repo.dart';

class AccountController extends GetxController with ProgressHUDMixin {

  final AccountRepo _accountRepo = AccountRepo();
  Rxn<ProfileModels> profileDetails = Rxn();
  
  final List<String> otherModulesList = [
    'profile_details',
    'change_plan',
    'select_language',
    'change_passcode',
    'invite_friends',
    'verification_status',
    'merchant_details',
    'request_crypto_account',
    'terms_and_conditions',
    'logout'
  ];
  final List<String> accountUserType = [ 'premium'.tr, 'active'.tr ];

  final selectedUserType = 'premium'.obs;

  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _initialize();
    });
  }

  Future _initialize() async {
    show(Get.context!);
    try {
      profileDetails.value = await _accountRepo.getProfile();
    } catch (e) {
      AppLogger.e('exception: $e', e, className: 'AccountController', methodName: '_initialize()');
    } finally {
      dismiss(Get.context!);
    }
  }
  
  void onAccountUserTypeChanged(String value) {
    selectedUserType.value = value;
    update();
  }

  Future<void> onOtherModuleSelect(String val) async {
    if (val == 'profile_details') {

    } else if (val == 'change_plan') {
      Get.delete<ChangePlanController>();
      await accountNavigatorKey.currentState?.pushNamed(AppRoutes.changePlan);
    } else if (val == 'select_language') {
      Get.delete<ChangeLanguageControler>();
      await accountNavigatorKey.currentState?.pushNamed(AppRoutes.changeLanguage);
    } else if (val == 'change_passcode') {

    } else if (val == 'invite_friends') {

    } else if (val == 'verification_status') {

    } else if (val == 'merchant_details') {

    } else if (val == 'request_crypto_account') {

    } else if (val == 'terms_and_conditions') {

    } else {

    }
    _initialize();
  }
}