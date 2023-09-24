import '../../../services/http_methods/http_methods_repo_impl.dart';
import '../models/login_models.dart';

class LoginRepo {

  final HttpMethodsReoImpl _httpMethodsReoImpl = HttpMethodsReoImpl();

  Future<LoginModels> checkMobile(String countryCode, String phone) async {
    final response = await _httpMethodsReoImpl.create('check-mobile', { 'country_code': countryCode, 'phone': phone });
    return LoginModels.fromJson(response);
  }
}