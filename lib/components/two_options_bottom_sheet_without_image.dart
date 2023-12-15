import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../config/app_colors.dart';
import '../config/app_logger.dart';
import '../ui/dashboard/controller/dashboard_controller.dart';
import 'index.dart';

class TwoOptionsBottomSheetWithoutIMG extends StatelessWidget {

  final String header;
  final String subHeader;
  final String label1;
  final VoidCallback onPressed1;
  final String label2;
  final VoidCallback onPressed2;
  final double bottomSheetHeight;
  final VoidCallback? onCloseBottomSheet;

  const TwoOptionsBottomSheetWithoutIMG({
    super.key,
    required this.header,
    required this.label1,
    required this.label2,
    required this.onPressed1,
    required this.onPressed2,
    this.bottomSheetHeight = 320.0,
    this.onCloseBottomSheet,
    this.subHeader = ''
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onCloseBottomSheet != null) {
          onCloseBottomSheet!();
          return;
        }
        try {
          _onCloseTwoOptionBottomSheet();
        } on Exception catch (e) {
          AppLogger.e('Exception: $e', e);  
        }
      },
      child: SizedBox(
        height: Get.height,
        width: Get.width,
        child: Stack(
          clipBehavior: Clip.none,
          fit: StackFit.loose,
          children: [
    
            Container(
              color: AppColors.bottomSheetBarrierColor,
            ),
    
            Positioned(
              bottom: 0.0,
              child: Container(
                height: bottomSheetHeight.h,
                width: Get.width,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(40.0)),
                  color: AppColors.whiteColor
                ),
                padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 12.h),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    
                    Center(
                      child: Container(
                        height: 6.h,
                        width: 56.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.0),
                          color: AppColors.lightSilver
                        ),
                      ),
                    ),
                    
                    SizedBox(height: 24.h,),
                    
                    CustomText(
                      label: header,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w500,
                      textColor: AppColors.blackColor,
                      textSize: 24.sp,
                    ),
                    
                    SizedBox(height: 18.h,),
                    
                    CustomText(
                      label: subHeader,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w300,
                      textColor: AppColors.blackColor,
                      textSize: 18.sp,
                      textAlignment: TextAlign.center,
                    ),

                    SizedBox(height: 32.h,),
                    
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        
                        Expanded(
                          child: _TwoOptionBottomSheetItemViewWithoutIMG(
                            label: label1,
                            onPressed: () {
                              if (onCloseBottomSheet != null) {
                                onCloseBottomSheet!();
                                onPressed1();
                                return;
                              }

                              try {
                                _onCloseTwoOptionBottomSheet();
                              } on Exception catch (e) {
                                AppLogger.e('Exception: $e', e);  
                              }
                              onPressed1();
                            },
                          ),
                        ),
                        
                        SizedBox(width: 8.w,),
                        
                        Expanded(
                          child: _TwoOptionBottomSheetItemViewWithoutIMG(
                            label: label2,
                            onPressed: () {
                              if (onCloseBottomSheet != null) {
                                onCloseBottomSheet!();
                                onPressed1();
                                return;
                              }
                              
                              try {
                                _onCloseTwoOptionBottomSheet();
                              } on Exception catch (e) {
                                AppLogger.e('Exception: $e', e);  
                              }
                              onPressed2();
                            },
                          ),
                        )
    
                      ],
                    )
    
                  ],
                ),
              ),
            )
    
          ],
        ),
      ),
    );
  }

  void _onCloseTwoOptionBottomSheet() {
    DashboardController dashboardController = Get.find();

    dashboardController.onTopupBottomSheetChanged(false);
    dashboardController.onWithdrawBottomSheetChanged(false);
    dashboardController.onOrderCardBottomSheetChanged(false);
  }
}

class _TwoOptionBottomSheetItemViewWithoutIMG extends StatelessWidget {

  final String label;
  final VoidCallback onPressed;

  const _TwoOptionBottomSheetItemViewWithoutIMG({
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 48.h,
        padding: const EdgeInsets.all(2.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(36.0),
          gradient: const LinearGradient(
            colors: <Color>[
              AppColors.primaryColor,
              AppColors.secondaryColor
            ]
          )
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(36.0),
            color: AppColors.whiteColor
          ),
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
          child: CustomText(
            label: label,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w500,
            textColor: AppColors.primaryColor,
            textSize: 20.sp,
          ),
        ),
      ),
    );
  }
}