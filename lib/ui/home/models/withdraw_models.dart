import 'package:paysen/config/app_enums.dart';

import '../../../models/common_api_response.dart';

class MainWithdrawModel extends CommonApiResponse {

  final num balance;
  final WithdrawRequestModel withdrawRequestModel;

  MainWithdrawModel(super.isSuccess, super.message, {required this.balance, required this.withdrawRequestModel});

  factory MainWithdrawModel.fromJson(Map<String, dynamic> data) {
    return MainWithdrawModel(
      data['is_success'], 
      data['message'], 
      balance: num.tryParse(data['data']['balance']) ?? 0.0, 
      withdrawRequestModel: WithdrawRequestModel.fromJson(data['data']['withdraw_request'])
    );
  }

}
class WithdrawRequestModel {

  final int userId;
  final String paymentType;
  final num amount;
  final String currency;
  final int status;
  final DateTime updatedAt;
  final DateTime createdAt;
  final int id;

  WithdrawRequestModel({required this.amount, required this.createdAt, required this.currency, 
  required this.id, required this.paymentType, required this.status, 
  required this.updatedAt, required this.userId});
  
  factory WithdrawRequestModel.fromJson(Map<String, dynamic> data) {
    return WithdrawRequestModel(
      amount: num.tryParse(data['amount']) ?? 0.0,
      createdAt: (data['created_at'] as String).stringUtcToDateTime ?? DateTime.now(),
      currency: data['currency'],
      id: data['id'],
      paymentType: data['payment_type'],
      status: data['status'],
      updatedAt: (data['updated_at'] as String).stringUtcToDateTime ?? DateTime.now(),
      userId: data['user_id'],
    );
  }
}