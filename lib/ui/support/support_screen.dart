import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../components/index.dart';
import '../../config/app_assets.dart';
import '../../config/app_colors.dart';

class SupportScreen extends StatelessWidget {

  const SupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [

        const CustomHeader(
          headerLabel: 'support',
        ),

        SizedBox(height: 24.h,),

        Flexible(
          child: Container(
            decoration: const BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.vertical(top: Radius.circular(40.0))
            ),
            height: Get.height,
            width: Get.width,
            padding: EdgeInsets.symmetric(horizontal: 0.04.sw, vertical: 0.04.sh),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [

                  CustomText(
                    label: 'support_title',
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w500,
                    textColor: AppColors.blackColor,
                    textSize: 30.sp,
                  ),

                  SizedBox(height: 0.02.sh,),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 0.04.sw),
                    child: CustomText(
                      label: 'support_description',
                      fontStyle: FontStyle.normal,
                      textAlignment: TextAlign.center,
                      fontWeight: FontWeight.w300,
                      textColor: AppColors.blackColor,
                      textSize: 16.sp,
                    ),
                  ),

                  SizedBox(height: 0.02.sh,),

                  Image.asset(
                    AppAssets.supportIMG,
                    height: 200.h,
                  ),

                  SizedBox(height: 0.06.sh,),

                  SizedBox(
                    width: double.infinity,
                    height: 0.07.sh,
                    child: CustomElevatedButton(
                      btnLabel: 'access_chat',
                      btnElevation: 0.0,
                      btnBorderRadius: 60.0,
                      onBtnPressed: () {},
                    ),
                  )

                ],
              ),
            ),
          ),
        )

      ],
    );
  }
}