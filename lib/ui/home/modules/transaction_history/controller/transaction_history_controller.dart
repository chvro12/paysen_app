import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paysen/config/app_enums.dart';

class TransactionHistoryController extends GetxController with GetSingleTickerProviderStateMixin {

  late TabController transactionTabController;

  List<String> transactionHistoryTab = [ 'All', 'Out', 'In' ];
  List<String> transactionHistoryFilter = ['Today', 'Yesterday', 'This month', 'Custom'];
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
    {
      'type': 'Topup',
      'amount': 100
    },
    {
      'type': 'Withdrawal',
      'amount': 450
    },
    {
      'type': 'Withdrawal',
      'amount': -10
    },
    {
      'type': 'Topup',
      'amount': 360
    },
    {
      'type': 'Withdrawal',
      'amount': -360
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

  RxInt selectedTab = RxInt(0);
  RxString selectedTransactionHistoryFilter = RxString('Today');
  RxString fromDate = RxString('August 18, 2022');
  RxString toDate = RxString('August 18, 2022');

  @override
  void onInit() {
    transactionTabController = TabController(length: 3, vsync: this);
    super.onInit();
  }

  void onTabChanged(int value) {
    selectedTab.value = value;
    transactionTabController.animateTo(value);
    update();
  }

  void onChangedTransactionHistoryFilter(String value) {
    selectedTransactionHistoryFilter.value = value;
    update();
  }

  @override
  void onClose() {
    transactionTabController.dispose();
    super.onClose();
  }

  Future<void> onFromDateSelect(BuildContext context) async {
    final dateTime = await _datePicker(context);
    if (dateTime != null) {
      fromDate.value = dateTime.humanReadableFormat('MMMM dd, yyyy');
      update();
    }
  }

  Future<void> onToDateSelect(BuildContext context) async {
    final dateTime = await _datePicker(context);
    if (dateTime != null) {
      toDate.value = dateTime.humanReadableFormat('MMMM dd, yyyy');
      update();
    }
  }

  Future<DateTime?> _datePicker(BuildContext context) async {
    return await showDatePicker(
      context: context, 
      initialDate: DateTime.now(), 
      firstDate: DateTime(1900), 
      lastDate: DateTime(DateTime.now().year + 1, DateTime.now().month + 1)
    );
  }
}