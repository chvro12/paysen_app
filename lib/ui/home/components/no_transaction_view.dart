import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../components/index.dart';
import '../../../config/app_assets.dart';
import '../../../config/app_colors.dart';

class NoTransactionView extends StatelessWidget {

  const NoTransactionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [

            SizedBox(height: 50.h,),
            
            Container(
              width: 80.w,
              decoration: const BoxDecoration(
                gradient: AppColors.linearGradient2,
                shape: BoxShape.circle
              ),
              child: Image.asset(AppAssets.noTransactionIcon),
            ),
            
            SizedBox(height: 50.h,),
            
            CustomText(
              label: 'no_transactions_title',
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w500,
              textColor: AppColors.blackColor,
              textSize: 20.sp,
            ),
          
            SizedBox(height: 12.h,),
          
            CustomText(
              label: 'no_transactions_description',
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w300,
              textColor: AppColors.blackColor,
              textAlignment: TextAlign.center,
              textSize: 18.sp,
            ),
          
          ],
        ),
      ),
    );
  }
}