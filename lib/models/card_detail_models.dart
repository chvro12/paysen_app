import 'package:paysen/config/app_enums.dart';

class CardDetailModel {

  final String cardId;
  final String? cardNumber;
  final String expMonth;
  final String expYear;
  final String? cvv;
  final String? last4;
  final String cardCurrency;
  final String brand;
  final CardBillingAddress? cardBillingAddress;
  final String cardName;
  final String cardHolderId;
  final DateTime createdAt;
  final String issuingAppId;
  final String cardType;
  final bool isActive;
  final bool liveMode;
  final dynamic metaData;
  final bool pin3dsActivated;
  final dynamic insufficientFundsDeclineCount;
  final dynamic hasDoneDebitInAMonth;
  final String balance;

  CardDetailModel({required this.brand, required this.cardHolderId, required this.cardId, this.cardNumber,
  required this.createdAt, required this.expMonth, required this.expYear, this.cvv, 
  this.last4, required this.cardCurrency, required this.balance, this.cardBillingAddress,
  required this.cardName, required this.cardType, this.hasDoneDebitInAMonth, this.insufficientFundsDeclineCount,
  required this.isActive, required this.issuingAppId, required this.liveMode, this.metaData, 
  required this.pin3dsActivated});

  factory CardDetailModel.fromJson(Map<String, dynamic> data) {
    return CardDetailModel(
      cardId: data['card_id'],
      cardNumber: data.containsKey('card_number')
      ? data['card_number']
      : null,
      expMonth: data['expiry_month'], 
      expYear: data['expiry_year'],
      cvv: data['cvv'],
      last4: data.containsKey('last_4')
      ? data['last_4']
      : null,
      cardCurrency: data['card_currency'],
      brand: data['brand'], 
      cardBillingAddress: data.containsKey('billing_address')
      ? CardBillingAddress.fromJson(data['billing_address'])
      : null,
      cardName: data['card_name'],
      cardHolderId: data['cardholder_id'], 
      createdAt: (data['created_at'] as int).epochToDateTime,
      issuingAppId: data['issuing_app_id'],
      cardType: data['card_type'],
      isActive: data['is_active'],
      liveMode: data['livemode'],
      metaData: data['meta_data'],
      pin3dsActivated: data['pin_3ds_activated'],
      insufficientFundsDeclineCount: data['insufficient_funds_decline_count'],
      hasDoneDebitInAMonth: data['has_done_debit_in_a_month'],
      balance: data['balance']
    );
  }
}

class CardBillingAddress {

  final String? billingAddress1;
  final String? billingCity;
  final String? billingCountry;
  final String? billingZipCode;
  final String? countryCode;
  final String? state;
  final String? stateCode;

  CardBillingAddress({this.billingAddress1, this.billingCity, this.billingCountry, this.billingZipCode,
  this.countryCode, this.state, this.stateCode});

  factory CardBillingAddress.fromJson(Map<String, dynamic> data) {
    return CardBillingAddress(
      billingAddress1: data['billing_address1'],
      billingCity: data['billing_city'],
      billingCountry: data['billing_country'],
      billingZipCode: data['billing_zip_code'],
      countryCode: data['country_code'],
      state: data['state'],
      stateCode: data['state_code']
    );
  }
}