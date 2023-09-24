import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../config/app_colors.dart';
import '../models/dropdown_models.dart';
import 'index.dart';

class CustomDropDown extends StatelessWidget {
  
  final String header;
  final bool applyBottomMargin;
  final DropdownModels? selectedValue;
  final List<DropdownModels> items;
  final ValueChanged<DropdownModels?> onDropDownValueChanged;

  const CustomDropDown({
    super.key,
    required this.header,
    this.applyBottomMargin = true,
    this.selectedValue,
    required this.items,
    required this.onDropDownValueChanged
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

          Flexible(
            child: DropdownButtonHideUnderline(
              child: DropdownButton<DropdownModels>(
                isExpanded: true,
                isDense: true,
                padding: EdgeInsets.zero,
                value: selectedValue,
                borderRadius: BorderRadius.zero,
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