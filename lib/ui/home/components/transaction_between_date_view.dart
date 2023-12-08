import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../components/index.dart';
import '../../../config/app_colors.dart';

class TransactionBetweenDateView extends StatelessWidget {

  final String fromDate;
  final VoidCallback onFromDate;
  final String toDate;
  final VoidCallback onToDate;

  const TransactionBetweenDateView({
    super.key,
    required this.onFromDate,
    required this.onToDate,
    required this.fromDate,
    required this.toDate
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(color: AppColors.borderColor),
        shape: BoxShape.rectangle,
        color: AppColors.cultured
      ),
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          Flexible(
            flex: 2,
            child: GestureDetector(
              onTap: onFromDate,
              child: CustomText(
                label: fromDate,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w500,
                textColor: AppColors.blackColor,
                textSize: 16.sp,
              ),
            )
          ),

          Flexible(
            child: CustomText(
              label: '-',
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w500,
              textColor: AppColors.blackColor,
              textSize: 16.sp,
            )
          ),

          Flexible(
            flex: 2,
            child: GestureDetector(
              onTap: onToDate,
              child: CustomText(
                label: toDate,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w500,
                textColor: AppColors.blackColor,
                textSize: 16.sp,
              ),
            )
          )
        ],
      ),
    );
  }
}