import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../config/app_colors.dart';
import '../models/dropdown_models.dart';
import 'index.dart';

class CustomDropDown extends StatelessWidget {
  
  final String header;
  final bool applyBottomMargin;
  final DropdownModels? selectedValue;
  final List<DropdownModels> items;
  final ValueChanged<DropdownModels?> onDropDownValueChanged;
  final String dropDownHint;

  const CustomDropDown({
    super.key,
    required this.header,
    this.applyBottomMargin = true,
    this.selectedValue,
    required this.items,
    required this.onDropDownValueChanged,
    required this.dropDownHint
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.borderColor),
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(12.0)
      ),
      alignment: Alignment.center,
      padding: EdgeInsets.all(0.04.sw),
      margin: applyBottomMargin 
      ? EdgeInsets.only(bottom: 0.03.sh) 
      : EdgeInsets.zero,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          CustomText(
            label: header,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w300,
            textColor: AppColors.blackColor.withOpacity(0.7),
            textSize: 16.sp,
          ),

          SizedBox(height: 0.01.sh,),

          SizedBox(
            height: 0.024.sh,
            child: DropdownButtonHideUnderline(
              child: DropdownButton<DropdownModels>(
                isExpanded: true,
                isDense: true,
                padding: EdgeInsets.zero,
                value: selectedValue,
                icon: const Icon(Icons.keyboard_arrow_down_rounded),
                hint: Text(
                  dropDownHint.tr,
                  style: TextStyle(
                    color: AppColors.blackColor.withOpacity(0.5),
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w300,
                    fontStyle: FontStyle.normal
                  ),
                ),
                borderRadius: BorderRadius.zero,
                style: TextStyle(
                  color: AppColors.blackColor,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal
                ),
                items: items.map((e) {
                  return DropdownMenuItem<DropdownModels>(
                    value: e,
                    enabled: true,
                    child: Text(e.name),
                  );
                }).toList(),
                onChanged: onDropDownValueChanged,
              ),
            ),
          ),

        ],
      ),
    );
  }
}