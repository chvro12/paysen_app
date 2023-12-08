// ignore_for_file: public_member_api_docs, sort_constructors_first

import '../../../config/app_enums.dart';
import '../../../models/common_api_response.dart';

class MainTransactionModel extends CommonApiResponse {

  final List<TransactionModel> userTransactionList;

  MainTransactionModel(
    super.isSuccess, 
    super.message, 
    {
      required this.userTransactionList
    }
  );

  factory MainTransactionModel.fromJson(Map<String, dynamic> data) {
    return MainTransactionModel(
      data['is_success'], 
      data['message'], 
      userTransactionList: (data['data']['transactions'] as List<dynamic>).map((e) => TransactionModel.fromJson(e)).toList()
    );
  }

  MainTransactionModel copyWith({
    required List<TransactionModel> userTransactionList,
  }) {
    return MainTransactionModel(
      isSuccess,
      message,
      userTransactionList: userTransactionList
    );
  }

  @override
  String toString() => 'MainTransactionModel(userTransactionList: $userTransactionList)';
}

class TransactionModel extends CommonApiResponse {

  final double amount;
  final String bridgecardTransactionReference;
  final String cardId;
  final TransactionType cardTransactionType;
  final String cardholderId;
  final String clientTransactionReference;
  final String currency;
  final String description;
  final String issuingAppId;
  final bool livemode;
  final String transactionDate;
  final DateTime transactionTimestamp;
  final TransactionEnrichedData? transactionEnrichedData;

  TransactionModel(super.isSuccess, super.message, {required this.amount, required this.bridgecardTransactionReference, required this.cardId,
  required this.cardTransactionType, required this.cardholderId, required this.clientTransactionReference,
  required this.currency, required this.description, required this.issuingAppId,
  required this.livemode, required this.transactionDate, required this.transactionEnrichedData,
  required this.transactionTimestamp}); 

  factory TransactionModel.fromJson(Map<String, dynamic> data) {
    return TransactionModel(
      data['is_success'] ?? false,
      data['message'] ?? '',
      amount: double.tryParse(data['amount']) ?? 0.0,
      bridgecardTransactionReference: data['bridgecard_transaction_reference'],
      cardId: data['card_id'],
      cardTransactionType: (data['card_transaction_type'] as String).stringToTransactionType,
      cardholderId: data['cardholder_id'],
      clientTransactionReference: data['client_transaction_reference'],
      currency: data['currency'],
      description: data['description'],
      issuingAppId: data['issuing_app_id'],
      livemode: data['livemode'],
      transactionDate: data['transaction_date'],
      transactionEnrichedData: data.containsKey('enriched_data')
      ? TransactionEnrichedData.fromJson(data['enriched_data'])
      : null,
      transactionTimestamp: (data['transaction_timestamp'] as int).epochToDateTime
    );
  }

  @override
  String toString() {
    return 'TransactionModel(amount: $amount, bridgecardTransactionReference: $bridgecardTransactionReference, cardId: $cardId, cardTransactionType: $cardTransactionType, cardholderId: $cardholderId, clientTransactionReference: $clientTransactionReference, currency: $currency, description: $description, issuingAppId: $issuingAppId, livemode: $livemode, transactionDate: $transactionDate, transactionTimestamp: $transactionTimestamp, transactionEnrichedData: $transactionEnrichedData)';
  }

  
}

class TransactionEnrichedData {
  final bool isRecurring;
  final String merchantLogo;
  final String transactionCategory;
  final String transactionGroup;

  TransactionEnrichedData({
    required this.isRecurring,
    required this.merchantLogo,
    required this.transactionCategory,
    required this.transactionGroup,
  });

  factory TransactionEnrichedData.fromJson(Map<String, dynamic> data) {
    return TransactionEnrichedData(
      isRecurring: data['is_recurring'],
      merchantLogo: data['merchant_logo'],
      transactionCategory: data['transaction_category'],
      transactionGroup: data['transaction_group']
    );
  }

  TransactionEnrichedData copyWith({
    bool? isRecurring,
    String? merchantLogo,
    String? transactionCategory,
    String? transactionGroup,
  }) {
    return TransactionEnrichedData(
      isRecurring: isRecurring ?? this.isRecurring,
      merchantLogo: merchantLogo ?? this.merchantLogo,
      transactionCategory: transactionCategory ?? this.transactionCategory,
      transactionGroup: transactionGroup ?? this.transactionGroup,
    );
  }

  @override
  String toString() {
    return 'TransactionEnrichedData(isRecurring: $isRecurring, merchantLogo: $merchantLogo, transactionCategory: $transactionCategory, transactionGroup: $transactionGroup)';
  }
}
