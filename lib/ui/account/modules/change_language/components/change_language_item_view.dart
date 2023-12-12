import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../components/index.dart';
import '../../../../../config/app_colors.dart';
import '../../../models/language_models.dart';

class ChangeLanguageItemView extends StatelessWidget {

  final LanguageModels languageModels;
  final VoidCallback onLanguageChanged;
  final bool isSelected;

  const ChangeLanguageItemView({
    super.key,
    required this.languageModels,
    required this.onLanguageChanged,
    required this.isSelected
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onLanguageChanged,
      child: Container(
        height: 56.h,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        margin: EdgeInsets.only(bottom: 12.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.brightGray),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
      
            Expanded(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
      
                  Image.network(
                    languageModels.flag,
                    height: 56.h,
                    width: 50.w,
                    fit: BoxFit.fill,
                  ),
      
                  SizedBox(width: 12.w,),
      
                  Flexible(
                    child: CustomText(
                      label: languageModels.name,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w500,
                      textColor: AppColors.blackColor,
                      textSize: 20.sp,
                    ),
                  )
      
                ],
              ),
            ),
      
            Icon(
              Icons.check_circle_outline_rounded,
              color: isSelected 
              ? AppColors.primaryColor 
              : AppColors.charlestonGreen.withOpacity(0.3),
            )
      
          ],
        ),
      ),
    );
  }
}