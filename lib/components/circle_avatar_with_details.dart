import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:paysen/components/index.dart';
import 'package:paysen/config/app_colors.dart';

class CircleAvatarWithDetails extends StatelessWidget {

  const CircleAvatarWithDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      height: 80.h,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
    
          CircleAvatar(
            radius: 38.w,
          ),

          SizedBox(width: 12.w,),

          Flexible(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
               mainAxisAlignment: MainAxisAlignment.center,
              children: [

                CustomText(
                  label: 'Samba Thiam',
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w500,
                  textColor: AppColors.blackColor,
                  textSize: 24.sp,
                ),

                SizedBox(height: 4.h,),

                CustomText(
                  label: '+221 781949324',
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w500,
                  textColor: AppColors.blackColor,
                  textSize: 16.sp,
                ),

              ],
            ),
          )
    
        ],
      ),
    );
  }
}