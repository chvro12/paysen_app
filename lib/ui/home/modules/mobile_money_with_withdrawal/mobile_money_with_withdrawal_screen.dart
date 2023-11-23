import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../components/index.dart';
import '../../../../config/app_colors.dart';
import 'controller/mobile_money_with_withdrawal_controller.dart';

class MobileMoneyWithWithdrawalScreen extends StatelessWidget {

  MobileMoneyWithWithdrawalScreen({super.key});

  final mobileMoneyWithWithdrawalController = Get.put(MobileMoneyWithWithdrawalController());

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.whiteColor,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
    
          const CustomHeader(
            headerLabel: 'money_withdraw',
            showBackButton: true,
          ),

          SizedBox(height: 24.h,),

          Flexible(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  MobileNumberChangeView(
                    mobileNoWithCountryCode: '+221',
                    onMobileNoChange: () {},
                    editingController: mobileMoneyWithWithdrawalController.amountController,
                    onAmountChange: mobileMoneyWithWithdrawalController.onAmountChange,
                    isUpdatingMobileNo: false,
                    mobileNoController: mobileMoneyWithWithdrawalController.mobileNoController,
                  ),

                  MoneyOverview(
                    moneyOverviewItems: [

                      const MoneyOverviewItemView(
                        label: 'paysen_fees',
                        value: '0',
                      ),

                      const MoneyOverviewItemView(
                        label: 'operator_fees',
                        value: '0',
                        showBorder: false,
                      ),

                      Container(
                        height: 50.h,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.brightGray),
                          borderRadius: BorderRadius.circular(20.0),
                          color: AppColors.cultured
                        ),
                        padding: EdgeInsets.only(left: 18.w, right: 18.w),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                            Container(
                              margin: EdgeInsets.only(top: 6.h),
                              child: CustomText(
                                label: 'final_amount',
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w500,
                                textColor: AppColors.blackColor,
                                textSize: 16.sp,
                              ),
                            ),

                            Container(
                              margin: EdgeInsets.only(top: 6.h),
                              child: CustomText(
                                label: '500',
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w500,
                                textColor: AppColors.red,
                                textSize: 18.sp,
                              ),
                            ),

                          ],
                        ),
                      )

                    ],
                  ),

                  SizedBox(height: 36.h,),

                  Container(
                    height: 0.07.sh,
                    width: 1.sw,
                    margin: EdgeInsets.symmetric(horizontal: 12.w),
                    child: CustomElevatedButton(
                      btnLabel: 'withdraw',
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