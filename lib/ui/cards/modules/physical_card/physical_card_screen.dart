import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../components/index.dart';
import '../../../../config/app_assets.dart';
import '../../../../config/app_colors.dart';

class PhysicalCardScreen extends StatelessWidget {

  final ValueChanged<bool> showOrderCardBottomSheet;

  const PhysicalCardScreen({super.key, required this.showOrderCardBottomSheet});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
        FocusScope.of(context).unfocus();
        showOrderCardBottomSheet(false);
      },
      child: Container(
        color: AppColors.whiteColor,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.only(bottom: 92.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
            
              const CustomHeader(
                headerLabel: 'physical_card',
                showBackButton: true,
              ),
    
              SizedBox(height: 24.h,),
        
              Image.asset(AppAssets.physicalCardIMG),
        
              SizedBox(height: 36.h,),
        
              Flexible(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 12.w),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                
                      CustomText(
                        label: 'order_a_card',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500,
                        textColor: AppColors.blackColor,
                        textSize: 20.sp,
                      ),
                
                      SizedBox(height: 12.h,),
                
                      CustomText(
                        label: 'physical_card_description',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w300,
                        textColor: AppColors.blackColor,
                        textAlignment: TextAlign.center,
                        textSize: 18.sp,
                      ),
                
                    ],
                  ),
                ),
              ),
    
              SizedBox(height: 24.h,),
    
              Container(
                margin: EdgeInsets.symmetric(horizontal: 12.w),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
    
                    SizedBox(
                      height: 0.07.sh,
                      width: double.infinity,
                      child: CustomElevatedButton(
                        btnLabel: 'order_a_card',
                        onBtnPressed: () {
                          showOrderCardBottomSheet(true);
                        },
                      ),
                    ),
    
                    SizedBox(height: 12.h,),
    
                    SizedBox(
                      height: 0.07.sh,
                      width: double.infinity,
                      child: GradientElevatedButton(
                        btnLabel: 'activate_card',
                        btnBGColor: AppColors.whiteColor,
                        btnFGColor: AppColors.primaryColor,
                        onBtnPressed: () {},
                      ),
                    ),
    
                  ],
                ),
              ),
            
            ],
          ),
        ),
      ),
    );
  }
}