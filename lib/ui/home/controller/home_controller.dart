import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../config/app_utils.dart';
import '../../account/models/profile_models.dart';
import '../../account/repository/account_repo.dart';

class HomeController extends GetxController with ProgressHUDMixin {
  
  final AccountRepo _accountRepo = AccountRepo();
  Rxn<ProfileModels> profileDetails = Rxn();

  /// Dummy data
  List<Map<String, dynamic>> dummyTransaction = [
    {
      'type': 'Withdrawal',
      'amount': -5100
    },
    {
      'type': 'Topup',
      'amount': 450
    },
    {
      'type': 'Topup',
      'amount': 500
    },
    {
      'type': 'Topup',
      'amount': 51
    },
    {
      'type': 'Withdrawal',
      'amount': -51
    },
    {
      'type': 'Withdrawal',
      'amount': -100
    },
    {
      'type': 'Topup',
      'amount': 1000
    },
  ];
  
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
}