import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../config/app_logger.dart';
import '../../../../../config/app_utils.dart';
import '../../../../dashboard/controller/dashboard_controller.dart';
import '../../checkout/checkout_screen.dart';

class MobileMoneyBankCardController extends GetxController {

  final mobileNoController = TextEditingController();
  final amountController = TextEditingController();

  RxBool isUpdatingMobileNo = RxBool(false);
  
  @override
  void onInit() {
    _initialize();
    super.onInit();
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

  Future<void> _initialize() async {
    final DashboardController dashboardController = Get.find();
    if (dashboardController.profileModels.value != null) {
      mobileNoController.text = dashboardController.profileModels.value!.userModels.phone;
    }
  }

  Future<void> onAddMoneyPressed(BuildContext context) async {
    final newAmount = amountController.text.trim();
    final mobileNo = mobileNoController.text;

    if (mobileNo.isEmpty) {
      ToastUtils.showToast('mobile_no_empty_message');
      return;
    }

    if (newAmount.isEmpty) {
      ToastUtils.showToast('amount_empty_message');
      return;
    }

    try {
      
      double amount = double.parse(newAmount);

      if (amount < 100) {
        ToastUtils.showToast('amount_greater_message');
        return;
      }

      if (amount > 1500000) {
        ToastUtils.showToast('amount_lesser_message');
        return;
      }

      await Get.to(() => CheckoutScreen(amount: amount,));

    } catch (exception) {
      AppLogger.e(exception.toString(), exception, className: 'MobileMoneyBankCardController', methodName: 'onAddMoneyPressed');
    }
  }
}