import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../components/index.dart';
import '../../../../config/app_colors.dart';
import 'controller/mobile_money_with_withdrawal_controller.dart';

class MobileMoneyWithWithdrawalScreen extends StatelessWidget {

  const MobileMoneyWithWithdrawalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mobileMoneyWithWithdrawalController = Get.put(MobileMoneyWithWithdrawalController());
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

          Flexible(
            child: SingleChildScrollView(
              padding: EdgeInsets.only(bottom: 96.h),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  SizedBox(height: 24.h,),

                  Flexible(
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 12.w),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      
                          const CustomText(
                            label: 'withdrawal_methods',
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w500,
                            textSize: 18,
                          ),
                      
                          const SizedBox(height: 12,),
                      
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: List.generate(mobileMoneyWithWithdrawalController.paymentTypeItemList.length, (index) {
                              final e = mobileMoneyWithWithdrawalController.paymentTypeItemList[index];
                              return Expanded(
                                child: GestureDetector(
                                  onTap: () => mobileMoneyWithWithdrawalController.onPaymentTypeChange(e['label']!),
                                  child: Obx(() {
                                    final isSelected = e['label'] == mobileMoneyWithWithdrawalController.selectedPaymentType.value;
                                    return Container(
                                      width: 120.0,
                                      margin: index == 0 
                                      ? const EdgeInsets.only(right: 8)
                                      : EdgeInsets.zero,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: isSelected 
                                          ? AppColors.primaryColor
                                          : AppColors.gray.withOpacity(0.2)
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                        shape: BoxShape.rectangle
                                      ),
                                      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          
                                          Image.asset(
                                            e['assetIMG']!,
                                            height: 60,
                                            width: 60,
                                          ),
                                                              
                                          const SizedBox(width: 12,),
                                                              
                                          Flexible(
                                            child: CustomText(
                                              label: e['label']!,
                                              fontStyle: FontStyle.normal,
                                              fontWeight: FontWeight.w500,
                                              textColor: isSelected ? AppColors.primaryColor : null,
                                              textSize: 16,
                                            ),
                                          )
                                                              
                                        ],
                                      ),
                                    );
                                  }),
                                ),
                              );
                            }),
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 24.h,),

                  MobileNumberChangeView(
                    mobileNoWithCountryCode: '+221',
                    isFieldEnabled: false,
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
                              child: Obx(() => CustomText(
                                label: mobileMoneyWithWithdrawalController.reactiveAmount.value,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w500,
                                textColor: AppColors.red,
                                textSize: 18.sp,
                              )),
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
                      onBtnPressed: () => mobileMoneyWithWithdrawalController.sendWithdrawalRequest(),
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