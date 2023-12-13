import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';

import '../../../../components/index.dart';
import '../../../../config/app_assets.dart';
import '../../../../config/app_colors.dart';
import '../../controller/account_controller.dart';

class TermsAndConditionScreen extends StatelessWidget {
  
  const TermsAndConditionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AccountController accountController = Get.find();
    return Container(
      height: Get.height,
      color: AppColors.whiteColor,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
      
          const CustomHeader(
            headerLabel: 'terms_and_conditions',
            showBackButton: true,
          ),
      
          Flexible(
            child: CustomScrollView(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              slivers: [
      
                SliverToBoxAdapter(
                  child: Image.asset(AppAssets.termsAndConditionIMG),
                ),
            
                SliverToBoxAdapter(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
                    child: Obx(() => accountController.termsAndConditionModel.value == null
                    ? const SizedBox.shrink()
                    : HtmlWidget(accountController.termsAndConditionModel.value!.termsAndConditions)),
                  ),
                ),

                SliverToBoxAdapter(
                  child: SizedBox(height: 108.h,),
                )

              ],
            ),
          )
          
        ],
      ),
    );
  }
}