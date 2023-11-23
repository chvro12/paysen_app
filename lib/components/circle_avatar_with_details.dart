import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:paysen/components/index.dart';
import 'package:paysen/config/app_colors.dart';

class CircleAvatarWithDetails extends StatelessWidget {

  final String? profilePic;
  final String? name;
  final String? countryCode;
  final String? mobileNo;

  const CircleAvatarWithDetails({
    super.key, 
    this.profilePic,
    this.countryCode,
    this.mobileNo,
    this.name
  });

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
            child: profilePic == null 
            ? const SizedBox.shrink()
            : Container(
              padding: const EdgeInsets.all(4.0),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.whiteColor
              ),
              child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage(profilePic!),
                  fit: BoxFit.cover
                )
              ),
            ),
            ),
          ),

          SizedBox(width: 12.w,),

          Flexible(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
               mainAxisAlignment: MainAxisAlignment.center,
              children: [

                CustomText(
                  label: name ?? '',
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w500,
                  textColor: AppColors.blackColor,
                  textSize: 24.sp,
                ),

                SizedBox(height: 4.h,),

                CustomText(
                  label: '+$countryCode $mobileNo',
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