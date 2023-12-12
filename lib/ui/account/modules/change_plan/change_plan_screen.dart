import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../components/index.dart';
import '../../../../config/app_assets.dart';
import '../../../../config/app_colors.dart';
import 'components/change_plan_item_view.dart';
import 'components/change_plan_tab_view.dart';
import 'controller/change_plan_controller.dart';

class ChangePlanScreen extends StatelessWidget {

  const ChangePlanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final changePlanController = Get.put(ChangePlanController());
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

          Obx(() => changePlanController.userPlanModels.value == null
          ? const SizedBox.shrink()
          : ChangePlanTabView(
            selectedUserPlanModels: changePlanController.selectedUserPlanModels.value,
            mainUserPlanModels: changePlanController.userPlanModels.value!,
            onUserPlanModelChanged: changePlanController.onUserPlanChanged,
          )),

          Obx(() => changePlanController.selectedUserPlanModels.value == null
          ? const SizedBox.shrink()
          : Flexible(
            child: ChangePlanItemView(
              features: changePlanController.selectedUserPlanModels.value!.features,
              selectedUserPlanModels: changePlanController.selectedUserPlanModels.value,
              onSubscibeToPlan: changePlanController.sendChangePlan,
            ),
          )),
        ],
      ),
    );
  }
}