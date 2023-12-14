import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../config/app_colors.dart';

class ReqCryptoIndicatorView extends StatelessWidget {

  final List<String> reqCryptoPageItems;
  final int selectedIndex;

  const ReqCryptoIndicatorView({
    super.key, 
    required this.selectedIndex,
    this.reqCryptoPageItems = const []
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      alignment: Alignment.center,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(reqCryptoPageItems.length, (index) {
          return Container(
            width: 32.w,
            height: 4.h,
            margin: EdgeInsets.only(right: 8.w),
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: selectedIndex == index
              ? AppColors.primaryColor 
              : AppColors.blackColor.withOpacity(0.2),
              borderRadius: BorderRadius.circular(10)
            ),
          );
        }),
      ),
    );
  }
}