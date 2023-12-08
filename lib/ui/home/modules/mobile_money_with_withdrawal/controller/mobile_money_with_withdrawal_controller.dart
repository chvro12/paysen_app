import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../config/app_assets.dart';
import '../../../../../config/app_logger.dart';
import '../../../../../config/app_utils.dart';
import '../../../../../main.dart';
import '../../../../dashboard/controller/dashboard_controller.dart';
import '../../../repository/mobile_money_withdraw_repo.dart';

class MobileMoneyWithWithdrawalController extends GetxController with ProgressHUDMixin {

  final mobileNoController = TextEditingController();
  final amountController = TextEditingController();

  final RxList<Map<String, String>> paymentTypeItemList = <Map<String, String>>[
    {
      'assetIMG': AppAssets.orangeMoneyImage,
      'label': 'orange_money'
    },
    {
      'assetIMG': AppAssets.waveImage,
      'label': 'wave'
    }
  ].obs;

  final RxString selectedPaymentType = RxString('orange_money');
  final RxString reactiveAmount = RxString('0');

  @override
  void onInit() {
    super.onInit();
    final DashboardController dashboardController = Get.find();
    if (dashboardController.profileModels.value != null) {
      mobileNoController.text = dashboardController.profileModels.value!.userModels.phone;
    }
  }

  @override
  void onClose() {
    mobileNoController.dispose();
    amountController.dispose();
    super.onClose();
  }

  void onAmountChange(String value) {
    reactiveAmount.value = value.trim().isEmpty ? '0' : value.trim();
  }

  void onPaymentTypeChange(String value) {
    selectedPaymentType.value = value;
  }

  Future<void> sendWithdrawalRequest() async {
    final String amount = amountController.text.trim();
    if (amount.isEmpty) {
      ToastUtils.showToast('amount_empty_message');
      return;
    }


    show(Get.context!);
    
    try {

      final MobileMoneyWithdrawRepo mobileMoneyWithdrawRepo = MobileMoneyWithdrawRepo();
      final value = await mobileMoneyWithdrawRepo.createWithdrawRequest(amount, selectedPaymentType.value.tr);
      if (value != null) {
        if (value.isSuccess) {
          walletNavigatorKey.currentState?.pop();
          amountController.clear();
          reactiveAmount.value = '0';
          selectedPaymentType.value = 'orange_money';
        }
        ToastUtils.showToast(value.message);
      }

    } catch (e) {
      AppLogger.e('exception (sendWithdrawalRequest): $e', e, className: 'MobileMoneyWithWithdrawalController', methodName: 'sendWithdrawalRequest()');
    } finally {
      dismiss(Get.context!);
    }
  }
}