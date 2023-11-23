import 'package:paysen/models/user_models.dart';

import '../../../models/common_api_response.dart';

class DashboardModels extends CommonApiResponse {

  final UserModels userModels;

  DashboardModels(
    super.isSuccess, 
    super.message,
    { required this.userModels }
  );

  factory DashboardModels.fromJson(Map<String, dynamic> data) {
    return DashboardModels(
      data['is_success'], 
      data['message'], 
      userModels: UserModels.fromJson(data['data']['user_details'])
    );
  }
}