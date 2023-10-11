import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:paysen/components/index.dart';

import '../../../config/app_assets.dart';
import '../../../config/app_colors.dart';

class WithdrawTopupView extends StatelessWidget {

  final String assetIMG;
  final String label;
  final VoidCallback onPressed;

  const WithdrawTopupView({
    super.key,
    required this.assetIMG,
    required this.label,
    required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 0.128.sh,
        decoration: BoxDecoration(
          gradient: AppColors.linearGradient1,
          borderRadius: BorderRadius.circular(16.0)
        ),
        padding: EdgeInsets.symmetric(vertical: 0.02.sh, horizontal: 0.04.sw),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
    
            Container(
              width: 0.1.sw,
              height: 0.1.sw,
              padding: EdgeInsets.all(0.001.sh),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6.0),
                shape: BoxShape.rectangle,
                gradient: const LinearGradient(
                  colors: <Color>[AppColors.diamond, AppColors.diamond],
                  stops: [0.0, 1.0]
                )
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6.0),
                  shape: BoxShape.rectangle,
                  color: AppColors.babyBlueEyes
                ),
                padding: const EdgeInsets.all(6.0),
                child: Image.asset(
                  assetIMG,
                  fit: BoxFit.fill,
                ),
              ),
            ),
    
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
    
                CustomText(
                  label: label,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w500,
                  textColor: AppColors.whiteColor,
                  textSize: 14.sp,
                ),
    
                Image.asset(AppAssets.arrowRightIcon)
    
              ],
            )
    
          ],
        ),
      ),
    );
  }
}

class GradientBorderPainter extends CustomPainter {
  
  final List<Color> colors;
  final double width;

  GradientBorderPainter({
    required this.colors,
    required this.width,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..shader = LinearGradient(
        colors: colors,
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    canvas.drawPath(
      Path()
        ..addRect(Rect.fromLTWH(0, 0, size.width, size.height))
        ..close(),
      paint,
    );
  }

  @override
  bool shouldRepaint(GradientBorderPainter oldDelegate) =>
      colors != oldDelegate.colors || width != oldDelegate.width;
}
