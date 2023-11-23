import 'package:paysen/models/common_api_response.dart';
import 'package:paysen/models/user_models.dart';

class ProfileModels extends CommonApiResponse {

  ProfileModels(super.isSuccess, super.message, this.userModels);
  
  final UserModels userModels;

  factory ProfileModels.fromJson(Map<String, dynamic> data) {
    return ProfileModels(data['is_success'], data['message'], UserModels.fromJson(data['data']['user_details']));
  }
}