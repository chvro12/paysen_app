import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../config/app_assets.dart';
import '../../components/common_profile_components.dart';
import '../../components/other_modules_view.dart';
import '../../controller/account_controller.dart';

class MerchantDetailScreen extends StatelessWidget {

  const MerchantDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AccountController accountController = Get.find();
    return CommonProfileComponents(
      appbarTitle: 'merchant_details',
      subChildren: [

        Flexible(
          child: SizedBox(
            height: Get.height,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: accountController.merchantDetailModuleList.map((e) {
                String assetIMG;
                if (e == 'id_and_key') {
                  assetIMG = AppAssets.idAndKeyIcon;
                } else if (e == 'urls') {
                  assetIMG = AppAssets.merchantDetailUrlIcon;
                } else {
                  assetIMG = AppAssets.merchantDetailDocsIcon;
                }
                return OtherModulesView(
                  assetIMG: assetIMG, 
                  label: e,
                  onPressed: () => accountController.onMerchantDetailModuleSelect(e),
                );
              }).toList(),
            ),
          ),
        )
      ],
    );
  }
}