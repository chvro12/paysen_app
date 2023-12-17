import 'dart:io';

import '../../../services/http_baseurl.dart';
import '../../../services/http_methods/http_methods_repo_impl.dart';
import '../../account/models/profile_models.dart';
import '../modules/virtual_card_in_dollar/models/virtual_card_model.dart';

class CardRepo {

  final HttpMethodsReoImpl _httpMethodsReoImpl = HttpMethodsReoImpl();

  Future<VirtualCardModel?> issueVirtualCard() async {
    final response = await _httpMethodsReoImpl.create('issuing-card', {});
    if (response != null) {
      return VirtualCardModel.fromJson(response);
    }
    return null;
  }

  Future<ProfileModels?> newIssueVirtualCard(String address, String postalCode, String houseNo, String idType, String idNo, String dob, List<File> files) async {
    Map<String, String> body = { 'address': address, 'postal_code': postalCode, 'house_no': houseNo, 'id_type': idType, 'id_no': idNo, 'dob': dob };
    final response = await _httpMethodsReoImpl.fileUploading(Uri.parse('${HttpBaseUrl.baseUrl}/issuing-card'), body, files, ['id_image', 'selfie_image', 'back_id_image']);
    if (response != null) {
      return ProfileModels.fromJson(response);
    }
    return null;
  }
}