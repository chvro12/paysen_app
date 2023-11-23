import 'package:paysen/models/common_api_response.dart';

class StripeCredentialsModels extends CommonApiResponse {

  final String stripeKey;
  final String stripePublishableKey;

  StripeCredentialsModels(
    super.isSuccess, 
    super.message,
    {
      required this.stripeKey,
      required this.stripePublishableKey
    }
  );
  

  factory StripeCredentialsModels.fromJson(Map<String, dynamic> data) {
    final dataPayload = data['data'];
    return StripeCredentialsModels(
      data['is_success'], 
      data['message'], 
      stripeKey: dataPayload['STRIPE_KEY'], 
      stripePublishableKey: data['STRIPE_PUBLISHABLE_KEY']
    );
  }
}