import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../config/app_colors.dart';
import 'index.dart';

class MoneyOverview extends StatelessWidget {

  final List<Widget> moneyOverviewItems;
  final Color? containerBGColor;
  final EdgeInsetsGeometry? containerMargin;

  const MoneyOverview({
    super.key,
    required this.moneyOverviewItems,
    this.containerBGColor,
    this.containerMargin
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: containerMargin ?? EdgeInsets.symmetric(horizontal: 12.w),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        border: Border.all(color: AppColors.brightGray),
        shape: BoxShape.rectangle,
        color: containerBGColor
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
  final TextStyle? labelTextStyle;
  final String value;
  final TextStyle? valueTextStyle;
  final Widget? replaceValueWidget;
  final Widget? extraWidget;

  const MoneyOverviewItemView({
    super.key,
    this.showBorder = true,
    required this.label,
    required this.value,
    this.replaceValueWidget,
    this.labelTextStyle,
    this.valueTextStyle,
    this.extraWidget
  });

  @override
  Widget build(BuildContext context) {
    Widget rowWidget = Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        
        Padding(
          padding: EdgeInsets.only(left: 18.w),
          child: CustomText(
            label: label,
            fontStyle: labelTextStyle?.fontStyle ?? FontStyle.normal,
            fontWeight: labelTextStyle?.fontWeight ?? FontWeight.w300,
            textColor: labelTextStyle?.color ?? AppColors.blackColor,
            textSize: 16.sp,
          ),
        ),

        if (replaceValueWidget != null)
          Padding(
            padding: EdgeInsets.only(right: 18.w),
            child: replaceValueWidget ?? const SizedBox.shrink(),
          )
        else  
          Flexible(
            child: Padding(
              padding: EdgeInsets.only(right: 18.w),
              child: CustomText(
                label: value,
                maximumLines: 1,
                fontStyle: valueTextStyle?.fontStyle ?? FontStyle.normal,
                // fontWeight: FontWeight.w500,
                fontWeight: valueTextStyle?.fontWeight ?? FontWeight.w300,
                // textColor: AppColors.blackColor.withOpacity(0.5),
                textColor: valueTextStyle?.color ?? AppColors.blackColor,
                textSize: 16.sp,
              ),
            ),
          ),
      ],
    );

    Widget withExtraWidget;
    if (extraWidget == null) {
      withExtraWidget = rowWidget;
    } else {
      withExtraWidget = Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          rowWidget,
          extraWidget ?? const SizedBox.shrink()
        ],
      );
    }
    return Container(
      height: 35.h,
      alignment: Alignment.topCenter,
      decoration: BoxDecoration(
        border: showBorder
        ? const Border(bottom: BorderSide(color: AppColors.brightGray))
        : null
      ),
      // margin: EdgeInsets.only(left: 18.w, right: 18.w, top: 18.h),
      margin: EdgeInsets.only(top: 18.h),
      child: withExtraWidget,
    );
  }
}