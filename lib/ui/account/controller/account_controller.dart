import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paysen/config/app_utils.dart';

import '../models/profile_models.dart';
import '../repository/account_repo.dart';

class AccountController extends GetxController with ProgressHUDMixin {

  final AccountRepo _accountRepo = AccountRepo();
  Rxn<ProfileModels> profileDetails = Rxn();
  
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
    profileDetails.value = await _accountRepo.getProfile();
    update();
  }
  
  void onAccountUserTypeChanged(String value) {
    selectedUserType.value = value;
    update();
  }
}