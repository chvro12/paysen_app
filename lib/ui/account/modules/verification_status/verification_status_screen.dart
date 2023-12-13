import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../components/index.dart';
import '../../../../config/app_assets.dart';
import '../../../../config/app_colors.dart';

class VerificationStatus extends StatelessWidget {

  const VerificationStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.whiteColor,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [

          const CustomHeader(
            headerLabel: 'verification_status',
            showBackButton: true,
          ),

          SizedBox(height: 24.h,),

          Image.asset(AppAssets.verificationStatusIMG),

          SizedBox(height: 32.h,),

          Flexible(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 12.w),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
              
                  CustomText(
                    label: 'Your account is approved',
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w500,
                    textColor: AppColors.blackColor,
                    textSize: 20.sp,
                  ),
              
                  SizedBox(height: 12.h,),
              
                  CustomText(
                    label: 'We are happy to inform you that your account has been approved by PaySen. You can now take advantage of all features of PaySen',
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w300,
                    textColor: AppColors.blackColor,
                    textAlignment: TextAlign.center,
                    textSize: 18.sp,
                  ),
              
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}