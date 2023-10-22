
import 'package:paysen/config/app_enums.dart';

class CardDetailModel {
  final int id;
  final int userId;
  final String cardHolderId;
  final String cardId;
  final String? cardNumber;
  final String? cvc;
  final String expMonth;
  final String expYear;
  final String? pin;
  final String brand;
  final String currency;
  final String spendingLimitAmount;
  final String type;
  final int status;
  final DateTime createdAt;
  final DateTime? updatedAt;

  CardDetailModel({required this.brand, required this.cardHolderId, required this.cardId, this.cardNumber,
  required this.createdAt, required this.currency, this.cvc, required this.expMonth,
  required this.expYear, required this.id, this.pin, required this.spendingLimitAmount, 
  required this.status, required this.type, this.updatedAt, required this.userId});

  factory CardDetailModel.fromJson(Map<String, dynamic> data) {
    return CardDetailModel(
      brand: data['brand'], 
      cardHolderId: data['card_holder_id'], 
      cardId: data['card_id'], 
      createdAt: (data['created_at'] as String).stringUtcToDateTime!, 
      currency: data['currency'], 
      expMonth: data['exp_month'], 
      expYear: data['exp_year'], 
      id: data['id'], 
      pin: data['pin'], 
      spendingLimitAmount: data['spending_limit_amount'], 
      status: data['status'], 
      type: data['type'], 
      userId: data['user_id'],
      cardNumber: data['card_number'],
      cvc: data['cvc'],
      updatedAt: (data['updated_at'] as String?).stringUtcToDateTime
    );
  }
}