import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../config/app_logger.dart';
import '../../../../../config/app_utils.dart';
import '../repository/virtual_card_repo.dart';

class VirtualCardInDollarController extends GetxController with ProgressHUDMixin {
  
  final VirtualCardRepo _virtualCardRepo = VirtualCardRepo();

  Future<void> onGenerateVirtualCard(BuildContext context) async {
    try {
      show(context);
      final virtualCardDetail = await _virtualCardRepo.issueVirtualCard();
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