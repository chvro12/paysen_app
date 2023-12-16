import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../config/app_assets.dart';
import '../config/app_colors.dart';
import '../config/app_logger.dart';
import '../ui/dashboard/controller/dashboard_controller.dart';
import 'index.dart';

class TwoOptionsBottomSheet extends StatelessWidget {

  final String header;
  final String assetIMG1;
  final String label1;
  final Size? iMGSize1;
  final Color? iMGColor1;
  final VoidCallback onPressed1;
  final String assetIMG2;
  final String label2;
  final Size? iMGSize2;
  final Color? iMGColor2;
  final VoidCallback onPressed2;
  final double bottomSheetHeight;
  final VoidCallback? onCloseBottomSheet;
  final bool useCustomBarrierColor;

  const TwoOptionsBottomSheet({
    super.key,
    required this.header,
    required this.assetIMG1,
    required this.assetIMG2,
    required this.label1,
    required this.label2,
    required this.onPressed1,
    required this.onPressed2,
    this.iMGSize1,
    this.iMGSize2,
    this.bottomSheetHeight = 320.0,
    this.iMGColor1,
    this.iMGColor2,
    this.onCloseBottomSheet,
    this.useCustomBarrierColor = true
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
    
            if (useCustomBarrierColor)
              Container(color: AppColors.bottomSheetBarrierColor,),
    
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
                    
                    SizedBox(height: 32.h,),
                    
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        
                        Expanded(
                          child: _TwoOptionBottomSheetItemView(
                            assetIMG: assetIMG1,
                            label: label1,
                            iMGSize: iMGSize1,
                            iMGColor: iMGColor1,
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
                          child: _TwoOptionBottomSheetItemView(
                            assetIMG: assetIMG2,
                            label: label2,
                            iMGSize: iMGSize2,
                            iMGColor: iMGColor2,
                            onPressed: () {
                              if (onCloseBottomSheet != null) {
                                onCloseBottomSheet!();
                                onPressed2();
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
    dashboardController.onDocUploadOptionBottomSheetChanged(false);
    dashboardController.onOrderCardBottomSheetChanged(false);
  }
}

class _TwoOptionBottomSheetItemView extends StatelessWidget {

  final String assetIMG;
  final String label;
  final VoidCallback onPressed;
  final Size? iMGSize;
  final Color? iMGColor;

  const _TwoOptionBottomSheetItemView({
    required this.assetIMG,
    required this.label,
    required this.onPressed,
    this.iMGSize,
    this.iMGColor
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 110.0.h,
        padding: const EdgeInsets.all(2.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          gradient: const LinearGradient(
            colors: <Color>[
              AppColors.primaryColor,
              AppColors.secondaryColor
            ]
          )
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.0),
            color: AppColors.whiteColor
          ),
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
    
              Image.asset(
                assetIMG,
                height: iMGSize?.height,
                width: iMGSize?.width,
                color: iMGColor,
              ),
    
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
    
                  Flexible(
                    child: CustomText(
                      label: label,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w500,
                      textColor: AppColors.blackColor,
                      textSize: 15.sp,
                    ),
                  ),
    
                  SizedBox(width: 8.w,),
    
                  Image.asset(
                    AppAssets.arrowRightIcon,
                    color: AppColors.blackColor,
                  )
    
                ],
              )
    
            ],
          ),
        ),
      ),
    );
  }
}