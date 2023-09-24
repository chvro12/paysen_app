import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTextButton extends StatelessWidget {

  final String label;
  final VoidCallback? onPressed;
  final Color? bGColor;
  final Color? fGColor;

  const CustomTextButton({
    super.key, 
    this.onPressed,
    this.label = '',
    this.bGColor,
    this.fGColor
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        alignment: Alignment.center,
        animationDuration: const Duration(milliseconds: 800),
        backgroundColor: MaterialStateProperty.all(bGColor),
        elevation: MaterialStateProperty.all(0.0),
        foregroundColor: MaterialStateProperty.all(fGColor),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        tapTargetSize: MaterialTapTargetSize.padded
      ),
      child: Text(label.tr),
    );
  }
}