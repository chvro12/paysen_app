import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../components/index.dart';
import '../../../config/app_assets.dart';
import '../../../config/app_colors.dart';

class TransactionItemView extends StatelessWidget {

  final String type;
  final num amount;
  final VoidCallback? onTransactionSelect;

  const TransactionItemView({
    super.key,
    required this.amount,
    required this.type,
    this.onTransactionSelect
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
                color: type.toLowerCase() != 'withdrawal' 
                ? AppColors.water
                : AppColors.red
              ),
              alignment: Alignment.center,
              child: Image.asset(type.toLowerCase() == 'withdrawal'  
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
                    label: type.toLowerCase() == 'withdrawal' 
                    ? 'Withdrawal'
                    : 'Topup',
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w500,
                    textColor: AppColors.blackColor,
                    textSize: 18.sp,
                  ),
    
                  SizedBox(height: 0.01.sh,),
    
                  CustomText(
                    label: 'AUG 16, 2023',
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w500,
                    textColor: AppColors.tertiaryColor,
                    textSize: 10.sp,
                  ),
    
                ],
              ),
            ),
    
            CustomText(
              label: '$amount CFA',
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w500,
              textColor: AppColors.blackColor,
              textSize: 18.sp,
            ),
    
          ],
        ),
      ),
    );
  }
}