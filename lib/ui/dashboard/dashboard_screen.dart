import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/index.dart';
import '../../config/app_assets.dart';
import '../../config/app_routes.dart';
import '../../config/app_utils.dart';
import '../../main.dart';
import 'controller/dashboard_controller.dart';

class DashboardScreen extends StatelessWidget {

  DashboardScreen({super.key});

  final dashboardController = Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: dashboardController.onSystemBackButtonPressed,
      child: Scaffold(
        bottomNavigationBar: Obx(() => CustomBottomNavigationBar(
          bottomNavigationBarItems: dashboardController.bottomNavigationBarItems,
          onBottomNavigationBarItemChanged: dashboardController.onBottomNavigationBarItemChanged,
          selectedBottomNavigationBarItem: dashboardController.selectedBottomNavigationBarIndex.value,
        )),
        extendBody: true,
        body: SizedBox(
          height: Get.height,
          child: Stack(
            children: [
    
              Obx(() => IndexedStack(
                index: dashboardController.selectedBottomNavigationBarIndex.value,
                children: dashboardController.bottomNavigationBarBody,
              )),
        
              Positioned(
                bottom: 0.0,
                child: Obx(() => !dashboardController.showWithdrawaBottomSheet.value
                ? const SizedBox.shrink()
                : TwoOptionsBottomSheet(
                  header: 'withdrawal_methods',
                  assetIMG1: AppAssets.mobileMoneyWithdrawalIcon,
                  label1: 'mobile_money_withdrawal',
                  onPressed1: () {
                    walletNavigatorKey.currentState?.pushNamed(AppRoutes.moneyWithdraw);
                  },
                  assetIMG2: AppAssets.distributorWithdrawalIcon,
                  label2: 'distributor_withdrawal',
                  onPressed2: () {
                    walletNavigatorKey.currentState?.pushNamed(AppRoutes.distributorWithdrawal);
                  },
                )),
              ),

              Positioned(
                bottom: 0.0,
                child: Obx(() => !dashboardController.showOrderCardBottomSheet.value
                ? const SizedBox.shrink()
                : TwoOptionsBottomSheetWithoutIMG(
                  header: 'delivery_options',
                  subHeader: 'delivery_options_description',
                  label1: 'self_pick_up',
                  onPressed1: () {
                    ToastUtils.showToast('service_not_available');
                  },
                  label2: 'get_delivered',
                  onPressed2: () {
                    cardsNavigatorKey.currentState?.pushNamed(AppRoutes.getDelivered);
                  },
                )),
              ),
    
              Positioned(
                bottom: 0.0,
                child: Obx(() => !dashboardController.showTopBottomSheet.value
                ? const SizedBox.shrink()
                : TwoOptionsBottomSheet(
                  header: 'payment_methods',
                  assetIMG1: AppAssets.mobileMoneyOrBankCardIcon,
                  label1: 'mobile_money_bank_card',
                  onPressed1: () {
                    walletNavigatorKey.currentState?.pushNamed(AppRoutes.mobileMoneyBankCard);
                  },
                  assetIMG2: AppAssets.couponsIcon,
                  label2: 'coupons',
                  onPressed2: () {
                    ToastUtils.showToast('service_not_available');
                  },
                )),
              )
        
            ],
          ),
        ),
      ),
    );
  }
}