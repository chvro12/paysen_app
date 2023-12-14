import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../components/index.dart';
import '../../../../../config/app_colors.dart';

class ReqCryptoContentView extends StatelessWidget {

  final Map<int, List<Map<String, String>>> reqCryptoDescriptionItems;
  final int selectedReqCryptoItem;

  const ReqCryptoContentView({
    super.key,
    required this.reqCryptoDescriptionItems,
    required this.selectedReqCryptoItem
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: reqCryptoDescriptionItems[selectedReqCryptoItem]!.map((e) {
        return Container(
          margin: EdgeInsets.only(bottom: 24.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: selectedReqCryptoItem == 2
            ? CrossAxisAlignment.start
            : CrossAxisAlignment.center,
            children: [
              
              CustomText(
                label: e['title'] ?? '',
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w500,
                textColor: AppColors.blackColor,
                textSize: 20.sp,
              ),
            
              SizedBox(height: 8.h,),
              
              CustomText(
                label: e['description'] ?? '',
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w300,
                textColor: AppColors.blackColor,
                textSize: 18.sp,
                textAlignment: selectedReqCryptoItem == 2 
                ? TextAlign.start
                : TextAlign.center,
              ),
              
            ],
          ),
        );
      }).toList(),
    );
  }
}