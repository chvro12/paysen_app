import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:paysen/config/app_enums.dart';

import '../../components/index.dart';
import '../../config/app_assets.dart';
import '../../config/app_colors.dart';
import '../cards/components/credit_card_view.dart';
import '../dashboard/controller/dashboard_controller.dart';
import 'components/withdraw_topup_view.dart';
import 'controller/home_controller.dart';
import 'modules/transaction/components/home_transaction_view.dart';

class HomeScreen extends StatelessWidget {

  final ValueChanged<bool> showWithdrawaBottomSheet;
  final ValueChanged<bool> showTopBottomSheet;

  HomeScreen({
    super.key,
    required this.showTopBottomSheet,
    required this.showWithdrawaBottomSheet
  });

  final DashboardController dashboardController = Get.find();

  @override
  Widget build(BuildContext context) {
    final homeController = Get.put(HomeController());
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
              child: Obx(() {
                String? profileAvatar;
                String username = '';
                if (dashboardController.profileModels.value != null) {
                  username = '${dashboardController.profileModels.value!.userModels.firstName} ${dashboardController.profileModels.value!.userModels.lastName}';
                  profileAvatar = dashboardController.profileModels.value!.userModels.avatar;
                }
                return CustomHeader(
                  showBackButton: false,
                  headerLabel: username,
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
                      child: profileAvatar == null 
                      ? Image.asset(AppAssets.fabPaysenLogo)
                      : CachedNetworkImage(
                        imageUrl: profileAvatar,
                        errorWidget: (BuildContext context, String url, Object error) {
                          return Image.asset(AppAssets.fabPaysenLogo);
                        },
                      ),
                    ),
                  ),
                  actionButton: [
                    CircularIconButton(
                      assetIMG: AppAssets.notificationIcon,
                      onCircularBtnPressed: () {},
                    ),
                  ],
                );
              }),
            ),
      
            SizedBox(height: 12.h,),
      
            Obx(() {
              String? cardNo, cardHolderName, validThru;
              if (dashboardController.profileModels.value?.userModels.cardDetail != null) {
                final dateTime = DateTime(int.parse(dashboardController.profileModels.value!.userModels.cardDetail!.expYear));
                cardNo = dashboardController.profileModels.value!.userModels.cardDetail!.cardNumber;
                cardHolderName = '${dashboardController.profileModels.value!.userModels.firstName} ${dashboardController.profileModels.value!.userModels.lastName}';
                validThru = '${dashboardController.profileModels.value!.userModels.cardDetail!.expMonth}/${dateTime.humanReadableFormat('yy')}';
              }
              return CreditCardView(
                cardNo: cardNo ?? '',
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
                
                      Flexible(
                        child: Obx(() => homeController.mainTransactionModel.value == null
                        ? const SizedBox.shrink()
                        : HomeTransactionView(mainTransactionModel: homeController.mainTransactionModel.value!)),
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