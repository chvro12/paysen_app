import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:paysen/config/app_enums.dart';
import 'package:screenshot/screenshot.dart';

import '../../../../components/index.dart';
import '../../../../config/app_assets.dart';
import '../../../../config/app_colors.dart';
import 'controller/transaction_detail_controller.dart';

class TransactionDetailScreen extends StatelessWidget {

  final String clientTransactionReference;

  const TransactionDetailScreen({
    super.key,
    required this.clientTransactionReference
  });

  @override
  Widget build(BuildContext context) {
    final TransactionDetailController transactionDetailController = Get.put(TransactionDetailController(clientTransactionReference));
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        const CustomHeader(
          headerLabel: 'transaction_details',
          showBackButton: true,
        ),

        SizedBox(height: 24.h,),

        Flexible(
          child: Screenshot(
            controller: transactionDetailController.screenshotController,
            child: Container(
              decoration: const BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.vertical(top: Radius.circular(40.0))
              ),
              height: Get.height,
              width: Get.width,
              child: Obx(() => transactionDetailController.transactionModel.value == null
              ? const SizedBox.shrink()
              : SingleChildScrollView(
                scrollDirection: Axis.vertical,
                padding: EdgeInsets.only(left: 18.w, right: 18.w, top: 24.h, bottom: 104.h),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
            
                    CustomText(
                      label: transactionDetailController.transactionModel.value!.cardTransactionType == TransactionType.credit ? 'topup' : 'withdrawal',
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w500,
                      textColor: AppColors.blackColor,
                      textSize: 24.sp,
                    ),
            
                    SizedBox(height: 12.h,),
            
                    Flexible(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
            
                          CustomText(
                            label: 'ID : ${transactionDetailController.transactionModel.value!.bridgecardTransactionReference}',
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w300,
                            textColor: AppColors.quartz,
                            textSize: 14.sp,
                            textAlignment: TextAlign.center,
                          ),
            
                          SizedBox(height: 4.h,),
            
                          CustomText(
                            label: 'at ${transactionDetailController.transactionModel.value!.transactionTimestamp.humanReadableFormat('dd/MM/yyyy HH:mm')}',
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w300,
                            textColor: AppColors.quartz,
                            textSize: 14.sp,
                            textAlignment: TextAlign.center,
                          ),
            
                        ],
                      ),
                    ),
            
                    SizedBox(height: 24.h,),
            
                    MoneyOverview(
                      containerBGColor: AppColors.whiteColor,
                      containerMargin: EdgeInsets.zero,
                      moneyOverviewItems: [
              
                        MoneyOverviewItemView(
                          label: 'status',
                          value: '',
                          showBorder: true,
                          replaceValueWidget: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4.0),
                              color: AppColors.apple,
                              shape: BoxShape.rectangle
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                            child: CustomText(
                              label: 'proceed',
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w300,
                              textColor: AppColors.whiteColor,
                              textSize: 14.sp,
                            ),
                          ),
                        ),
            
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 18.w),
                          child: const Divider(height: 4.0, thickness: 1.0, color: AppColors.transparent),
                        ),
              
                        const MoneyOverviewItemView(
                          label: 'recipient',
                          labelTextStyle: TextStyle(color: AppColors.gray),
                          value: '+221781949324',
                          showBorder: true,
                        ),
            
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 18.w),
                          child: const Divider(height: 4.0, thickness: 1.0, color: AppColors.transparent),
                        ),
              
                        const MoneyOverviewItemView(
                          label: 'operator_id',
                          labelTextStyle: TextStyle(color: AppColors.gray),
                          value: 'EA230814.110034.N265394',
                          showBorder: false,
                        ),
            
                        // Padding(
                        //   padding: EdgeInsets.symmetric(horizontal: 18.w),
                        //   child: const Divider(height: 4.0, thickness: 1.0, color: AppColors.transparent),
                        // ),
              
                        // const MoneyOverviewItemView(
                        //   label: 'converted_amount',
                        //   labelTextStyle: TextStyle(color: AppColors.gray),
                        //   value: '0 CFA',
                        //   showBorder: false,
                        // ),
            
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            border: Border.all(color: AppColors.borderColor),
                            color: AppColors.cultured,
                          ),
                          padding: EdgeInsets.symmetric(vertical: 18.h, horizontal: 18.w),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
            
                                  CustomText(
                                    label: 'order_details',
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w500,
                                    textColor: AppColors.blackColor,
                                    textSize: 16.sp,
                                  ),
            
                                  CustomText(
                                    label: '${transactionDetailController.transactionModel.value!.cardTransactionType == TransactionType.debit ? "-" : ""} ${transactionDetailController.transactionModel.value!.amount.round()} CFA'.trim(),
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w500,
                                    textColor: AppColors.blackColor,
                                    textSize: 20.sp,
                                  )
            
                                ],
                              ),
            
                              SizedBox(height: 8.h,),
            
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
            
                                  CustomText(
                                    label: 'automatic',
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w300,
                                    textColor: AppColors.blackColor.withOpacity(0.5),
                                    textSize: 14.sp,
                                  ),
            
                                  CustomText(
                                    label: 'securely_via_paysen',
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w300,
                                    textColor: AppColors.blackColor.withOpacity(0.5),
                                    textSize: 14.sp,
                                  )
            
                                ],
                              ),
            
                              SizedBox(height: 24.h,),
            
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
            
                                  Image.asset(AppAssets.paysenLogo1),
            
                                  SizedBox(
                                    height: 40.h,
                                    child: CustomElevatedButton(
                                      btnLabel: 'share',
                                      btnBGColor: AppColors.primaryColor,
                                      btnBorderRadius: 60.0,
                                      btnElevation: 0.0,
                                      btnFGColor: AppColors.whiteColor,
                                      onBtnPressed: () => transactionDetailController.shareTransactionScreenshot(),
                                    ),
                                  )
            
                                ],
                              ),
            
                            ],
                          ),
                        )
              
                      ],
                    ),
            
                  ],
                ),
              )),
            ),
          ),
        )
      ],
    );
  }
}