import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../config/app_assets.dart';
import '../config/app_colors.dart';
import 'index.dart';

class MobileNumberChangeView extends StatelessWidget {

  final String mobileNoWithCountryCode;
  final VoidCallback onMobileNoChange;
  final ValueChanged<String> onAmountChange;
  final TextEditingController editingController;
  final bool useSpacer;

  const MobileNumberChangeView({
    super.key,
    required this.mobileNoWithCountryCode,
    required this.onMobileNoChange,
    required this.onAmountChange,
    required this.editingController,
    this.useSpacer = true
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [

        Flexible(
          child: Container(
            height: 66.h,
            margin: EdgeInsets.symmetric(horizontal: 12.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: AppColors.background
            ),
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
        
                Expanded(
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
        
                      Container(
                        width: 42.w,
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.whiteColor
                        ),
                        child: Image.asset(AppAssets.mobileIcon),
                      ),
        
                      SizedBox(width: 12.w,),
        
                      CustomText(
                        label: mobileNoWithCountryCode,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500,
                        textSize: 18.sp,
                      )
        
                    ],
                  ),
                ),
        
                GestureDetector(
                  onTap: onMobileNoChange,
                  child: CustomText(
                    label: 'change',
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w500,
                    textColor: AppColors.tertiaryColor,
                    textSize: 18.sp,
                  ),
                )
        
              ],
            ),
          ),
        ),

        SizedBox(height: 24.h,),

        Flexible(
          child: Container(
            height: 56.h,
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.brightGray),
              color: AppColors.cultured,
              borderRadius: BorderRadius.circular(20.0)
            ),
            margin: EdgeInsets.symmetric(horizontal: 12.w),
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            alignment: Alignment.center,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
        
                Container(
                  margin: EdgeInsets.only(top: 6.h),
                  child: CustomText(
                    label: 'XOF',
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w500,
                    textColor: AppColors.blackColor,
                    textAlignment: TextAlign.center,
                    textSize: 24.sp,
                  ),
                ),
        
                SizedBox(width: 18.w,),
        
                VerticalDivider(
                  color: AppColors.brightGray,
                  thickness: 1.0,
                  indent: 12.h,
                  endIndent: 12.h,
                ),
        
                SizedBox(width: 18.w,),
        
                Flexible(
                  child: TextField(
                    autocorrect: true,
                    decoration: InputDecoration(
                      alignLabelWithHint: true,
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(top: 6.h),
                      disabledBorder: InputBorder.none,
                      counterText: '',
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      focusedErrorBorder: InputBorder.none,
                    ),
                    enableIMEPersonalizedLearning: true,
                    enableInteractiveSelection: true,
                    enableSuggestions: true,
                    inputFormatters: [ FilteringTextInputFormatter.digitsOnly ],
                    keyboardType: TextInputType.number,
                    controller: editingController,
                    onChanged: onAmountChange,
                    style: TextStyle(
                      color: AppColors.blackColor,
                      fontSize: 24.sp,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                )
        
              ],
            ),
          ),
        ),

        if (useSpacer) 
          SizedBox(height: 24.h,),

      ],
    );
  }
}