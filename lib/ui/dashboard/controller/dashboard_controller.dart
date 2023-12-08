import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../config/app_assets.dart';
import '../../../config/app_utils.dart';
import '../../../main.dart';
import '../../../nested_navigator.dart';
import '../../account/models/profile_models.dart';
import '../../account/repository/account_repo.dart';

class DashboardController extends GetxController with ProgressHUDMixin {

  DashboardController([int? initialIndex]) {
    if (initialIndex != null) {
      selectedBottomNavigationBarIndex.value = initialIndex;
      disableWallet = true;
    }
  }

  List<Widget> get bottomNavigationBarBody => [
    WalletNestedNavigator(
      showTopBottomSheet: onTopupBottomSheetChanged,
      showWithdrawaBottomSheet: onWithdrawBottomSheetChanged
    ),
    CardNestedNavigator(
      showOrderCardBottomSheet: onOrderCardBottomSheetChanged,
    ),
    const SupportNestedNavigator(),
    const AccountNestedNavigator()
  ];

  final List<GlobalKey<NavigatorState>> _navigatorKeys = [
    walletNavigatorKey,
    cardsNavigatorKey,
    supportNavigatorKey,
    accountNavigatorKey
  ];
  
  final List<Map<String, String>> bottomNavigationBarItems = [
    {'title': 'wallet'.tr, 'active_icon': AppAssets.walletActiveIcon, 'inactive_icon': AppAssets.walletInactiveIcon},
    {'title': 'cards'.tr, 'active_icon': AppAssets.cardActiveIcon, 'inactive_icon': AppAssets.cardInactiveIcon},
    {'title': 'support'.tr, 'active_icon': AppAssets.supportActiveIcon, 'inactive_icon': AppAssets.supportInactiveIcon},
    {'title': 'account'.tr, 'active_icon': AppAssets.accountActiveIcon, 'inactive_icon': AppAssets.accountInactiveIcon},
  ];

  Rxn<ProfileModels> profileModels = Rxn();

  final showWithdrawaBottomSheet = false.obs,
         showTopBottomSheet = false.obs, 
         showOrderCardBottomSheet = false.obs;
  bool disableWallet = false;       
  final selectedBottomNavigationBarIndex = 0.obs;

  void onBottomNavigationBarItemChanged(int value) {
    selectedBottomNavigationBarIndex.value = value;

    onTopupBottomSheetChanged(false);
    onWithdrawBottomSheetChanged(false);
    onOrderCardBottomSheetChanged(false);

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

  void onOrderCardBottomSheetChanged(bool value) {
    showOrderCardBottomSheet.value = value;
    update();
  }

  Future<bool> onSystemBackButtonPressed() {
    if (_navigatorKeys[selectedBottomNavigationBarIndex.value].currentState?.canPop() == true) {
      _navigatorKeys[selectedBottomNavigationBarIndex.value].currentState?.pop(_navigatorKeys[selectedBottomNavigationBarIndex.value].currentContext);
    } else {
      SystemChannels.platform.invokeMethod<void>('SystemNavigator.pop');
    }
    return Future.value(false);
  }

  Future<void> fetchUserProfileDetails() async {
    show(Get.context!);

    final AccountRepo accountRepo = AccountRepo();
    profileModels.value = await accountRepo.getProfile();
    if (profileModels.value != null && profileModels.value!.userModels.cardDetail == null) {
      onBottomNavigationBarItemChanged(1);
    }

    dismiss(Get.context!);
  }

  @override
  void onInit() {
    fetchUserProfileDetails();
    super.onInit();
  }
}