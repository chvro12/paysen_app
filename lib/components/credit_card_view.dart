import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:paysen/components/index.dart';

import '../config/app_assets.dart';
import '../config/app_colors.dart';

class CreditCardView extends StatelessWidget {

  const CreditCardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 0.26.sh,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 0.04.sw),
      child: Stack(
        children: [
          
          Image.asset(
            AppAssets.creditCardBG, 
            width: double.infinity, 
            height: double.infinity, 
            fit: BoxFit.fill,
          ),

          Positioned(
            top: 0.02.sh,
            left: 0.05.sw,
            child: CustomText(
              label: 'credit_card'.tr,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w500,
              textColor: AppColors.whiteColor,
              textSize: 20.sp,
            ),
          ),

          Positioned(
            top: 0.02.sh,
            right: 0.05.sw,
            child: Image.asset(AppAssets.creditCardPaysenLogo),
          ),

          Positioned(
            top: 0.072.sh,
            left: 0.05.sw,
            child: Image.asset(AppAssets.creditCardChip),
          ),

          Positioned(
            top: 0.134.sh,
            left: 0.05.sw,
            right: 0.05.sw,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [

                Expanded(
                  child: CustomText(
                    label: '1234',
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w500,
                    textColor: AppColors.whiteColor,
                    textSize: 22.sp,
                    textLetterSpacing: 2.0,
                  ),
                ),

                Expanded(
                  child: CustomText(
                    label: '5678 ',
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w500,
                    textColor: AppColors.whiteColor,
                    textSize: 22.sp,
                    textLetterSpacing: 2.0,
                  ),
                ),

                Expanded(
                  child: CustomText(
                    label: '9012 ',
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w500,
                    textColor: AppColors.whiteColor,
                    textSize: 22.sp,
                    textLetterSpacing: 2.0,
                  ),
                ),
                
                Expanded(
                  child: CustomText(
                    label: '3456',
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w500,
                    textColor: AppColors.whiteColor,
                    textSize: 22.sp,
                    textLetterSpacing: 2.0,
                  ),
                )
              ],
            ),
          ),

          Positioned(
            top: 0.164.sh,
            left: 0.05.sw,
            child: CustomText(
              label: '0123',
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w500,
              textColor: AppColors.whiteColor,
              textSize: 12.sp,
              textLetterSpacing: 2.0,
            ),
          ),

          Positioned(
            bottom: 0.02.sh,
            left: 0.05.sw,
            child: CustomText(
              label: 'Samba Thiam',
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w500,
              textColor: AppColors.whiteColor,
              textSize: 18.sp,
            ),
          ),

          Positioned(
            top: 0.18.sh,
            right: 0.05.sw,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomText(
                  label: 'VALID\nTHRU',
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w500,
                  textColor: AppColors.whiteColor,
                  textSize: 8.sp,
                ),
                const SizedBox(width: 2.0,),
                Image.asset(AppAssets.creditCardMisc),
                const SizedBox(width: 4.0,),
                CustomText(
                  label: '01/80',
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w500,
                  textColor: AppColors.whiteColor,
                  textSize: 16.sp,
                  textLetterSpacing: 2.0,
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}