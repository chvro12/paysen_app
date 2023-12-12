import '../../../models/common_api_response.dart';
import '../../../models/user_models.dart';

class ProfileModels extends CommonApiResponse {

  ProfileModels(super.isSuccess, super.message, this.userModels);
  
  final UserModels userModels;

  factory ProfileModels.fromJson(Map<String, dynamic> data) {
    Map<String, dynamic> tempDataJson = data['data'];
    if (tempDataJson.containsKey('user_details')) {
      tempDataJson = data['data']['user_details'];
    }
    return ProfileModels(data['is_success'], data['message'], UserModels.fromJson(tempDataJson));
  }
}