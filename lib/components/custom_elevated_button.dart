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
  final bool? disableButton;
  final BorderSide? btnBorder;
  
  const CustomElevatedButton({
    super.key, 
    required this.btnLabel,
    this.onBtnPressed,
    this.btnBGColor = AppColors.primaryColor,
    this.btnElevation = 0.0,
    this.btnFGColor = AppColors.whiteColor,
    this.btnPadding,
    this.btnBorderRadius = 60.0,
    this.disableButton,
    this.btnBorder
  });

  @override
  Widget build(BuildContext context) {
    Set<MaterialState> interactiveStates = {};
    if (disableButton != null && disableButton!) {
      interactiveStates.add(MaterialState.disabled);
    }

    Color getBackgroundColor(Set<MaterialState> states) {
      if (states.any(interactiveStates.contains)) {
        return AppColors.borderColor;
      }
      return btnBGColor;
    }

    Color getForgroundColor(Set<MaterialState> states) {
      if (states.any(interactiveStates.contains)) {
        return AppColors.blackColor.withOpacity(0.3);
      }
      return btnFGColor;
    }

    return ElevatedButton(
      onPressed: onBtnPressed,
      style: ButtonStyle(
        alignment: Alignment.center,
        animationDuration: const Duration(milliseconds: 800),
        backgroundColor: MaterialStateProperty.resolveWith(getBackgroundColor),
        elevation: MaterialStateProperty.all(btnElevation),
        foregroundColor: MaterialStateProperty.resolveWith(getForgroundColor),
        padding: MaterialStateProperty.all(btnPadding),
        side: MaterialStateProperty.all(btnBorder),
        shape: MaterialStateProperty.all(RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(btnBorderRadius)
        )),
        tapTargetSize: MaterialTapTargetSize.padded,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textStyle: MaterialStateProperty.all(TextStyle(
          fontSize: 20.sp,
          color: AppColors.whiteColor,
          fontWeight: FontWeight.w500
        ))
      ),
      child: Text(btnLabel.tr),
    );
  }
}