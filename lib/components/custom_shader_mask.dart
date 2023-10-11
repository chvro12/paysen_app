import 'package:flutter/material.dart';
import 'package:paysen/config/app_colors.dart';

class CustomShaderMask extends StatelessWidget {

  final Widget? child;

  const CustomShaderMask({
    super.key,
    this.child
  });

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) {
        return const LinearGradient(
          colors: [
            AppColors.orchid,
            AppColors.turkishRose,
            AppColors.cornflowerBlue
          ],
          stops: [-0.0373, -0.0372, 1.0654],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ).createShader(bounds);
      },
      child: child,
    );
  }
}