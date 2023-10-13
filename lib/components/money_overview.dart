import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../config/app_colors.dart';
import 'index.dart';

class MoneyOverview extends StatelessWidget {

  final List<Widget> moneyOverviewItems;

  const MoneyOverview({
    super.key,
    required this.moneyOverviewItems
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12.w),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        border: Border.all(color: AppColors.brightGray),
        shape: BoxShape.rectangle
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: moneyOverviewItems,
      ),
    );
  }
}

class MoneyOverviewItemView extends StatelessWidget {

  final bool showBorder;
  final String label;
  final String value;
  final Widget? replaceValueWidget;

  const MoneyOverviewItemView({
    super.key,
    this.showBorder = true,
    required this.label,
    required this.value,
    this.replaceValueWidget
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.h,
      alignment: Alignment.topCenter,
      decoration: BoxDecoration(
        border: showBorder
        ? const Border(bottom: BorderSide(color: AppColors.brightGray))
        : null
      ),
      margin: EdgeInsets.only(left: 18.w, right: 18.w, top: 18.h),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          
          CustomText(
            label: label,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w300,
            textColor: AppColors.blackColor,
            textSize: 16.sp,
          ),

          if (replaceValueWidget != null)
            replaceValueWidget ?? const SizedBox.shrink()
          else  
            CustomText(
              label: value,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w500,
              textColor: AppColors.blackColor.withOpacity(0.5),
              textSize: 16.sp,
            ),
        ],
      ),
    );
  }
}