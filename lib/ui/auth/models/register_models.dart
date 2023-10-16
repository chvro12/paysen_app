import 'package:paysen/config/app_enums.dart';

import '../../../models/common_api_response.dart';
import '../../../models/user_models.dart';

class RegisterModels extends CommonApiResponse {

  final UserModels? userModels;

  RegisterModels(super.isSuccess, super.message, {super.userType, required this.userModels});

  factory RegisterModels.fromJson(Map<String, dynamic> data) {
    final String? userType = data['user_type'];

    return RegisterModels(
      data['is_success'], 
      data['message'],
      userType: userType?.stringToUserType,
      userModels: data.containsKey('data') && data['data'] != null 
      ? UserModels.fromJson(data['data'])
      : null
    );
  }

  RegisterModels copyWith({ UserModels? userModels,}) {
    return RegisterModels(isSuccess, message, userModels: userModels ?? this.userModels,);
  }

  @override
  String toString() => 'RegisterModels(userModels: $userModels)';
}
