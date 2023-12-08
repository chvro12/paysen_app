import '../../../services/http_methods/http_methods_repo_impl.dart';
import '../models/withdraw_models.dart';

class MobileMoneyWithdrawRepo {

  final HttpMethodsReoImpl _httpMethodsReoImpl = HttpMethodsReoImpl();

  Future<MainWithdrawModel?> createWithdrawRequest(String amount, String paymentType) async {
    
    Map<String, String> endpointBody = { 
      'amount': amount,
      'payment_type': paymentType,
      'currency': 'USD'
    };

    final response = await _httpMethodsReoImpl.create('withdraw-request', endpointBody);
    if (response != null) {
      return MainWithdrawModel.fromJson(response);
    }
    return null;
  }
}