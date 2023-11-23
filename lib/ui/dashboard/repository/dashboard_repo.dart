import '../../../services/http_methods/http_methods_repo_impl.dart';
import '../models/dashboard_models.dart';

class DashboardRepo {

  final HttpMethodsReoImpl _httpMethodsReoImpl = HttpMethodsReoImpl();

  Future<DashboardModels?> dashboardHome(String fcmToken, String platform, String device) async {
    final response = await _httpMethodsReoImpl.create('home', {
      'fcm_token': fcmToken,
      'platform': platform,
      'device': device
    });
    if (response != null) {
      return DashboardModels.fromJson(response);
    }
    return null;
  }

}