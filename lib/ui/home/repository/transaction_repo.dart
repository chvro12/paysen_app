import '../../../services/http_methods/http_methods_repo_impl.dart';
import '../models/transaction_models.dart';

class TransactionRepo {

  final HttpMethodsReoImpl _httpMethodsReoImpl = HttpMethodsReoImpl();

  Future<MainTransactionModel?> fetchCardTransaction(String filterType, String page, {String? startDate, String? endDate}) async {

    Map<String, String> endpointBody = { 'filter_type': filterType, 'page': page };

    if (startDate != null) {
      endpointBody.addEntries({'start_date': startDate}.entries);
    }

    if (endDate != null) {
      endpointBody.addEntries({'end_date': endDate}.entries);
    }

    final response = await _httpMethodsReoImpl.create('card-transactions', endpointBody);
    if (response != null) {
      return MainTransactionModel.fromJson(response);
    }
    return null;
  }

  Future<TransactionModel?> fetchTransactionDetails(String clientTransactionReference) async {
    Map<String, String> endpointBody = { 'client_transaction_reference': clientTransactionReference };
    final response = await _httpMethodsReoImpl.create('transaction-details', endpointBody);
    if (response != null) {
      return TransactionModel.fromJson(response['data']);
    }
    return null;
  }

}