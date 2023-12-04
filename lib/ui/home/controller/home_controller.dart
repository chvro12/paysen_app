import 'package:get/get.dart';

import '../../../config/app_utils.dart';

class HomeController extends GetxController with ProgressHUDMixin {

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
}