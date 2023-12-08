import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../components/index.dart';
import '../../../config/app_assets.dart';
import '../../../config/app_colors.dart';
import '../../../config/app_enums.dart';

class TransactionItemView extends StatelessWidget {

  final TransactionType type;
  final num amount;
  final String transactionTimestamp;
  final VoidCallback? onTransactionSelect;
  final bool showPaginationLoader;

  const TransactionItemView({
    super.key,
    required this.amount,
    required this.type,
    this.onTransactionSelect,
    this.transactionTimestamp = '',
    this.showPaginationLoader = false
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [

        GestureDetector(
          onTap: onTransactionSelect,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.brightGray),
              borderRadius: BorderRadius.circular(20.0)
            ),
            padding: EdgeInsets.only(left: 3.0, top: 3.0, bottom: 3.0, right: 0.04.sw),
            margin: EdgeInsets.only(bottom: 0.01.sh),
            height: 0.084.sh,
            width: 1.sw,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
        
                Container(
                  width: 0.16.sw,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0),
                    color: type != TransactionType.debit
                    ? AppColors.water
                    : AppColors.red
                  ),
                  alignment: Alignment.center,
                  child: Image.asset(type == TransactionType.debit  
                  ? AppAssets.transactionWithdrawIcon
                  : AppAssets.transactionTopupIcon),
                ),
        
                SizedBox(width: 0.04.sw,),
        
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
        
                      CustomText(
                        label: type == TransactionType.debit 
                        ? 'Withdrawal'
                        : 'Topup',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500,
                        textColor: AppColors.blackColor,
                        textSize: 20.sp,
                      ),
        
                      SizedBox(height: 0.01.sh,),
        
                      CustomText(
                        label: transactionTimestamp,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500,
                        textColor: AppColors.tertiaryColor,
                        textSize: 12.sp,
                      ),
        
                    ],
                  ),
                ),
        
                CustomText(
                  label: '${amount.round()} CFA',
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w500,
                  textColor: AppColors.blackColor,
                  textSize: 20.sp,
                ),
        
              ],
            ),
          ),
        ),

        if (showPaginationLoader)
          Container(
            height: 100.h,
            alignment: Alignment.center,
            child: const CircularProgressIndicator.adaptive(),
          ),

      ],
    );
  }
}