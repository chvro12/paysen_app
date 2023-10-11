import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../components/index.dart';
import '../../../config/app_assets.dart';
import '../../../config/app_colors.dart';

class TransactionItemView extends StatelessWidget {

  const TransactionItemView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.brightGray),
        borderRadius: BorderRadius.circular(20.0)
      ),
      padding: EdgeInsets.only(left: 3.0, top: 3.0, bottom: 3.0, right: 0.04.sw),
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
              /// CONTAINER BG COLOR FOR WITHDRAWAL
              color: AppColors.red
              
              /// CONTAINER BG COLOR FOR TOPUP
              // color: AppColors.water
            ),
            alignment: Alignment.center,
            /// CONTAINER CHILD FOR WITHDRAWAL
            child: Image.asset(AppAssets.transactionWithdrawIcon),

            /// CONTAINER CHILD FOR TOPUP
            // child: Image.asset(AppAssets.transactionTopupIcon),
          ),

          SizedBox(width: 0.04.sw,),

          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                CustomText(
                  /// LABEL FOR WITHDRAWAL
                  label: 'Withdrawal',

                  /// LABEL FOR TOPUP
                  // label: 'Topup',
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
            label: '-5100 CFA',
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w500,
            textColor: AppColors.blackColor,
            textSize: 18.sp,
          ),

        ],
      ),
    );
  }
}