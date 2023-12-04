import 'package:flutter/material.dart';

import 'config/app_routes.dart';
import 'main.dart';
import 'ui/account/account_screen.dart';
import 'ui/cards/cards_screen.dart';
import 'ui/cards/modules/get_delivered/get_delivered_screen.dart';
import 'ui/cards/modules/physical_card/physical_card_screen.dart';
import 'ui/cards/modules/virtual_card_in_dollar/virtual_card_in_dollar_screen.dart';
import 'ui/home/home_screen.dart';
import 'ui/home/modules/distributor_withdrawal/distributor_withdrawal_screen.dart';
import 'ui/home/modules/mobile_money_bank_card/mobile_money_bank_card_screen.dart';
import 'ui/home/modules/mobile_money_with_withdrawal/mobile_money_with_withdrawal_screen.dart';
import 'ui/home/modules/transaction_details/transaction_detail_screen.dart';
import 'ui/home/modules/transaction_history/transaction_history_screen.dart';
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
        if (settings.name == AppRoutes.initialRoute) {
          
          route = HomeScreen(
            showTopBottomSheet: showTopBottomSheet, 
            showWithdrawaBottomSheet: showWithdrawaBottomSheet,
          );

        } else if (settings.name == AppRoutes.moneyWithdraw) {
          route = MobileMoneyWithWithdrawalScreen();
        } else if (settings.name == AppRoutes.distributorWithdrawal) {
          route = const DistributorWithdrawalScreen();
        } else if (settings.name == AppRoutes.mobileMoneyBankCard) {
          route = MobileMoneyBankCardScreen();
        } else if (settings.name == AppRoutes.transactionHistory) {
          route = TransactionHistoryScreen();
        } else if (settings.name == AppRoutes.transactionDetail) {
          route = TransactionDetailScreen();
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
          route = AccountScreen();
        } else {
          throw Exception('Unknown route defined.');
        }
        return MaterialPageRoute(builder: (_) => route, settings: settings);
      },
    );
  }
}