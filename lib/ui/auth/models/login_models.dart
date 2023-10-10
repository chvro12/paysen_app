import 'package:paysen/config/app_enums.dart';

import '../../../models/common_api_response.dart';
import '../../../models/user_models.dart';

class LoginModels extends CommonApiResponse {

  final UserModels? userModels;

  LoginModels(super.isSuccess, super.message, {super.userType, required this.userModels});

  factory LoginModels.fromJson(Map<String, dynamic> data) {
    final String? userType = data['user_type'];

    return LoginModels(
      data['is_success'], 
      data['message'],
      userType: userType?.stringToUserType,
      userModels: data.containsKey('data') && data['data'] != null 
      ? UserModels.fromOtp(data['data'])
      : null
    );
  }

  LoginModels copyWith({ UserModels? userModels,}) {
    return LoginModels(isSuccess, message, userModels: userModels ?? this.userModels,);
  }

  @override
  String toString() => 'LoginModels(userModels: $userModels)';
}
