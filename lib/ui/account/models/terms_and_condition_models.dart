import '../../../models/common_api_response.dart';

class TermsAndConditionModels extends CommonApiResponse {

  final String termsAndConditions;

  TermsAndConditionModels(super.isSuccess, super.message, {required this.termsAndConditions});

  factory TermsAndConditionModels.fromJson(Map<String, dynamic> data) {
    return TermsAndConditionModels(
      data['is_success'], 
      data['message'], 
      termsAndConditions: (data['data'] as Map<String, dynamic>)['terms_and_conditions']
    );
  }
  
}