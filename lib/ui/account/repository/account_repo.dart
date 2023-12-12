import '../../../services/http_methods/http_methods_repo_impl.dart';
import '../../../services/shared_pref_service.dart';
import '../models/language_models.dart';
import '../models/profile_models.dart';
import '../models/user_plan_models.dart';

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

  Future<MainUserPlanModels?> fetchPlanList() async {
    final userModels = await SharedPrefService.userAuthentication;
    if (userModels == null) return null;
    final response = await _httpMethodsReoImpl.fetch('plan-list');
    if (response != null) {
      return MainUserPlanModels.fromJson(response);
    }
    return null;
  }
  
  Future<ProfileModels?> postChangePlan(String planId) async {
    final userModels = await SharedPrefService.userAuthentication;
    if (userModels == null) return null;
    final response = await _httpMethodsReoImpl.create('change-plan', { 'plan_id': planId });
    if (response != null) {
      return ProfileModels.fromJson(response);
    }
    return null;
  }

  Future<MainLanguageModels?> fetchLanguageList() async {
    final userModels = await SharedPrefService.userAuthentication;
    if (userModels == null) return null;
    final response = await _httpMethodsReoImpl.fetch('language-list');
    if (response != null) {
      return MainLanguageModels.fromJson(response);
    }
    return null;
  }

  Future<ProfileModels?> postSelectLanguage(String langCode) async {
    final userModels = await SharedPrefService.userAuthentication;
    if (userModels == null) return null;
    final response = await _httpMethodsReoImpl.create('select-language', { 'lang_code': langCode });
    if (response != null) {
      return ProfileModels.fromJson(response);
    }
    return null;
  }
}