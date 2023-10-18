import 'package:flutter/material.dart';

import '../ui/auth/login_screen.dart';
import '../ui/auth/models/login_models.dart';
import '../ui/dashboard/dashboard_screen.dart';
import '../ui/onboarding/onboard_screen.dart';
import '../ui/auth/otp_screen.dart';
import '../ui/auth/signup_screen.dart';
import '../ui/splash/splash_screen.dart';

class AppRoutes {

  static const String initialRoute = '/';
  static const String onboardRoute = '/onboarding';
  static const String loginRoute = '/login';
  static const String otpRoute = '/otp';
  static const String signupRoute = '/signup';
  static const String dashboard = '/dashboard';

  /// WALLET NESTED NAVIGATOR ROUTE
  static const String moneyWithdraw = '/money-withdraw';
  static const String distributorWithdrawal = '/distributor-withdrawal';
  static const String mobileMoneyBankCard = '/mobile-money-bank-card';

  /// CARD NESTED NAVIGATOR ROUTE
  static const String virtualCardInDollar = '/virtual-card-in-dollar';
  static const String physicalCard = '/physical-card';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    Widget route;
    Object? args = settings.arguments;

    if (settings.name == initialRoute) {
      route = SplashScreen();
    } else if (settings.name!.toLowerCase() == onboardRoute) {
      route = OnBoardScreen();
    } else if (settings.name!.toLowerCase() == loginRoute) {
      route = LoginScreen();
    } else if (settings.name!.toLowerCase() == otpRoute) {
      route = OtpScreen(loginModels: args as LoginModels);
    } else if (settings.name!.toLowerCase() == signupRoute) {
      route = SignupScreen(loginModels: args as LoginModels);
    } else if (settings.name!.toLowerCase() == dashboard) {
      route = DashboardScreen(initialIndex: args as int?,);
    } else {
      throw Exception('Unknown route defined.');
    }

    return MaterialPageRoute(builder: (_) => route, settings: settings);
  }
}