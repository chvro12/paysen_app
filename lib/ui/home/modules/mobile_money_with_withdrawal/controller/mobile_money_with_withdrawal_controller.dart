import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MobileMoneyWithWithdrawalController extends GetxController {

  final mobileNoController = TextEditingController();
  final amountController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    mobileNoController.text = ' 78194324';
  }

  @override
  void onClose() {
    mobileNoController.dispose();
    amountController.dispose();
    super.onClose();
  }

  void onAmountChange(String value) {
    
  }
}