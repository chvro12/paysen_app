import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../components/index.dart';
import '../../../../config/app_assets.dart';
import '../../../../config/app_colors.dart';
import 'controller/transaction_detail_controller.dart';

class TransactionDetailScreen extends StatelessWidget {

  TransactionDetailScreen({super.key});

  final TransactionDetailController transactionDetailController = Get.put(TransactionDetailController());

  @override
  Widget build(BuildContext context) {
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
          child: Container(
            decoration: const BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.vertical(top: Radius.circular(40.0))
            ),
            height: Get.height,
            width: Get.width,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              padding: EdgeInsets.only(left: 18.w, right: 18.w, top: 24.h, bottom: 104.h),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  CustomText(
                    label: 'withdrawal',
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
                          label: 'ID : 64da09741add1f00a285ae22',
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w300,
                          textColor: AppColors.quartz,
                          textSize: 14.sp,
                          textAlignment: TextAlign.center,
                        ),

                        SizedBox(height: 4.h,),

                        CustomText(
                          label: 'at 14/08/2023 11:00',
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
                        showBorder: false,
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
                        child: const Divider(height: 4.0, thickness: 1.0,),
                      ),
            
                      const MoneyOverviewItemView(
                        label: 'recipient',
                        labelTextStyle: TextStyle(color: AppColors.gray),
                        value: '+221781949324',
                        showBorder: false,
                      ),

                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 18.w),
                        child: const Divider(height: 4.0, thickness: 1.0,),
                      ),
            
                      const MoneyOverviewItemView(
                        label: 'operator_id',
                        labelTextStyle: TextStyle(color: AppColors.gray),
                        value: 'EA230814.110034.N265394',
                        showBorder: false,
                      ),

                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 18.w),
                        child: const Divider(height: 4.0, thickness: 1.0,),
                      ),
            
                      const MoneyOverviewItemView(
                        label: 'converted_amount',
                        labelTextStyle: TextStyle(color: AppColors.gray),
                        value: '0 CFA',
                        showBorder: false,
                      ),

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
                                  label: '-5100 CFA',
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
                                  width: 90.w,
                                  child: CustomElevatedButton(
                                    btnLabel: 'share',
                                    btnBGColor: AppColors.primaryColor,
                                    btnBorderRadius: 60.0,
                                    btnElevation: 0.0,
                                    btnFGColor: AppColors.whiteColor,
                                    onBtnPressed: () {},
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
            ),
          ),
        )
      ],
    );
  }
}