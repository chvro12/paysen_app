import 'package:paysen/config/app_enums.dart';

import '../../../models/common_api_response.dart';

class MainUserPlanModels extends CommonApiResponse {

  final List<UserPlanModels> data;

  MainUserPlanModels(super.isSuccess, super.message, {required this.data});

  factory MainUserPlanModels.fromJson(Map<String, dynamic> data) {
    return MainUserPlanModels(
      data['is_success'],
      data['message'],
      data: (data['data'] as List).map((e) => UserPlanModels.fromJson(e)).toList()
    );
  }
}

class UserPlanModels {
  final int id;
  final String name;
  final List<UserPlanFeatureModels> features;

  UserPlanModels({required this.features, required this.id, required this.name});

  factory UserPlanModels.fromJson(Map<String, dynamic> data) {
    return UserPlanModels(
      features: (data['features'] as List<dynamic>).map((e) => UserPlanFeatureModels.fromJson(e)).toList(),
      id: data['id'],
      name: data['name']
    );
  }
}

class UserPlanFeatureModels {
  
  final bool active;
  final String title;

  UserPlanFeatureModels({required this.active, required this.title});

  factory UserPlanFeatureModels.fromJson(Map<String, dynamic> data) {
    return UserPlanFeatureModels(
      active: (data['active'] as int).serverResponseIntToBool,
      title: data['title']
    );
  }
}