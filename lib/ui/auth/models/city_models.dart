import 'package:paysen/models/dropdown_models.dart';

import '../../../models/common_api_response.dart';

class CityModels extends CommonApiResponse {

  final List<DropdownModels> cityList;

  CityModels(super.isSuccess, super.message, {required this.cityList});

  factory CityModels.fromJson(Map<String, dynamic> data) {
    return CityModels(
      data['is_success'], 
      data['message'], 
      cityList: (data['data'] as List).map((e) => DropdownModels.fromJson(e)).toList()
    );
  }
}
