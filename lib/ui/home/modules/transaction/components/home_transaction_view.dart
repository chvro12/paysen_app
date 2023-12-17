import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../components/index.dart';
import '../../../../../config/app_assets.dart';
import '../../../../../config/app_colors.dart';
import '../../../../../config/app_enums.dart';
import '../../../../../config/app_routes.dart';
import '../../../../../main.dart';
import '../../../../transaction/components/transaction_item_view.dart';
import '../../../models/transaction_models.dart';
import '../controller/transaction_history_controller.dart';

class HomeTransactionView extends StatelessWidget {

  final MainTransactionModel mainTransactionModel;
  final ValueChanged<TransactionModel> onTransactionSelect;

  const HomeTransactionView({
    super.key,
    required this.mainTransactionModel,
    required this.onTransactionSelect
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        
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
  
            GestureDetector(
              onTap: () {
                Get.delete<TransactionHistoryController>();
                walletNavigatorKey.currentState?.pushNamed(AppRoutes.transactionHistory);
              },
              child: Row(
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
              ),
            )
  
          ],
        ),
  
        SizedBox(height: 12.h,),
  
        SizedBox(
          height: 30.h,
          child: CustomChoiceChip(
            label: TransactionFilter.thisMonth.serverKeyFromFilter.tr.toUpperCase(), 
            isSelected: true,
            chipBGColor: AppColors.mediumPurple,
            chipSelectedBGColor: AppColors.mediumPurple,
            chipLabelStyle: TextStyle(
              color: AppColors.whiteColor,
              fontSize: 12.sp,
              fontWeight: FontWeight.w500
            ),
            chipElevation: 0.0,
            chipLabelPadding: EdgeInsets.zero,
            chipPadding: const EdgeInsets.only(left: 8, right: 8, top: 4),
            onValueSelected: (value) {},
          ),
        ),
  
        SizedBox(height: 12.h,),

        CustomListviewBuilder<TransactionModel>(
          listOfItems: mainTransactionModel.userTransactionList,
          scrollPhysics: const NeverScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          customListItemBuilder: (context, index, value) {
            return TransactionItemView(
              amount: value.amount,
              type: value.cardTransactionType,
              transactionTimestamp: value.transactionTimestamp.humanReadableFormat('MMM dd, yyyy'),
              onTransactionSelect: () => onTransactionSelect(value),
            );
          },
        )
      ],
    );
  }
}