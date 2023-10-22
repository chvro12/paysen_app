
import '../../../../../models/card_detail_models.dart';
import '../../../../../models/common_api_response.dart';
import '../../../../../models/user_models.dart';

class VirtualCardModel extends CommonApiResponse {

  final String viewCardUrl;
  final VirtualCardDataModel virtualCardDataModel; 

  VirtualCardModel(
    super.isSuccess, 
    super.message, 
    {
      required this.viewCardUrl, 
      required this.virtualCardDataModel
    }
  );

  factory VirtualCardModel.fromJson(Map<String, dynamic> data) {
    return VirtualCardModel(
      data['is_success'], 
      data['message'], 
      viewCardUrl: data['view_card_url'], 
      virtualCardDataModel: VirtualCardDataModel.fromJson(data['data'])
    );
  }
}

class VirtualCardDataModel {

  final UserModels userModels;
  final CardDetailModel cardDetailModel;

  VirtualCardDataModel({required this.cardDetailModel, required this.userModels});

  factory VirtualCardDataModel.fromJson(Map<String, dynamic> data) {
    return VirtualCardDataModel(
      cardDetailModel: CardDetailModel.fromJson(data['card_details']), 
      userModels: UserModels.fromJson(data['user_details'])
    );
  }
}