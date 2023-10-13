import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../components/index.dart';
import '../../../../config/app_colors.dart';
import 'controller/mobile_money_bank_card_controller.dart';

class MobileMoneyBankCardScreen extends StatelessWidget {

  MobileMoneyBankCardScreen({super.key});

  final mobileMoneyBankCardController = Get.put(MobileMoneyBankCardController());

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.whiteColor,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [

          const CustomHeader(
            headerLabel: 'add_money',
            showBackButton: true,
          ),

          Flexible(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [

                  MobileNumberChangeView(
                    mobileNoWithCountryCode: '+221 78194324', 
                    onMobileNoChange: mobileMoneyBankCardController.onMobileNoChange, 
                    onAmountChange: mobileMoneyBankCardController.onAmountChange, 
                    editingController: mobileMoneyBankCardController.amountController,
                    useSpacer: false,
                  ),

                  SizedBox(height: 12.h,),

                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(horizontal: 12.w),
                    alignment: Alignment.centerRight,
                    child: CustomText(
                      label: 'no_fee',
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w300,
                      textAlignment: TextAlign.end,
                      textColor: AppColors.tertiaryColor,
                      textSize: 16.sp,
                    ),
                  ),

                  SizedBox(height: 0.3.sh,),

                  Container(
                    height: 0.07.sh,
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(horizontal: 12.w),
                    child: CustomElevatedButton(
                      btnLabel: 'send',
                      onBtnPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
          )

        ],
      ),
    );
  }
}