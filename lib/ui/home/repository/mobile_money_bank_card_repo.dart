import '../../../models/user_models.dart';
import '../../../services/http_methods/http_methods_repo_impl.dart';

class MobileMoneyBankCardRepo {

  final HttpMethodsReoImpl _httpMethodsReoImpl = HttpMethodsReoImpl();

  Future<UserModels?> createFundCard(String amount, String transactionId) async {
    
    Map<String, String> endpointBody = { 
      'amount': amount,
      'transaction_id': transactionId,
      'currency': 'USD'
    };

    final response = await _httpMethodsReoImpl.create('fund-card', endpointBody);
    if (response != null) {
      return UserModels.fromJson(response['data']['user_details']);
    }
    return null;
  }
}