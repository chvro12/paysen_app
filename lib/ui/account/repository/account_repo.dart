import 'package:paysen/services/shared_pref_service.dart';

import '../../../services/http_methods/http_methods_repo_impl.dart';
import '../models/profile_models.dart';

class AccountRepo {
  final HttpMethodsReoImpl _httpMethodsReoImpl = HttpMethodsReoImpl();

  Future<ProfileModels?> getProfile() async {
    final response = await _httpMethodsReoImpl.fetch('profile');
    if (response != null) {
      return ProfileModels.fromJson(response);
    }
    return null;
  }

  Future<ProfileModels?> postRefreshToken() async {
    final userModels = await SharedPrefService.userAuthentication;
    if (userModels == null) return null;
    final response = await _httpMethodsReoImpl.create('refresh-token', {
      'email': userModels.email
    });
    if (response != null) {
      return ProfileModels.fromJson(response);
    }
    return null;
  }
}