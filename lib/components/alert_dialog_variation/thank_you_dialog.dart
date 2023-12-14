import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../config/app_assets.dart';
import '../../config/app_colors.dart';
import '../custom_text.dart';

class ThankYouDialog extends StatelessWidget {

  final String title;
  final String description;
  final String lastVal;
  final VoidCallback? onLastValPressed;

  const ThankYouDialog({
    super.key,
    required this.description,
    required this.title,
    required this.lastVal,
    this.onLastValPressed
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      titlePadding: EdgeInsets.zero,
      contentPadding: EdgeInsets.zero,
      insetPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 24),
      content: Container(
        width: Get.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppColors.borderColor),
          shape: BoxShape.rectangle,
          color: AppColors.whiteColor
        ),
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [

            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Align(
                alignment: Alignment.centerRight,
                child: Container(
                  height: 48,
                  width: 48,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.borderColor
                  ),
                  child: Image.asset(AppAssets.closeCircleIcon),
                ),
              ),
            ),

            Container(
              height: 80,
              width: 80,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: AppColors.linearGradient2
              ),
              alignment: Alignment.center,
              child: Image.asset(AppAssets.whiteCheckIcon),
            ),

            SizedBox(height: 24.h,),

            CustomText(
              label: title,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w500,
              textColor: AppColors.blackColor,
              textSize: 24.sp,
              textAlignment: TextAlign.center,
            ),

            SizedBox(height: 12.h,),

            CustomText(
              label: description,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w300,
              textColor: AppColors.blackColor,
              textSize: 18.sp,
              textAlignment: TextAlign.center,
            ),

            SizedBox(height: 32.h,),

            GestureDetector(
              onTap: onLastValPressed,
              child: CustomText(
                label: lastVal,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w500,
                textColor: AppColors.secondaryColor,
                textSize: 18.sp,
                textAlignment: TextAlign.center,
                textDecoration: TextDecoration.underline,
                textDecorationColor: AppColors.secondaryColor,
              ),
            ),

            SizedBox(height: 24.h,),

          ],
        ),
      ),
    );
  }
}