import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../components/index.dart';
import '../../../../config/app_assets.dart';
import '../../../../config/app_colors.dart';

class PhysicalCardScreen extends StatelessWidget {

  const PhysicalCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.whiteColor,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
          
            const CustomHeader(
              headerLabel: 'physical_card',
              showBackButton: true,
            ),
      
            Image.asset(AppAssets.physicalCardIMG),
      
            SizedBox(height: 36.h,),
      
            Flexible(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 12.w),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
              
                    CustomText(
                      label: 'order_a_card',
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w500,
                      textColor: AppColors.blackColor,
                      textSize: 20.sp,
                    ),
              
                    SizedBox(height: 12.h,),
              
                    CustomText(
                      label: 'physical_card_description',
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w300,
                      textColor: AppColors.blackColor,
                      textAlignment: TextAlign.center,
                      textSize: 18.sp,
                    ),
              
                  ],
                ),
              ),
            ),

            SizedBox(height: 24.h,),

            Container(
              margin: EdgeInsets.symmetric(horizontal: 12.w),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [

                  SizedBox(
                    height: 0.07.sh,
                    width: double.infinity,
                    child: CustomElevatedButton(
                      btnLabel: 'order_a_card',
                      onBtnPressed: () {},
                    ),
                  ),

                  SizedBox(height: 24.h,),

                  SizedBox(
                    height: 0.07.sh,
                    width: double.infinity,
                    child: GradientElevatedButton(
                      btnLabel: 'activate_card',
                      btnBGColor: AppColors.whiteColor,
                      btnFGColor: AppColors.primaryColor,
                      onBtnPressed: () {},
                    ),
                  ),

                ],
              ),
            ),
          
          ],
        ),
      ),
    );
  }
}