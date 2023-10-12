import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../components/index.dart';
import '../../../config/app_colors.dart';

class CardView extends StatelessWidget {

  final List<Color> linearGradientColor;
  final String assetIMG;
  final String label;
  final VoidCallback? onPressed;

  const CardView({
    super.key,
    required this.linearGradientColor,
    required this.assetIMG,
    required this.label,
    this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 0.22.sh,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0)
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: linearGradientColor,
                    stops: const [0.0, 1.0],
                  ),
                ),
              ),
            ),
    
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      AppColors.freshAir,
                      Colors.transparent,
                    ],
                    stops: [0.0, 0.7763],
                  ),
                ),
              ),
            ),
    
            Padding(
              padding: EdgeInsets.symmetric(vertical: 0.044.sh),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
            
                  Image.asset(assetIMG),
            
                  CustomText(
                    label: label,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w500,
                    textColor: AppColors.whiteColor,
                    textSize: 22.sp,
                  )
            
                ],
              ),
            )
    
          ],
        ),
      ),
    );
  }
}