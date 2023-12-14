import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../components/index.dart';
import '../../../../config/app_assets.dart';
import '../../../../config/app_colors.dart';

class RequestProcessedScreen extends StatelessWidget {
  const RequestProcessedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        
        const CustomHeader(
          showBackButton: true,
        ),

        SizedBox(height: 12.h,),

        Expanded(
          child: Container(
            width: Get.width,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(40)
              ),
              color: AppColors.whiteColor
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [

                SizedBox(height: 60.h,),

                Image.asset(
                  AppAssets.orderRequestProcessedIMG
                ),

                SizedBox(height: 60.h,),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: CustomText(
                    label: 'request_is_being_processed',
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w500,
                    textAlignment: TextAlign.center,
                    textColor: AppColors.blackColor,
                    textSize: 24.sp,
                  ),
                )

              ],
            ),
          ),
        ),

      ],
    );
  }
}