import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../components/index.dart';
import '../../../../../config/app_colors.dart';
import '../../../models/user_plan_models.dart';

class ChangePlanTabView extends StatelessWidget {

  final MainUserPlanModels mainUserPlanModels;
  final UserPlanModels? selectedUserPlanModels;
  final ValueChanged<UserPlanModels> onUserPlanModelChanged;

  const ChangePlanTabView({
    super.key,
    required this.mainUserPlanModels,
    required this.selectedUserPlanModels,
    required this.onUserPlanModelChanged
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: mainUserPlanModels.data.map((e) {
        final bool isSelected = selectedUserPlanModels != null && selectedUserPlanModels == e;
        return Flexible(
          child: GestureDetector(
            onTap: () => onUserPlanModelChanged(e),
            child: Container(
              alignment: Alignment.center,
              height: 45,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: isSelected
                    ? AppColors.primaryColor
                    : AppColors.borderColor
                  )
                ),
                shape: BoxShape.rectangle
              ),
              child: CustomText(
                label: e.name,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w500,
                textColor: isSelected
                ? AppColors.primaryColor
                : AppColors.quartz,
                textSize: 16.sp,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}