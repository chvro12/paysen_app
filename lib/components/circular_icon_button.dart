import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../config/app_colors.dart';

class CircularIconButton extends StatelessWidget {

  final String assetIMG;
  final Size? containerSize;
  final VoidCallback? onCircularBtnPressed;

  const CircularIconButton({
    super.key,
    required this.assetIMG,
    this.containerSize,
    this.onCircularBtnPressed
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onCircularBtnPressed,
      child: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          color: AppColors.whiteColor,
          shape: BoxShape.circle,
        ),
        height: containerSize?.height ?? 0.1123.sw,
        width: containerSize?.width ?? 0.1123.sw,
        child: Image.asset(assetIMG),
      ),
    );
  }
}