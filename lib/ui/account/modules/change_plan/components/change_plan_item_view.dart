import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../components/index.dart';
import '../../../../../config/app_colors.dart';
import '../../../models/user_plan_models.dart';

class ChangePlanItemView extends StatelessWidget {

  final List<UserPlanFeatureModels> features;
  final UserPlanModels? selectedUserPlanModels;
  final VoidCallback onSubscibeToPlan;

  const ChangePlanItemView({
    super.key,
    required this.features,
    required this.selectedUserPlanModels,
    required this.onSubscibeToPlan
  });

  @override
  Widget build(BuildContext context) {
    return CustomListviewBuilder<UserPlanFeatureModels>(
      listOfItems: features,
      padding: EdgeInsets.only(left: 12.w, right: 12.w, top: 12.h, bottom: 92.h),
      scrollDirection: Axis.vertical,
      customListItemBuilder: (context, index, val) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [

            Container(
              height: 36.h,
              margin: EdgeInsets.symmetric(vertical: 1.h),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                        
                  Container(
                    width: 28.w,
                    height: 28.h,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: AppColors.linearGradient2
                    ),
                    child: const Icon(
                      Icons.check_rounded,
                      size: 18,
                      color: AppColors.whiteColor,
                    ),
                  ),
            
                  SizedBox(width: 12.w,),
            
                  Flexible(
                    child: CustomText(
                      label: val.title,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w300,
                      textSize: 16.sp,
                      textColor: AppColors.blackColor,
                    ),
                  )
                        
                ],
              ),
            ),

            if (selectedUserPlanModels != null && (features.length - 1) == index) 
              Container(
                height: 0.07.sh,
                width: 1.sw,
                margin: EdgeInsets.only(top: 24.h),
                child: CustomElevatedButton(
                  btnLabel: 'subscribe',
                  onBtnPressed: onSubscibeToPlan,
                ),
              ),
          ],
        );
      },
    );
  }
}