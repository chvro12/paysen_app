import '../../../models/common_api_response.dart';

class MainLanguageModels extends CommonApiResponse {

  final List<LanguageModels> data;

  MainLanguageModels(super.isSuccess, super.message, {required this.data});

  factory MainLanguageModels.fromJson(Map<String, dynamic> data) {
    return MainLanguageModels(
      data['is_success'],
      data['message'],
      data: (data['data'] as List).map((e) => LanguageModels.fromJson(e)).toList()
    );
  }
}

class LanguageModels {

  final String name;
  final String code;
  final String flag;

  LanguageModels({required this.code, required this.flag, required this.name});

  factory LanguageModels.fromJson(Map<String, dynamic> data) {
    return LanguageModels(
      code: data['code'],
      flag: data['flag'],
      name: data['name']
    );
  }
}