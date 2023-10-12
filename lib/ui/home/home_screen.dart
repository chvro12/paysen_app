import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../components/index.dart';
import '../../config/app_assets.dart';
import '../../config/app_colors.dart';
import 'components/withdraw_topup_view.dart';

class HomeScreen extends StatelessWidget {

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Padding(
          padding: EdgeInsets.symmetric(horizontal: 0.04.sw),
          child: CustomHeader(
            showBackButton: false,
            headerLabel: 'Samba Thiam',
            headerFontSize: 20.sp,
            childBeforeTitle: CircleAvatar(
              radius: 24.0,
              backgroundColor: AppColors.transparent,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.whiteColor),
                  shape: BoxShape.circle,
                  color: AppColors.quaternaryColor
                ),
                height: double.infinity,
                width: double.infinity,
                child: Image.asset(AppAssets.fabPaysenLogo),
              ),
            ),
            actionButton: [
              CircularIconButton(
                assetIMG: AppAssets.notificationIcon,
                onCircularBtnPressed: () {},
              ),
            ],
          ),
        ),

        const CreditCardView(),

        Flexible(
          child: Container(
            decoration: const BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.vertical(top: Radius.circular(40.0))
            ),
            height: Get.height,
            padding: EdgeInsets.symmetric(horizontal: 0.04.sw, vertical: 0.02.sh),
            child: SingleChildScrollView(
              padding: EdgeInsets.only(bottom: 0.12.sh),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
            
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
            
                      Expanded(
                        child: WithdrawTopupView(
                          assetIMG: AppAssets.homeScreenWithdrawalIcon,
                          label: 'withdrawal',
                          onPressed: () {},
                        ),
                      ),
            
                      SizedBox(width: 0.04.sw,),
            
                      Expanded(
                        child: WithdrawTopupView(
                          assetIMG: AppAssets.homeScreenTopupIcon,
                          label: 'topup',
                          onPressed: () {},
                        ),
                      ),
            
                    ],
                  ),
            
                  SizedBox(height: 0.02.sh,),
            
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
            
                      CustomText(
                        label: 'transactions',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500,
                        textColor: AppColors.blackColor,
                        textSize: 22.sp,
                      ),
            
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CustomText(
                            label: 'view_all_history',
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w500,
                            textColor: AppColors.persianIndigo,
                            textSize: 14.sp,
                          ),
                          SizedBox(width: 0.01.sw,),
                          Image.asset(
                            AppAssets.arrowRightIcon,
                            color: AppColors.persianIndigo,
                          )
                        ],
                      )
            
                    ],
                  ),
            
                  SizedBox(height: 0.02.sh,),
            
                  CustomChoiceChip(
                    label: 'this_month', 
                    isSelected: true,
                    chipBGColor: AppColors.mediumPurple,
                    chipSelectedBGColor: AppColors.mediumPurple,
                    chipLabelStyle: TextStyle(
                      color: AppColors.whiteColor,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500
                    ),
                    chipPadding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 8.0),
                    onValueSelected: (value) {},
                  ),
            
                  SizedBox(height: 0.02.sh,),
                  
                ],
              ),
            ),
          ),
        )

      ],
    );
  }
}