import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../config/app_colors.dart';

class GroupInputField extends StatelessWidget {

  final String groupLabel;
  final List<Widget> multipleFields;

  const GroupInputField({
    super.key, 
    required this.groupLabel, 
    required this.multipleFields
  });

  @override
  Widget build(BuildContext context) {
    return InputDecorator(
      decoration: InputDecoration(
        labelText: groupLabel.tr,
        contentPadding: EdgeInsets.all(0.02.sh),
        labelStyle: TextStyle(
          color: AppColors.secondaryColor,
          fontSize: 14.sp,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w500
        ),
        alignLabelWithHint: true,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: const BorderSide(color: AppColors.primaryColor)
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: multipleFields,
      ),
    );
  }
}