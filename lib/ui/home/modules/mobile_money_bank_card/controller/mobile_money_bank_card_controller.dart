import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MobileMoneyBankCardController extends GetxController {

  final TextEditingController amountController = TextEditingController();
  
  @override
  void onClose() {
    amountController.dispose();
    super.onClose();
  }

  void onMobileNoChange() {

  }

  void onAmountChange(String value) {

  }

}