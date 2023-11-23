import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paysen/config/app_utils.dart';

import '../../../../../models/stripe_credentials_models.dart';
import '../../../../account/repository/account_repo.dart';

class MobileMoneyBankCardController extends GetxController {

  StripeCredentialsModels? _stripeCredentialsModels;

  final mobileNoController = TextEditingController();
  final amountController = TextEditingController();

  RxBool isUpdatingMobileNo = RxBool(false);
  
  @override
  void onInit() {
    super.onInit();
    final AccountRepo accountRepo = AccountRepo();
    
    accountRepo.getStripeCredentials()
    .then((value) => _stripeCredentialsModels = value);

    mobileNoController.text = ' 78194324';
  }

  @override
  void onClose() {
    amountController.dispose();
    mobileNoController.dispose();
    super.onClose();
  }

  void onMobileNoChange() {
    final value = mobileNoController.text.trim();
    if (value.isEmpty) {
      ToastUtils.showToast('mobile_no_empty_message');
      return;
    }
    isUpdatingMobileNo.value = !isUpdatingMobileNo.value;
    update();
  }

  void onAmountChange(String value) {

  }

  Future<void> onAddMoneyPressed() async {
    if (_stripeCredentialsModels == null) return;

    final amount = amountController.text.trim();
    if (amount.isEmpty) {
      ToastUtils.showToast('amount_empty_message');
      return;
    }
  }
}