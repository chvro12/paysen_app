import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../components/index.dart';
import '../../../../../config/app_colors.dart';

class ReqCryptoAgreeCheckBoxView extends StatelessWidget {

  final bool isSelected;
  final String description;
  final VoidCallback? onPressed;

  const ReqCryptoAgreeCheckBoxView({
    super.key,
    required this.isSelected,
    this.description = '',
    this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [

        GestureDetector(
          onTap: onPressed,
          child: Container(
            height: 32,
            width: 32,
            decoration: BoxDecoration(
              border: Border.all(color: isSelected ? AppColors.transparent :AppColors.blackColor.withOpacity(0.5)),
              borderRadius: BorderRadius.circular(4),
              color: isSelected 
              ? AppColors.primaryColor
              : AppColors.transparent
            ),
            child: isSelected 
            ? Icon(
              Icons.check_rounded,
              color: isSelected 
              ? AppColors.whiteColor 
              : null,
            )
            : const SizedBox.shrink(),
          ),
        ),

        SizedBox(width: 18.w,),

        Flexible(
          child: CustomText(
            label: description,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w500,
            textColor: AppColors.blackColor,
            textSize: 18.sp,
          ),
        ),

      ],
    );
  }
}