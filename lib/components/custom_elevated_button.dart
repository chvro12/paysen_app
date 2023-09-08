import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:paysen/config/app_colors.dart';

class CustomElevatedButton extends StatelessWidget {
  
  final String btnLabel;
  final VoidCallback? onBtnPressed;
  final Color btnBGColor;
  final double btnElevation;
  final Color btnFGColor;
  final EdgeInsetsGeometry? btnPadding;
  final double btnBorderRadius;
  
  const CustomElevatedButton({
    super.key, 
    required this.btnLabel,
    this.onBtnPressed,
    this.btnBGColor = AppColors.pictonBlue,
    this.btnElevation = 0.0,
    this.btnFGColor = AppColors.whiteColor,
    this.btnPadding,
    this.btnBorderRadius = 60.0
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onBtnPressed,
      style: ButtonStyle(
        alignment: Alignment.center,
        animationDuration: const Duration(milliseconds: 800),
        backgroundColor: MaterialStateProperty.all(btnBGColor),
        elevation: MaterialStateProperty.all(btnElevation),
        foregroundColor: MaterialStateProperty.all(btnFGColor),
        padding: MaterialStateProperty.all(btnPadding),
        shape: MaterialStateProperty.all(RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(btnBorderRadius)
        )),
        tapTargetSize: MaterialTapTargetSize.padded,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textStyle: MaterialStateProperty.all(TextStyle(
          fontSize: 18.sp,
          color: AppColors.whiteColor,
          fontWeight: FontWeight.w500
        ))
      ),
      child: Text(btnLabel.tr),
    );
  }
}