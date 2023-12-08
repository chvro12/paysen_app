import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../components/index.dart';
import '../../../../config/app_colors.dart';
import '../../../../config/app_enums.dart';
import '../../../transaction/components/transaction_item_view.dart';
import '../../models/transaction_models.dart';
import 'components/no_transaction_view.dart';
import 'components/transaction_between_date_view.dart';
import 'controller/transaction_history_controller.dart';

class TransactionHistoryScreen extends StatelessWidget {

  const TransactionHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TransactionHistoryController transactionHistoryController = Get.put(TransactionHistoryController());
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

          SizedBox(height: 12.h,),

          SizedBox(
            height: 40.h,
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
            child: CustomListviewBuilder<TransactionFilter>(
              listOfItems: transactionHistoryController.transactionHistoryFilter,
              scrollDirection: Axis.horizontal,
              customListItemBuilder: (context, index, originalValue) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 4.w),
                  child: Obx(() => CustomChoiceChip(
                    label: originalValue.readableFromFilter, 
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

          Obx(() => transactionHistoryController.selectedTransactionHistoryFilter.value == TransactionFilter.custom
          ? Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 12.w),
                child: TransactionBetweenDateView(
                  fromDate: transactionHistoryController.fromDate.value,
                  onFromDate: () => transactionHistoryController.onFromDateSelect(context),
                  onToDate: () => transactionHistoryController.onToDateSelect(context),
                  toDate: transactionHistoryController.toDate.value,
                ),
              ),

              SizedBox(height: 24.h,),
            ],
          )
          : const SizedBox.shrink()),

          Obx(() => transactionHistoryController.mainTransactionModel.value == null
          ? const SizedBox.shrink()
          : transactionHistoryController.mainTransactionModel.value!.userTransactionList.isEmpty
          ? const Expanded(child: NoTransactionView())
          : Expanded(
            child: CustomListviewBuilder<TransactionModel>(
              listOfItems: transactionHistoryController.mainTransactionModel.value!.userTransactionList,
              scrollDirection: Axis.vertical,
              padding: EdgeInsets.only(left: 8.w, right: 8.w, bottom: 88.h),
              scrollController: transactionHistoryController.scrollController,
              customListItemBuilder: (context, index, value) {
                return TransactionItemView(
                  amount: value.amount,
                  type: value.cardTransactionType,
                  transactionTimestamp: value.transactionTimestamp.humanReadableFormat('MMM dd, yyyy'),
                  onTransactionSelect: () => transactionHistoryController.onTransactionSelect(value, context),
                  showPaginationLoader: transactionHistoryController.showPaginationLoader
                  ? transactionHistoryController.mainTransactionModel.value!.userTransactionList.length - 1 == index
                  : false,
                );
              }
            ),
          )),
        ],
      ),
    );
  }
}