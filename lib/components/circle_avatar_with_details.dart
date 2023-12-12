import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:paysen/components/index.dart';
import 'package:paysen/config/app_colors.dart';

import '../config/app_assets.dart';

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
            child: Container(
              padding: const EdgeInsets.all(4.0),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                // color: AppColors.whiteColor
              ),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: profilePic != null
                  ? null
                  : const DecorationImage(
                    image: AssetImage(AppAssets.fabPaysenLogo),
                    fit: BoxFit.cover
                  )
                ),
                child: profilePic != null
                ? CachedNetworkImage(
                  imageUrl: profilePic!,
                  errorWidget: (BuildContext context, String url, Object error) {
                    return Image.asset(AppAssets.fabPaysenLogo);
                  },
                )
                : const SizedBox.shrink(),
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