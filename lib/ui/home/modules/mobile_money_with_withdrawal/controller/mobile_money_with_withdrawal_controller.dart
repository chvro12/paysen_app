import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MobileMoneyWithWithdrawalController extends GetxController {

  final amountController = TextEditingController();

  @override
  void onClose() {
    amountController.dispose();
    super.onClose();
  }

  void onAmountChange(String value) {
    
  }
}