import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'config/app_routes.dart';
import 'main.dart';
import 'ui/account/account_screen.dart';
import 'ui/account/modules/change_language/change_language_screen.dart';
import 'ui/account/modules/change_passcode/change_passcode_screen.dart';
import 'ui/account/modules/change_plan/change_plan_screen.dart';
import 'ui/account/modules/invite_friends/invite_friends_screen.dart';
import 'ui/account/modules/merchant_details/merchant_detail_screen.dart';
import 'ui/account/modules/merchant_details/modules/id_key/id_key_screen.dart';
import 'ui/account/modules/merchant_details/modules/urls/url_screen.dart';
import 'ui/account/modules/profile_details/profile_detail_screen.dart';
import 'ui/account/modules/verification_status/verification_status_screen.dart';
import 'ui/cards/cards_screen.dart';
import 'ui/home/modules/checkout/checkout_screen.dart';
import 'ui/cards/modules/get_delivered/get_delivered_screen.dart';
import 'ui/cards/modules/physical_card/physical_card_screen.dart';
import 'ui/cards/modules/virtual_card_in_dollar/virtual_card_in_dollar_screen.dart';
import 'ui/home/home_screen.dart';
import 'ui/home/modules/distributor_withdrawal/distributor_withdrawal_screen.dart';
import 'ui/home/modules/mobile_money_bank_card/controller/mobile_money_bank_card_controller.dart';
import 'ui/home/modules/mobile_money_bank_card/mobile_money_bank_card_screen.dart';
import 'ui/home/modules/mobile_money_with_withdrawal/controller/mobile_money_with_withdrawal_controller.dart';
import 'ui/home/modules/mobile_money_with_withdrawal/mobile_money_with_withdrawal_screen.dart';
import 'ui/home/modules/transaction/controller/transaction_detail_controller.dart';
import 'ui/home/modules/transaction/controller/transaction_history_controller.dart';
import 'ui/home/modules/transaction/transaction_detail_screen.dart';
import 'ui/home/modules/transaction/transaction_history_screen.dart';
import 'ui/support/support_screen.dart';

class WalletNestedNavigator extends StatelessWidget {

  final ValueChanged<bool> showWithdrawaBottomSheet;
  final ValueChanged<bool> showTopBottomSheet;

  const WalletNestedNavigator({
    super.key,
    required this.showTopBottomSheet,
    required this.showWithdrawaBottomSheet,
  });

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: walletNavigatorKey,
      initialRoute: AppRoutes.initialRoute,
      onGenerateRoute: (settings) {
        Widget route;
        Object? args = settings.arguments;
        if (settings.name == AppRoutes.initialRoute) {
          
          route = HomeScreen(
            showTopBottomSheet: showTopBottomSheet, 
            showWithdrawaBottomSheet: showWithdrawaBottomSheet,
          );

        } else if (settings.name == AppRoutes.moneyWithdraw) {
          Get.delete<MobileMoneyWithWithdrawalController>();
          route = const MobileMoneyWithWithdrawalScreen();
        } else if (settings.name == AppRoutes.distributorWithdrawal) {
          route = const DistributorWithdrawalScreen();
        } else if (settings.name == AppRoutes.mobileMoneyBankCard) {
          Get.delete<MobileMoneyBankCardController>();
          route = const MobileMoneyBankCardScreen();
        } else if (settings.name == AppRoutes.transactionHistory) {
          Get.delete<TransactionHistoryController>();
          route = const TransactionHistoryScreen();
        } else if (settings.name == AppRoutes.transactionDetail) {
          Get.delete<TransactionDetailController>();
          route = TransactionDetailScreen(clientTransactionReference: args as String,);
        } else {
          throw Exception('Unknown route defined.');
        }
        return MaterialPageRoute(builder: (_) => route, settings: settings);
      },
    );
  }
}

class CardNestedNavigator extends StatelessWidget {

  final ValueChanged<bool> showOrderCardBottomSheet;

  const CardNestedNavigator({super.key, required this.showOrderCardBottomSheet});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: cardsNavigatorKey,
      initialRoute: AppRoutes.initialRoute,
      onGenerateRoute: (settings) {
        Widget route;
        Object? args = settings.arguments;
        if (settings.name == AppRoutes.initialRoute) {
          route = CardsScreen();
        } else if (settings.name == AppRoutes.virtualCardInDollar) {
          route = VirtualCardInDollarScreen();
        } else if (settings.name == AppRoutes.physicalCard) {
          route = PhysicalCardScreen(
            showOrderCardBottomSheet: showOrderCardBottomSheet,
          );
        } else if (settings.name == AppRoutes.getDelivered) {
          route = GetDeliveredScreen();
        } else if (settings.name == AppRoutes.checkout) {
          route = CheckoutScreen(amount: args as double);
        } else {
          throw Exception('Unknown route defined.');
        }
        return MaterialPageRoute(builder: (_) => route, settings: settings);
      },
    );
  }
}

class SupportNestedNavigator extends StatelessWidget {

  const SupportNestedNavigator({super.key});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: supportNavigatorKey,
      initialRoute: AppRoutes.initialRoute,
      onGenerateRoute: (settings) {
        Widget route;
        if (settings.name == AppRoutes.initialRoute) {
          route = const SupportScreen();
        } else {
          throw Exception('Unknown route defined.');
        }
        return MaterialPageRoute(builder: (_) => route, settings: settings);
      },
    );
  }
}

class AccountNestedNavigator extends StatelessWidget {
  const AccountNestedNavigator({super.key});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: accountNavigatorKey,
      initialRoute: AppRoutes.initialRoute, 
      onGenerateRoute: (settings) {
        Widget route;
        if (settings.name == AppRoutes.initialRoute) {
          route = const AccountScreen();
        } else if (settings.name == AppRoutes.profileDetails) {
          route = const ProfileDetailScreen();
        } else if (settings.name == AppRoutes.changePlan) {
          route = const ChangePlanScreen();
        } else if (settings.name == AppRoutes.changeLanguage) {
          route = const ChangeLanguageScreen();
        } else if (settings.name == AppRoutes.changePasscode) {
          route = const ChangePasscode();
        } else if (settings.name == AppRoutes.inviteFriends) {
          route = const InviteFriendScreen();
        } else if (settings.name == AppRoutes.verificationStatus) {
          route = const VerificationStatus();
        } else if (settings.name == AppRoutes.merchantDetail) {
          route = const MerchantDetailScreen();
        } else if (settings.name == AppRoutes.idKey) {
          route = const IdKeyScreen();
        } else if (settings.name == AppRoutes.urls) {
          route = const UrlScreen();
        } else {
          throw Exception('Unknown route defined.');
        }
        return MaterialPageRoute(builder: (_) => route, settings: settings);
      },
    );
  }
}