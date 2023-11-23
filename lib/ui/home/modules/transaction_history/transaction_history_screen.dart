import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../components/index.dart';
import '../../../../config/app_assets.dart';
import '../../../../config/app_colors.dart';
import '../../../../config/app_routes.dart';
import '../../../../main.dart';
import '../../../transaction/components/transaction_item_view.dart';
import 'controller/transaction_history_controller.dart';

class TransactionHistoryScreen extends StatelessWidget {

  TransactionHistoryScreen({super.key});

  final TransactionHistoryController transactionHistoryController = Get.put(TransactionHistoryController());

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.whiteColor,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
          const CustomHeader(
            headerLabel: 'transaction_history',
            showBackButton: true,
          ),

          SizedBox(height: 24.h,),

          SizedBox(
            height: 50.h,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: List.generate(transactionHistoryController.transactionHistoryTab.length, (index) {
                final e = transactionHistoryController.transactionHistoryTab[index];
                return Obx(() => Expanded(
                  child: GestureDetector(
                    onTap: () {
                      transactionHistoryController.onTabChanged(index);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        border: Border(bottom: BorderSide(
                          color: index == transactionHistoryController.selectedTab.value 
                          ? AppColors.primaryColor
                          : AppColors.borderColor,
                          width: 2.0
                        ))
                      ),
                      child: CustomText(
                        label: e,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500,
                        textSize: 16.sp,
                        textColor: index == transactionHistoryController.selectedTab.value 
                        ? AppColors.primaryColor
                        : null,
                      ),
                    ),
                  ),
                ));
              }),
            ),
          ),

          SizedBox(height: 24.h,),

          Container(
            height: 30.h,
            margin: EdgeInsets.symmetric(horizontal: 8.w),
            child: CustomListviewBuilder<String>(
              listOfItems: transactionHistoryController.transactionHistoryFilter,
              scrollDirection: Axis.horizontal,
              customListItemBuilder: (context, index, originalValue) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 4.w),
                  child: Obx(() => CustomChoiceChip(
                    label: originalValue, 
                    onValueSelected: (value) => transactionHistoryController.onChangedTransactionHistoryFilter(originalValue),
                    isSelected: transactionHistoryController.selectedTransactionHistoryFilter.value == originalValue,
                    chipBGColor: AppColors.tertiaryColor.withOpacity(0.3),
                    chipSelectedBGColor: AppColors.tertiaryColor,
                    chipElevation: 0.0,
                    chipLabelPadding: EdgeInsets.symmetric(horizontal: 12.w),
                    chipLabelStyle: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: transactionHistoryController.selectedTransactionHistoryFilter.value == originalValue
                      ? AppColors.whiteColor
                      : AppColors.tertiaryColor
                    ),
                  )),
                );
              },
            ),
          ),

          SizedBox(height: 24.h,),

          Obx(() => transactionHistoryController.selectedTransactionHistoryFilter.value == 'Today'
          ? Flexible(
            child: CustomListviewBuilder<Map<String, dynamic>>(
              listOfItems: transactionHistoryController.dummyTransaction,
              scrollDirection: Axis.vertical,
              padding: EdgeInsets.only(left: 8.w, right: 8.w, bottom: 88.h),
              customListItemBuilder: (context, index, value) {
                return TransactionItemView(
                  amount: value['amount'],
                  type: value['type'],
                  onTransactionSelect: () => walletNavigatorKey.currentState?.pushNamed(AppRoutes.transactionDetail),
                );
              },
            ),
          )
          : const SizedBox.shrink()),

          /// WHEN NO DATA FOUND FROM SERVER
          Obx(() => transactionHistoryController.selectedTransactionHistoryFilter.value == 'Yesterday'
          ? Expanded(
            child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
              
                    Container(
                      width: 80.w,
                      decoration: const BoxDecoration(
                        gradient: AppColors.linearGradient2,
                        shape: BoxShape.circle
                      ),
                      child: Image.asset(AppAssets.noTransactionIcon),
                    ),
              
                    SizedBox(height: 50.h,),
              
                    CustomText(
                      label: 'no_transactions_title',
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w500,
                      textColor: AppColors.blackColor,
                      textSize: 20.sp,
                    ),
              
                    SizedBox(height: 20.h,),
              
                    CustomText(
                      label: 'no_transactions_description',
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
          )
          : const SizedBox.shrink()),

          Obx(() => transactionHistoryController.selectedTransactionHistoryFilter.value == 'Custom'
          ? Flexible(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 12.w),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 50.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(color: AppColors.borderColor),
                      shape: BoxShape.rectangle,
                      color: AppColors.cultured
                    ),
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(horizontal: 12.w),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        Flexible(
                          flex: 2,
                          child: GestureDetector(
                            onTap: () => transactionHistoryController.onFromDateSelect(context),
                            child: CustomText(
                              label: transactionHistoryController.fromDate.value,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w500,
                              textColor: AppColors.blackColor,
                              textSize: 16.sp,
                            ),
                          )
                        ),

                        Flexible(
                          child: CustomText(
                            label: '-',
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w500,
                            textColor: AppColors.blackColor,
                            textSize: 16.sp,
                          )
                        ),

                        Flexible(
                          flex: 2,
                          child: GestureDetector(
                            onTap: () => transactionHistoryController.onToDateSelect(context),
                            child: CustomText(
                              label: transactionHistoryController.toDate.value,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w500,
                              textColor: AppColors.blackColor,
                              textSize: 16.sp,
                            ),
                          )
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
          : const SizedBox.shrink())

        ],
      ),
    );
  }
}