import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../components/index.dart';
import '../../../../config/app_assets.dart';
import '../../../../config/app_colors.dart';
import '../../controller/account_controller.dart';
import 'components/change_plan_item_view.dart';
import 'components/change_plan_tab_view.dart';

class ChangePlanScreen extends StatelessWidget {

  const ChangePlanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AccountController accountController = Get.find();
    return Container(
      color: AppColors.whiteColor,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          
          const CustomHeader(
            headerLabel: 'change_plan2',
            showBackButton: true,
          ),
      
          Image.asset(
            AppAssets.changePlanIMG,
            height: 180,
          ),

          Obx(() => accountController.userPlanModels.value == null
          ? const SizedBox.shrink()
          : ChangePlanTabView(
            selectedUserPlanModels: accountController.selectedUserPlanModels.value,
            mainUserPlanModels: accountController.userPlanModels.value!,
            onUserPlanModelChanged: accountController.onUserPlanChanged,
          )),

          Obx(() => accountController.selectedUserPlanModels.value == null
          ? const SizedBox.shrink()
          : Flexible(
            child: ChangePlanItemView(
              features: accountController.selectedUserPlanModels.value!.features,
              selectedUserPlanModels: accountController.selectedUserPlanModels.value,
              onSubscibeToPlan: accountController.sendChangePlan,
            ),
          )),
        ],
      ),
    );
  }
}