import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/index.dart';
import '../../config/app_assets.dart';
import 'controller/dashboard_controller.dart';

class DashboardScreen extends StatelessWidget {

  DashboardScreen({super.key});

  final dashboardController = Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      
            Obx(() => dashboardController.bottomNavigationBarBody[dashboardController.selectedBottomNavigationBarIndex.value]),
      
            Positioned(
              bottom: 0.0,
              child: Obx(() => !dashboardController.showWithdrawaBottomSheet.value
              ? const SizedBox.shrink()
              : TwoOptionsBottomSheet(
                header: 'withdrawal_methods',
                assetIMG1: AppAssets.mobileMoneyWithdrawalIcon,
                label1: 'mobile_money_withdrawal',
                onPressed1: () {},
                assetIMG2: AppAssets.distributorWithdrawalIcon,
                label2: 'distributor_withdrawal',
                onPressed2: () {},
              )),
            )
      
          ],
        ),
      ),
    );
  }
}