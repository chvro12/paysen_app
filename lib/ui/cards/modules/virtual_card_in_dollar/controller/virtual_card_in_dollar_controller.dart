import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../config/app_logger.dart';
import '../../../../../config/app_utils.dart';
import '../../../repository/card_repo.dart';

class VirtualCardInDollarController extends GetxController with ProgressHUDMixin {
  
  final CardRepo _cardRepo = CardRepo();

  Future<void> onGenerateVirtualCard(BuildContext context) async {
    try {
      show();
      final virtualCardDetail = await _cardRepo.issueVirtualCard();
      if (virtualCardDetail != null) {
        ToastUtils.showToast(virtualCardDetail.message);
      }
    } catch (e) {
      AppLogger.e('exception onGenerateVirtualCard', e.toString());
    } finally {
      dismiss();
    }
  }
}