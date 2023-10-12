import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../config/app_assets.dart';
import '../config/app_colors.dart';
import 'index.dart';


class CustomBottomNavigationBar extends StatelessWidget {

  final List<Map<String, String>> bottomNavigationBarItems;
  final int selectedBottomNavigationBarItem;
  final ValueChanged<int> onBottomNavigationBarItemChanged;

  const CustomBottomNavigationBar({
    super.key,
    required this.bottomNavigationBarItems,
    required this.onBottomNavigationBarItemChanged,
    required this.selectedBottomNavigationBarItem
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80.h,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          
          CustomPaint(
            isComplex: true,
            painter: RPSCustomPainter(Theme.of(context).scaffoldBackgroundColor),
            size: Size(Get.width, 100.h),
          ),

          Positioned(
            left: 0.0,
            right: 0.0,
            bottom: 40.h,
            child: CustomShaderMask(
              child: Container(
                width: 60.0, 
                height: 60.0,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.whiteColor
                ),
              ),
            ),
          ),

          Positioned(
            left: 0.0,
            right: 0.0,
            bottom: 40.h,
            child: SizedBox(
              height: 60.0,
              width: 60.0,
              child: Image.asset(AppAssets.fabPaysenLogo),
            ),
          ),

          Positioned(
            bottom: 0.0,
            child: Container(
              width: Get.width,
              height: 54.h,
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(bottomNavigationBarItems.length, (index) {
                  final e = bottomNavigationBarItems[index];
                  String icon = e['inactive_icon'] as String;
                  String title = e['title'] as String;
                  bool isSelected = selectedBottomNavigationBarItem == index;
                  if (isSelected) {
                    icon = e['active_icon'] as String;
                  }
                  return Expanded(
                    flex: title == 'Cards' || title == 'Support' ? 2 : 1,
                    child: GestureDetector(
                      onTap: () => onBottomNavigationBarItemChanged(index),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          
                          Image.asset(icon,),
                          
                          SizedBox(height: 8.h,),
                              
                          CustomText(
                            label: title,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w500,
                            textColor: isSelected ? AppColors.quaternaryColor : AppColors.quaternaryColor.withOpacity(0.7),
                            textSize: 12.sp,
                          )
                              
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),

          Positioned(
            top: 26.h,
            child: Container(
              height: 2.h,
              width: Get.width,
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(bottomNavigationBarItems.length, (index) {
                  final e = bottomNavigationBarItems[index];
                  String title = e['title'] as String;
                  bool isSelected = selectedBottomNavigationBarItem == index;
                  return Flexible(
                    flex: title == 'Cards' || title == 'Support' ? 2 : 1,
                    child: Center(
                      child: Container(
                        width: 24.w,
                        height: 28.h,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: isSelected ? AppColors.quaternaryColor : AppColors.transparent,
                          borderRadius: BorderRadius.circular(24.0)
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
          )
    
        ],
      ),
    );
  }
}

class RPSCustomPainter extends CustomPainter {

  final Color color;

  RPSCustomPainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.5569930, size.height * 0.4924095);
    path_0.cubicTo(size.width * 0.5735558, size.height * 0.4299284, size.width * 0.5933372, size.height * 0.3553017, size.width * 0.6441860, size.height * 0.3189655);
    path_0.lineTo(size.width * 0.9441860, size.height * 0.3189655);
    path_0.cubicTo(size.width * 0.9750116, size.height * 0.3189655, size.width, size.height * 0.4115966, size.width, size.height * 0.5258621);
    path_0.lineTo(size.width, size.height * 1.008621);
    path_0.lineTo(0, size.height * 1.008621);
    path_0.lineTo(0, size.height * 0.5258621);
    path_0.cubicTo(0, size.height * 0.4115966, size.width * 0.02498884, size.height * 0.3189655, size.width * 0.05581395, size.height * 0.3189655);
    path_0.lineTo(size.width * 0.3558140, size.height * 0.3189655);
    path_0.cubicTo(size.width * 0.4041721, size.height * 0.3511405, size.width * 0.4259419, size.height * 0.4274293, size.width * 0.4442651, size.height * 0.4916440);
    path_0.cubicTo(size.width * 0.4603070, size.height * 0.5478638, size.width * 0.4737070, size.height * 0.5948276, size.width * 0.5000000, size.height * 0.5948276);
    path_0.cubicTo(size.width * 0.5298442, size.height * 0.5948276, size.width * 0.5421209, size.height * 0.5485155, size.width * 0.5569930, size.height * 0.4924095);
    path_0.close();

    Paint paint0Fill = Paint()..style=PaintingStyle.fill;
    paint0Fill.color = color;
    canvas.drawPath(path_0,paint0Fill);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}