import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../components/index.dart';
import '../../../../../config/app_colors.dart';
import '../controller/activate_card_controller.dart';

class DocumentPreview extends StatelessWidget {
  
  const DocumentPreview({super.key});

  @override
  Widget build(BuildContext context) {
    final ActivateCardController activateCardController = Get.find();
    return Container(
      color: AppColors.blackColor,
      child: Stack(
        alignment: Alignment.center,
        children: [

          const Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: CustomHeader(
              showBackButton: true,
              backButtonColor: AppColors.whiteColor,
            ),
          ),

          if (activateCardController.selectedDocUploadType != null && activateCardController.uploadDocType[activateCardController.selectedDocUploadType!] != null)
            Image.file(activateCardController.uploadDocType[activateCardController.selectedDocUploadType!]!)

        ],
      ),
    );
  }
}