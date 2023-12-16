import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../components/index.dart';
import '../../../../../config/app_colors.dart';
import '../controller/activate_card_controller.dart';

class ActivateCardThirdStepper extends StatelessWidget {
  
  final ValueChanged<bool> showDocUploadOptionBottomSheet;

  const ActivateCardThirdStepper({super.key, required this.showDocUploadOptionBottomSheet});

  @override
  Widget build(BuildContext context) {
    final ActivateCardController activateCardController = Get.find();
    return Container(
      color: AppColors.whiteColor,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const CustomHeader(
            showBackButton: true,
          ),
          SizedBox(
            height: 24.h,
          ),
          Flexible(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Flexible(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12.w),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            label: 'Select the document you wish to upload',
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w500,
                            textColor: AppColors.blackColor,
                            textSize: 22.sp,
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          CustomText(
                            label: 'All documents are mandatory to upload',
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w300,
                            textColor: AppColors.blackColor,
                            textSize: 16.sp,
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 24.h),

                  Flexible(
                    child: Obx(() {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: activateCardController.uploadDocType.keys.map((e) {
                          return GestureDetector(
                            onTap: () {
                              activateCardController.onSelectUploadDocType(e);
                              showDocUploadOptionBottomSheet(true);
                            },
                            child: _CustomThirdStepperTileView(
                              uploadDocType: activateCardController.uploadDocType,
                              e: e,
                              onIMGPreviewPressed: () => activateCardController.onIMGPreviewPressed(e),
                            ),
                          );
                        }).toList(),
                      );
                    }),
                  ),

                  SizedBox(height: 48.h),

                  Container(
                    height: 0.07.sh,
                    width: 1.sw,
                    margin: EdgeInsets.symmetric(horizontal: 12.w),
                    child: CustomElevatedButton(
                      btnLabel: 'submit',
                      onBtnPressed: () {},
                    ),
                  ),

                  SizedBox(height: 120.h,),

                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _CustomThirdStepperTileView extends StatelessWidget {

  final Map<String, File?> uploadDocType;
  final String e;
  final VoidCallback onIMGPreviewPressed;

  const _CustomThirdStepperTileView({
    required this.uploadDocType,
    required this.e,
    required this.onIMGPreviewPressed
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h,
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        border: Border(
          bottom: BorderSide(
            color: uploadDocType.keys.last == e
            ? AppColors.transparent
            : AppColors.borderColor
          )
        )
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
    
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
    
                CustomText(
                  label: e,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w300,
                  textColor: AppColors.blackColor,
                  textSize: 18.sp,
                ),
    
                if (uploadDocType[e] != null && uploadDocType[e]!.existsSync()) ...[
                  SizedBox(height: 4.h),
                  GestureDetector(
                    onTap: onIMGPreviewPressed,
                    child: CustomText(
                      label: 'Preview IMG',
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w500,
                      textColor: AppColors.secondaryColor,
                      textSize: 14.sp,
                    ),
                  ),
                ],
              ],
            ),
          ),
          const Icon(Icons.arrow_forward_ios_rounded)
        ],
      ),
    );
  }
}
