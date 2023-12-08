import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

import '../../../../../config/app_logger.dart';
import '../../../../../config/app_utils.dart';
import '../../../../../models/user_models.dart';
import '../../../repository/mobile_money_bank_card_repo.dart';

class CheckoutController extends GetxController with ProgressHUDMixin {
  
  final MobileMoneyBankCardRepo _mobileMoneyBankCardRepo = MobileMoneyBankCardRepo();

  Rxn<UserModels> userModels = Rxn(null);

  RxString transactionId = ''.obs;

  @override
  void onInit() {
    const uuid = Uuid();
    transactionId.value = uuid.v4();
    super.onInit();
  }

  Future<void> addFundToCard(ValueChanged<bool> onResponse, String amount) async {
    show(Get.context!);
    
    try {
      userModels.value = await _mobileMoneyBankCardRepo.createFundCard(amount, transactionId.value);
      if (userModels.value != null) {
        onResponse(true);
      }
    } catch (e) {
      AppLogger.e('exception (_initialize): $e', e, className: 'CheckoutController', methodName: '_initialize()');
    } finally {
      dismiss(Get.context!);
    }
  }
}