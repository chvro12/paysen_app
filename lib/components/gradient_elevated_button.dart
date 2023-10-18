import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:paysen/components/index.dart';

import '../config/app_colors.dart';

class GradientElevatedButton extends StatelessWidget {

  final String btnLabel;
  final VoidCallback? onBtnPressed;
  final Color btnBGColor;
  final double btnElevation;
  final Color btnFGColor;
  final EdgeInsetsGeometry? btnPadding;
  final double btnBorderRadius;
  final bool? disableButton;
  final BorderSide? btnBorder;

  const GradientElevatedButton({
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
    return Container(
      height: 0.07.sh,
      width: double.infinity,
      padding: const EdgeInsets.all(2.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(btnBorderRadius),
        gradient: const LinearGradient(
          colors: <Color>[
            AppColors.primaryColor,
            AppColors.secondaryColor
          ]
        ),
      ),
      child: CustomElevatedButton(
        btnLabel: btnLabel,
        btnBGColor: btnBGColor,
        btnBorder: btnBorder,
        btnBorderRadius: btnBorderRadius,
        btnElevation: btnElevation,
        btnFGColor: btnFGColor,
        btnPadding: btnPadding,
        disableButton: disableButton,
        onBtnPressed: onBtnPressed,
      ),
    );
  }
}