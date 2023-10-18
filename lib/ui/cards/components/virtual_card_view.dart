import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../components/index.dart';
import '../../../config/app_assets.dart';
import '../../../config/app_colors.dart';

class VirtualCardView extends StatelessWidget {

  const VirtualCardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 0.26.sh,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 0.04.sw),
      child: Stack(
        children: [

          Image.asset(
            AppAssets.creditCardBG, 
            width: double.infinity, 
            height: double.infinity, 
            fit: BoxFit.fill,
          ),

          Positioned(
            left: 0.06.sw,
            right: 0.06.sw,
            height: 0.26.sh,
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 0.03.sh),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      CustomText(
                        label: 'virtual_card',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500,
                        textColor: AppColors.whiteColor,
                        textSize: 20.sp,
                      ),

                      Image.asset(AppAssets.creditCardPaysenLogo),

                    ],
                  ),

                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(4, (index) {
                      return CustomText(
                        label: '****',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500,
                        textColor: AppColors.whiteColor,
                        textSize: 24.sp,
                        textLetterSpacing: 2.2,
                      );
                    }),
                  ),

                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      CustomText(
                        label: 'card_holder',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500,
                        textColor: AppColors.whiteColor,
                        textDecoration: TextDecoration.underline,
                        textDecorationStyle: TextDecorationStyle.dashed,
                        textSize: 16.sp,
                      ),
                      
                      CustomText(
                        label: 'expire',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500,
                        textColor: AppColors.whiteColor,
                        textDecoration: TextDecoration.underline,
                        textDecorationStyle: TextDecorationStyle.dashed,
                        textSize: 16.sp,
                      ),

                    ],
                  )

                ],
              ),
            ),
          ),
          
        ],
      ),
    );
  }
}