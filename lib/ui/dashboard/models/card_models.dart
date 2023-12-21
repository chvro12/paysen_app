import '../../../models/common_api_response.dart';
import '../../../models/user_models.dart';

class MainCardModels extends CommonApiResponse {

  final CardModels cardModels;

  MainCardModels(super.isSuccess, super.message, this.cardModels);
  
  factory MainCardModels.fromJson(Map<String, dynamic> data) {
    return MainCardModels(data['is_success'], data['message'], CardModels.fromJson(data['data']));
  }
}

class CardModels {
  final String balance;
  final UserModels userModels;

  CardModels({required this.balance, required this.userModels});

  factory CardModels.fromJson(Map<String, dynamic> data) {
    Map<String, dynamic> tempDataJson = data['data'];
    if (tempDataJson.containsKey('user_details')) {
      tempDataJson = data['data']['user_details'];
    }
    return CardModels(
      balance: data['balance'], 
      userModels: UserModels.fromJson(tempDataJson)
    );
  }
}