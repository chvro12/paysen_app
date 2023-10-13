import 'package:flutter/material.dart';

import 'config/app_routes.dart';
import 'main.dart';
import 'ui/account/account_screen.dart';
import 'ui/cards/cards_screen.dart';
import 'ui/home/home_screen.dart';
import 'ui/support/support_screen.dart';

class WalletNestedNavigator extends StatelessWidget {

  final ValueChanged<bool> showWithdrawaBottomSheet;
  final ValueChanged<bool> showTopBottomSheet;

  const WalletNestedNavigator({
    super.key,
    required this.showTopBottomSheet,
    required this.showWithdrawaBottomSheet
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

        } else {
          throw Exception('Unknown route defined.');
        }
        return MaterialPageRoute(builder: (_) => route, settings: settings);
      },
    );
  }
}

class CardNestedNavigator extends StatelessWidget {

  const CardNestedNavigator({super.key});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: cardsNavigatorKey,
      initialRoute: AppRoutes.initialRoute,
      onGenerateRoute: (settings) {
        Widget route;
        if (settings.name == AppRoutes.initialRoute) {
          route = CardsScreen();
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