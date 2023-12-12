import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../components/index.dart';
import '../../../config/app_assets.dart';
import '../../../config/app_colors.dart';

class OtherModulesView extends StatelessWidget {

  final String assetIMG;
  final String label;
  final VoidCallback? onPressed;

  const OtherModulesView({
    super.key,
    required this.assetIMG,
    required this.label,
    this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 64.h,
        alignment: Alignment.topCenter,
        margin: EdgeInsets.only(bottom: 12.h),
        decoration: const BoxDecoration(
          shape: BoxShape.rectangle,
          border: Border(bottom: BorderSide(color: AppColors.brightGray))
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
    
            Expanded(
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
    
                  Container(
                    height: 48.h,
                    width: 48.h,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.antiFlashWhite
                    ),
                    child: Image.asset(
                      assetIMG,
                      color: AppColors.orchid,
                    ),
                  ),
    
                  SizedBox(width: 12.w,),
    
                  CustomText(
                    label: label,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w500,
                    textColor: AppColors.blackColor,
                    textSize: 18.sp,
                  ),
                
                ],
              ),
            ),
    
            Image.asset(AppAssets.arrowRight2Icon)
    
          ],
        ),
      ),
    );
  }
}