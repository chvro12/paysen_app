import 'package:flutter/material.dart';

import '../config/app_colors.dart';
import 'index.dart';

class CustomChoiceChip extends StatelessWidget {

  final String label;
  final bool isSelected;
  final double chipElevation;
  final EdgeInsetsGeometry? chipLabelPadding;
  final EdgeInsetsGeometry? chipPadding;
  final TextStyle? chipLabelStyle;
  final ValueChanged<bool>? onValueSelected;
  final Color? chipBGColor;
  final Color chipSelectedBGColor;

  const CustomChoiceChip({
    super.key,
    required this.label,
    required this.isSelected,
    this.chipElevation = 0.0,
    this.chipLabelPadding,
    this.chipPadding,
    this.chipLabelStyle,
    this.onValueSelected,
    this.chipBGColor,
    this.chipSelectedBGColor = AppColors.tertiaryColor
  });

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      label: CustomText(
        label: label,
        textColor: chipLabelStyle?.color ?? AppColors.whiteColor,
      ),
      selected: isSelected,
      backgroundColor: chipBGColor ?? AppColors.tertiaryColor.withOpacity(0.3),
      elevation: chipElevation,
      labelPadding: chipLabelPadding,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      onSelected: onValueSelected,
      padding: chipPadding,
      selectedColor: chipSelectedBGColor,
      showCheckmark: false,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      labelStyle: chipLabelStyle,
    );
  }
}