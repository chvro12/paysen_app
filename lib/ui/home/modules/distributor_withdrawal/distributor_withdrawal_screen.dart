import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../components/index.dart';
import '../../../../config/app_assets.dart';
import '../../../../config/app_colors.dart';

class DistributorWithdrawalScreen extends StatelessWidget {

  const DistributorWithdrawalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.whiteColor,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [

          const CustomHeader(
            headerLabel: 'retailer_withdrawal',
            showBackButton: true,
          ),

          SizedBox(height: 12.h,),

          Image.asset(AppAssets.retailerWithdrawalIcon),

          SizedBox(height: 36.h,),

          Container(
            height: 140.h, 
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: AppColors.blackColor.withOpacity(0.8),
              shape: BoxShape.rectangle
            ),
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              AppAssets.scanQREdges,
              fit: BoxFit.fill,
            ),
          ),

          SizedBox(height: 48.h,),

          Flexible(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 12.w),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
            
                  CustomText(
                    label: 'scan_qr_code',
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w500,
                    textColor: AppColors.blackColor,
                    textSize: 32.sp,
                  ),
            
                  SizedBox(height: 12.h,),
            
                  CustomText(
                    label: 'scan_qr_code_description',
                    fontStyle: FontStyle.normal,
                    textAlignment: TextAlign.center,
                    fontWeight: FontWeight.w300,
                    textColor: AppColors.blackColor,
                    textSize: 18.sp,
                  ),
                  
                ],
              ),
            ),
          ),

          SizedBox(height: 36.h,),

          Container(
            height: 0.07.sh,
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 12.w),
            child: CustomElevatedButton(
              btnLabel: 'scan',
              onBtnPressed: () {},
            ),
          )
          
        ],
      ),
    );
  }
}