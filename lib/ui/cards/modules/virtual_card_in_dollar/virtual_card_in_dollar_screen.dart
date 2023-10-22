import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../components/index.dart';
import '../../../../config/app_colors.dart';
import '../../components/virtual_card_view.dart';
import 'controller/virtual_card_in_dollar_controller.dart';

class VirtualCardInDollarScreen extends StatelessWidget {

  VirtualCardInDollarScreen({super.key});

  final virtualCardInDollarController = Get.put(VirtualCardInDollarController());

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.whiteColor,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
    
          const CustomHeader(
            headerLabel: 'virtual_card_in_dollars',
            showBackButton: true,
          ),
    
          const VirtualCardView(),
    
          SizedBox(height: 24.h,),
    
          const MoneyOverview(
            containerBGColor: AppColors.whiteColor,
            moneyOverviewItems: [
    
              MoneyOverviewItemView(
                label: 'validity',
                value: '4 Years',
              ),
    
              MoneyOverviewItemView(
                label: 'price',
                value: 'Free',
              ),
    
              MoneyOverviewItemView(
                label: 'transaction_fee',
                value: '0 Fee',
              ),
    
              MoneyOverviewItemView(
                label: 'transaction_limit',
                value: 'Unlimited',
                showBorder: false,
              ),
    
            ],
          ),
    
          SizedBox(height: 24.h,),
    
          Container(
            height: 0.07.sh,
            margin: EdgeInsets.symmetric(horizontal: 12.w),
            width: double.infinity,
            child: CustomElevatedButton(
              btnLabel: 'generate_card',
              onBtnPressed: () => virtualCardInDollarController.onGenerateVirtualCard(context),
            ),
          )
    
        ],
      ),
    );
  }
}