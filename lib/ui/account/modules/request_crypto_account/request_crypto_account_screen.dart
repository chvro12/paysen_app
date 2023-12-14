import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../components/index.dart';
import '../../../../config/app_colors.dart';
import '../../controller/account_controller.dart';
import 'components/req_crypto_agree_checkbox_view.dart';
import 'components/req_crypto_content_view.dart';
import 'components/req_crypto_indicator_view.dart';
import 'components/req_crypto_page_view.dart';

class RequestCryptoAccountScreen extends StatelessWidget {

  const RequestCryptoAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AccountController accountController = Get.find();
    return Container(
      color: AppColors.whiteColor,      
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
      
          const CustomHeader(
            showBackButton: true,
            headerLabel: 'request_crypto_account',
          ),
      
          Flexible(
            child: Stack(
              children: [
                
                Positioned(
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 380.h,
                    color: AppColors.cultured,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        
                        Flexible(
                          child: SizedBox(
                            height: 280.h,
                            child: PageView.builder(
                              itemCount: accountController.reqCryptoPageItems.length,
                              controller: accountController.pageController,
                              allowImplicitScrolling: true,
                              padEnds: true,
                              pageSnapping: true,
                              scrollDirection: Axis.horizontal,
                              onPageChanged: accountController.onReqCryptoPageChanged,
                              itemBuilder: (context, index) {
                                final item = accountController.reqCryptoPageItems[index];
                                return ReqCryptoPageView(
                                  isSelected: accountController.selectedReqCryptoItem.value == index,
                                  item: item,
                                );
                              }
                            ),
                          ),
                        ),

                        Obx(() => ReqCryptoIndicatorView(
                          selectedIndex: accountController.selectedReqCryptoItem.value,
                          reqCryptoPageItems: accountController.reqCryptoPageItems,
                        )),

                      ],
                    ),
                  ),
                ),

                Container(
                  margin: EdgeInsets.only(top: 306.h),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(40)
                    ),
                    color: AppColors.whiteColor,
                    shape: BoxShape.rectangle,
                  ),
                  width: Get.width,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    padding: EdgeInsets.only(left: 24.w, right: 24.w, top: 18.h, bottom: 18.h),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [

                        Obx(() => ReqCryptoContentView(
                          reqCryptoDescriptionItems: accountController.reqCryptoDescriptionItems,
                          selectedReqCryptoItem: accountController.selectedReqCryptoItem.value,
                        )),

                        Obx(() => accountController.selectedReqCryptoItem.value != 2
                        ? const SizedBox.shrink()
                        : Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [

                            SizedBox(height: 24.h,),

                            ReqCryptoAgreeCheckBoxView(
                              isSelected: accountController.agreedTermsAndCondition.value,
                              description: 'agree_terms_and_conditions',
                              onPressed: () => accountController.onChangeTermsAndCondition(),
                            ),

                            SizedBox(height: 18.h,),

                            ReqCryptoAgreeCheckBoxView(
                              isSelected: accountController.agreedPrivacyPolicy.value,
                              description: 'agree_privacy_policy',
                              onPressed: () => accountController.onChangePrivacyPolicy(),
                            ),

                            SizedBox(height: 24.h,),

                            SizedBox(
                              height: 0.07.sh,
                              width: 1.sw,
                              child: CustomElevatedButton(
                                btnLabel: 'send_request',
                                onBtnPressed: () => accountController.onSendRequestCryptoAccount(context),
                              ),
                            ),
                          ],
                        )),

                        SizedBox(height: 92.h,),
                      ],
                    ),
                  ),
                ),
      
              ],
            ),
          )
      
        ],
      ),
    );
  }
}