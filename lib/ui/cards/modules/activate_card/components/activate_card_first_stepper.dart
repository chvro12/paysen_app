import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../components/index.dart';
import '../../../../../config/app_colors.dart';

class ActivateCardFirstStepper extends StatelessWidget {

  final VoidCallback onActivateCardPressed;

  const ActivateCardFirstStepper({
    super.key,
    required this.onActivateCardPressed
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [

        CustomText(
          label: 'card_arrived',
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w500,
          textColor: AppColors.blackColor,
          textSize: 24.sp,
        ),

        SizedBox(height: 18.h,),

        CustomText(
          label: 'activate_card_description',
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w300,
          textColor: AppColors.blackColor,
          textAlignment: TextAlign.center,
          textSize: 18.sp,
        ),

        SizedBox(height: 32.h,),

        SizedBox(
          height: 0.07.sh,
          width: 1.sw,
          child: CustomElevatedButton(
            btnLabel: 'activate_card',
            onBtnPressed: onActivateCardPressed,
          ),
        ),

      ],
    );
  }
}