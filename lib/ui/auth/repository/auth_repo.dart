import 'dart:io';

import '../../../services/http_baseurl.dart';
import '../../../services/http_methods/http_methods_repo_impl.dart';
import '../models/city_models.dart';
import '../models/login_models.dart';
import '../models/register_models.dart';

class AuthRepo {

  final HttpMethodsReoImpl _httpMethodsReoImpl = HttpMethodsReoImpl();

  Future<LoginModels> checkMobile(String countryCode, String phone) async {
    final response = await _httpMethodsReoImpl.create('check-mobile', { 'country_code': countryCode, 'phone': phone });
    return LoginModels.fromJson(response);
  }

  Future<CityModels> cities() async {
    final response = await _httpMethodsReoImpl.fetch('cities');
    return CityModels.fromJson(response);
  }

  Future<RegisterModels> register(Map<String, String> body, List<File> files) async {
    final response = await _httpMethodsReoImpl.fileUploading(Uri.parse('${HttpBaseUrl.baseUrl}/register'), body, files);
    return RegisterModels.fromJson(response);
  }
}