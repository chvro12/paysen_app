import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../components/index.dart';
import '../../../config/app_colors.dart';

class OnboardBottomView extends StatelessWidget {

  final int index;
  final int selectedIndex;
  
  const OnboardBottomView({
    super.key, 
    required this.index, 
    required this.selectedIndex
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 0.08.sw),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          
          CustomText(
            label: (selectedIndex == 0
            ? 'paysen_for_individuals'
            : selectedIndex == 1
            ? 'paysen_for_business'
            : 'paysen_money_transfer'),
            fontWeight: FontWeight.w500,
            textSize: 28.sp,
          ),
    
          SizedBox(height: 0.02.sh,),
          
          CustomText(
            label: (selectedIndex == 0
            ? 'paysen_for_individuals_description'
            : selectedIndex == 1
            ? 'paysen_for_business_description'
            : 'paysen_money_transfer_description'),
            fontWeight: FontWeight.w300,
            textSize: 16.sp,
            textAlignment: TextAlign.center,
          ),
          
          Container(
            alignment: Alignment.center,
            height: 0.12.sh,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(3, (index) {
                return Container(
                  margin: EdgeInsets.only(right: 0.04.sw),
                  width: 0.1.sw,
                  height: 0.006.sh,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(10.0),
                    color: selectedIndex == index 
                    ? AppColors.primaryColor
                    : AppColors.blackColor.withOpacity(0.2)
                  ),
                );
              }),
            ),
          ),
    
        ],
      ),
    );
  }
}