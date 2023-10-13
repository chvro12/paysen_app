import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../config/app_assets.dart';
import '../../account/account_screen.dart';
import '../../cards/cards_screen.dart';
import '../../home/home_screen.dart';
import '../../support/support_screen.dart';

class DashboardController extends GetxController {
  
  List<Widget> get bottomNavigationBarBody => [
    HomeScreen(
      showTopBottomSheet: onTopupBottomSheetChanged, 
      showWithdrawaBottomSheet: onWithdrawBottomSheetChanged
    ),
    CardsScreen(),
    const SupportScreen(),
    AccountScreen()
  ];
  
  final List<Map<String, String>> bottomNavigationBarItems = [
    {'title': 'wallet'.tr, 'active_icon': AppAssets.walletActiveIcon, 'inactive_icon': AppAssets.walletInactiveIcon},
    {'title': 'cards'.tr, 'active_icon': AppAssets.cardActiveIcon, 'inactive_icon': AppAssets.cardInactiveIcon},
    {'title': 'support'.tr, 'active_icon': AppAssets.supportActiveIcon, 'inactive_icon': AppAssets.supportInactiveIcon},
    {'title': 'account'.tr, 'active_icon': AppAssets.accountActiveIcon, 'inactive_icon': AppAssets.accountInactiveIcon},
  ];

  final showWithdrawaBottomSheet = false.obs;
  final showTopBottomSheet = false.obs;
  final selectedBottomNavigationBarIndex = 0.obs;

  void onBottomNavigationBarItemChanged(int value) {
    selectedBottomNavigationBarIndex.value = value;

    onTopupBottomSheetChanged(false);
    onWithdrawBottomSheetChanged(false);

    update();
  }

  void onWithdrawBottomSheetChanged(bool value) {
    showWithdrawaBottomSheet.value = value;
    update();
  }

  void onTopupBottomSheetChanged(bool value) {
    showTopBottomSheet.value = value;
    update();
  }
}