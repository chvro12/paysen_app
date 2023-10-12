import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:paysen/components/index.dart';

import '../config/app_colors.dart';

class CustomAccountUserFilterView extends StatelessWidget {

  final List<String> accountUserType;
  final String selectedUserType;
  final ValueChanged<String> onAccountUserTypeChanged;

  const CustomAccountUserFilterView({
    super.key,
    required this.accountUserType,
    required this.selectedUserType,
    required this.onAccountUserTypeChanged
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56.h,
      padding: const EdgeInsets.all(4.0),
      decoration: BoxDecoration(
        color: AppColors.cultured,
        borderRadius: BorderRadius.circular(50.0)
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: accountUserType.map((e) {
          bool isSelected = e.toLowerCase() == selectedUserType.toLowerCase();
          return Expanded(
            child: GestureDetector(
              onTap: () => onAccountUserTypeChanged(e.toLowerCase()),
              child: Container(
                height: double.infinity,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: isSelected
                  ? BorderRadius.circular(60.0)
                  : BorderRadius.zero,
                  color: isSelected ? AppColors.apple : AppColors.transparent
                ),
                child: CustomText(
                  label: e,
                  textAlignment: TextAlign.center,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w500,
                  textColor: isSelected ? AppColors.whiteColor : AppColors.quartz,
                  textSize: 20.sp,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}