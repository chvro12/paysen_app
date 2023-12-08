import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:paysen/components/index.dart';
import 'package:paysen/config/app_colors.dart';

class EndpointReqFailDialog extends StatelessWidget {

  final String title;
  final String description;
  final VoidCallback? onBtnPressed;

  const EndpointReqFailDialog({
    super.key, 
    required this.description, 
    required this.title,
    this.onBtnPressed
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
      backgroundColor: AppColors.whiteColor,
      title: Text(title.tr),
      content: Text(description.tr),
      contentTextStyle: textStyle.copyWith(
        fontSize: 14.sp,
        fontWeight: FontWeight.w300
      ),
      actions: [
        CustomTextButton(
          label: 'ok',
          onPressed: () {
            Get.back();
            if (onBtnPressed != null) {
              onBtnPressed!();
            }
          },
        )
      ],
    );
  }
}