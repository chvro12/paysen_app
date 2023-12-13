import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:paysen/config/app_colors.dart';

class CustomText extends StatelessWidget {

  final String label;
  final int? maximumLines;
  final TextOverflow? overflow;
  final TextAlign textAlignment;
  final Color? textColor;
  final TextDecoration? textDecoration;
  final TextDecorationStyle? textDecorationStyle;
  final double? textDecorationThickness;
  final double? textSize;
  final FontStyle? fontStyle;
  final FontWeight? fontWeight;
  final double? textLetterSpacing;
  final Color? textDecorationColor;

  const CustomText({
    super.key,
    required this.label,
    this.maximumLines,
    this.overflow,
    this.textAlignment = TextAlign.start,
    this.textColor = AppColors.blackColor,
    this.textDecoration,
    this.textDecorationStyle,
    this.textDecorationThickness,
    this.textSize,
    this.fontStyle = FontStyle.normal,
    this.fontWeight = FontWeight.w400,
    this.textLetterSpacing,
    this.textDecorationColor
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      label.tr,
      maxLines: maximumLines,
      overflow: overflow,
      textAlign: textAlignment,
      style: TextStyle(
        color: textColor,
        decorationColor: textDecorationColor,
        decoration: textDecoration,
        decorationStyle: textDecorationStyle,
        decorationThickness: textDecorationThickness,
        fontFamily: 'Folio-Std',
        letterSpacing: textLetterSpacing,
        fontSize: textSize ?? 14.sp,
        fontStyle: fontStyle,
        fontWeight: fontWeight
      ),
    );
  }
}