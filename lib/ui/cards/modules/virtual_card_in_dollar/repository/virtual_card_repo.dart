import '../../../../../services/http_methods/http_methods_repo_impl.dart';
import '../models/virtual_card_model.dart';

class VirtualCardRepo {

  final HttpMethodsReoImpl _httpMethodsReoImpl = HttpMethodsReoImpl();

  Future<VirtualCardModel?> issueVirtualCard() async {
    final response = await _httpMethodsReoImpl.create('issuing-card', {});
    if (response != null) {
      return VirtualCardModel.fromJson(response);
    }
    return null;
  }

}