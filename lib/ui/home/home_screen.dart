import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:paysen/config/app_enums.dart';

import '../../components/index.dart';
import '../../config/app_assets.dart';
import '../../config/app_colors.dart';
import '../../config/app_routes.dart';
import '../../main.dart';
import '../cards/components/credit_card_view.dart';
import '../transaction/components/transaction_item_view.dart';
import 'components/withdraw_topup_view.dart';
import 'controller/home_controller.dart';

class HomeScreen extends StatelessWidget {

  final ValueChanged<bool> showWithdrawaBottomSheet;
  final ValueChanged<bool> showTopBottomSheet;

  HomeScreen({
    super.key,
    required this.showTopBottomSheet,
    required this.showWithdrawaBottomSheet
  });

  final homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
        FocusScope.of(context).unfocus();
        showTopBottomSheet(false);
        showWithdrawaBottomSheet(false);
      },
      child: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
      
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 0.04.sw),
              child: CustomHeader(
                showBackButton: false,
                headerLabel: 'Samba Thiam',
                headerFontSize: 20.sp,
                childBeforeTitle: CircleAvatar(
                  radius: 24.0,
                  backgroundColor: AppColors.transparent,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.whiteColor),
                      shape: BoxShape.circle,
                      color: AppColors.quaternaryColor
                    ),
                    height: double.infinity,
                    width: double.infinity,
                    child: Image.asset(AppAssets.fabPaysenLogo),
                  ),
                ),
                actionButton: [
                  CircularIconButton(
                    assetIMG: AppAssets.notificationIcon,
                    onCircularBtnPressed: () {},
                  ),
                ],
              ),
            ),
      
            SizedBox(height: 12.h,),
      
            Obx(() {
              String? last4CardNo, cardHolderName, validThru;
              if (homeController.profileDetails.value?.userModels.cardDetail != null) {
                final dateTime = DateTime(int.parse(homeController.profileDetails.value!.userModels.cardDetail!.expYear));
                last4CardNo = homeController.profileDetails.value!.userModels.cardDetail!.cardNumber;
                cardHolderName = '${homeController.profileDetails.value!.userModels.firstName} ${homeController.profileDetails.value!.userModels.lastName}';
                validThru = '${homeController.profileDetails.value!.userModels.cardDetail!.expMonth}/${dateTime.humanReadableFormat('yy')}';
              }
              return CreditCardView(
                last4CardNo: last4CardNo ?? '',
                cardHolderName: cardHolderName ?? '',
                validThru: validThru ?? '',
              );
            },),
      
            SizedBox(height: 12.h,),
      
            Flexible(
              child: Container(
                decoration: const BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(40.0))
                ),
                height: Get.height,
                padding: EdgeInsets.symmetric(horizontal: 0.04.sw, vertical: 0.02.sh),
                child: SingleChildScrollView(
                  padding: EdgeInsets.only(bottom: 0.12.sh),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                
                          Expanded(
                            child: WithdrawTopupView(
                              assetIMG: AppAssets.homeScreenWithdrawalIcon,
                              label: 'withdrawal',
                              onPressed: () {
                                showWithdrawaBottomSheet(true);
                              },
                            ),
                          ),
                
                          SizedBox(width: 0.04.sw,),
                
                          Expanded(
                            child: WithdrawTopupView(
                              assetIMG: AppAssets.homeScreenTopupIcon,
                              label: 'topup',
                              onPressed: () {
                                showTopBottomSheet(true);
                              },
                            ),
                          ),
                
                        ],
                      ),
                
                      SizedBox(height: 12.h,),
                
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
                            onTap: () => walletNavigatorKey.currentState?.pushNamed(AppRoutes.transactionHistory),
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
                
                      CustomChoiceChip(
                        label: 'this_month', 
                        isSelected: true,
                        chipBGColor: AppColors.mediumPurple,
                        chipSelectedBGColor: AppColors.mediumPurple,
                        chipLabelStyle: TextStyle(
                          color: AppColors.whiteColor,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500
                        ),
                        chipPadding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 8.0),
                        onValueSelected: (value) {},
                      ),
                
                      SizedBox(height: 12.h,),

                      CustomListviewBuilder<Map<String, dynamic>>(
                        listOfItems: homeController.dummyTransaction,
                        scrollPhysics: const NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        customListItemBuilder: (context, index, value) {
                          return TransactionItemView(
                            amount: value['amount'],
                            type: value['type'],
                          );
                        },
                      )
                      
                    ],
                  ),
                ),
              ),
            )
      
          ],
        ),
      ),
    );
  }
}