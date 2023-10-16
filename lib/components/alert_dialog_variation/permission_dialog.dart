import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../config/app_colors.dart';
import '../index.dart';

class PermissionDialog extends StatelessWidget {

  final String title;
  final String description;
  final bool visibleSettingBtn;

  const PermissionDialog({
    super.key, 
    required this.description, 
    required this.title,
    this.visibleSettingBtn = false
  });

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
      color: AppColors.blackColor,
      fontSize: 18.sp,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w700
    );
    return AlertDialog.adaptive(
      titleTextStyle: textStyle,
      title: Text(title.tr),
      contentTextStyle: textStyle.copyWith(
        fontSize: 14.sp,
        fontWeight: FontWeight.w300
      ),
      content: Text(description.tr),
      actions: [
        if (visibleSettingBtn)
          CustomTextButton(
            label: 'settings',
            onPressed: () {
              openAppSettings();
              Get.back();
            },
          ),
        CustomTextButton(
          label: 'ok',
          onPressed: () => Get.back(),
        )
      ],
    );
  }
}