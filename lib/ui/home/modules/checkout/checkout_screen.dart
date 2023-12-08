import 'package:cinetpay/cinetpay.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../components/index.dart';
import '../../../../config/app_logger.dart';
import 'controller/checkout_controller.dart';

class CheckoutScreen extends StatelessWidget {

  final double amount;

  const CheckoutScreen({super.key, required this.amount});

  @override
  Widget build(BuildContext context) {
    final checkoutController = Get.put(CheckoutController());
    return Obx(() => CinetPayCheckout(
      title: 'Payment Checkout',
      titleStyle: TextStyle(
        fontSize: 20.sp, 
        fontWeight: FontWeight.bold,  
      ),
      titleBackgroundColor: Colors.green,
      configData: <String, dynamic>{
        'apikey': '20406924776422db3d38ecf2.27061316',
        'site_id': int.parse('264149'),
        'notify_url': 'https://www.google.com/'
      },
      paymentData: <String, dynamic>{
        'transaction_id': checkoutController.transactionId.value,
        'amount': amount,
        'currency': 'XOF',
        'channels': 'ALL',
        'description': '**Top up your card effortlessly by logging in, selecting "Add Funds," and specifying the amount. Complete the secure transaction, and enjoy immediate access to your updated balance for smooth transactions.**',
      },
      onError: (Map<String, dynamic> error) {
        AppLogger.e(error.toString(), error, className: 'CheckoutScreen', methodName: 'onError');
        showDialog(
          context: context,
          builder: (context) => EndpointReqFailDialog(
            description: error.containsKey('message')
            ? error['message']
            : error.containsKey('description')
            ? error['description']
            : '', 
            title: 'Error',
            onBtnPressed: () => Navigator.pop(context),
          ),
        );
      },
      waitResponse: (Map<String, dynamic> response) {
        AppLogger.d('wait response: $response', className: 'CheckoutScreen', methodName: 'waitResponse');
        checkoutController.addFundToCard((bool value) {
          if (value) {
            showDialog(
              context: context,
              builder: (context) => EndpointReqFailDialog(
                description: 'Fund added to card successfully.', 
                title: 'Success',
                onBtnPressed: () => Navigator.pop(context),
              )
            );
          }
        },amount.round().toString());
      },
    ));
  }
}