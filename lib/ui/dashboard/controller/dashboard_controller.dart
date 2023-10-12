import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../config/app_assets.dart';
import '../../cards/cards_screen.dart';
import '../../home/home_screen.dart';

class DashboardController extends GetxController {
  
  final List<Widget> bottomNavigationBarBody = [
    const HomeScreen(),
    CardsScreen(),
    Container(),
    Container()
  ];
  
  final List<Map<String, String>> bottomNavigationBarItems = [
    {'title': 'wallet'.tr, 'active_icon': AppAssets.walletActiveIcon, 'inactive_icon': AppAssets.walletInactiveIcon},
    {'title': 'cards'.tr, 'active_icon': AppAssets.cardActiveIcon, 'inactive_icon': AppAssets.cardInactiveIcon},
    {'title': 'support'.tr, 'active_icon': AppAssets.supportActiveIcon, 'inactive_icon': AppAssets.supportInactiveIcon},
    {'title': 'account'.tr, 'active_icon': AppAssets.accountActiveIcon, 'inactive_icon': AppAssets.accountInactiveIcon},
  ];

  final selectedBottomNavigationBarIndex = 0.obs;

  void onBottomNavigationBarItemChanged(int value) {
    selectedBottomNavigationBarIndex.value = value;
    update();
  }
}