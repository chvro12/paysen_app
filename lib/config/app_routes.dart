import 'package:flutter/material.dart';

import '../ui/auth/login_screen.dart';
import '../ui/auth/models/login_models.dart';
import '../ui/home/modules/checkout/checkout_screen.dart';
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
  static const String transactionHistory = '/transaction-history';
  static const String transactionDetail = '/transaction-detail';

  /// CARD NESTED NAVIGATOR ROUTE
  static const String virtualCardInDollar = '/virtual-card-in-dollar';
  static const String physicalCard = '/physical-card';
  static const String getDelivered = '/get-delivered';
  static const String checkout = '/checkout';

  /// ACCOUNT NESTED NAVIGATOR ROUTE
  static const String profileDetails = '/profile-details';
  static const String changePlan = '/change-plan';
  static const String changeLanguage = '/change-language';
  static const String changePasscode = '/change-passcode';
  static const String inviteFriends = '/invite-friends';
  static const String verificationStatus = '/verification-status';
  static const String merchantDetail = '/merchant-detail';
  static const String idKey = '$merchantDetail/id-key';
  static const String urls = '$merchantDetail/urls';
  static const String reqCryptoAccount = '/request-crypto-account';
  static const String termsAndCondition = '/terms-and-condition';
  static const String requestProcessed = '$reqCryptoAccount/request-processed';

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
      route = DashboardScreen();
    } else if (settings.name!.toLowerCase() == checkout) {
      route = CheckoutScreen(amount: args as double,);
    } else {
      throw Exception('Unknown route defined.');
    }

    return MaterialPageRoute(builder: (_) => route, settings: settings);
  }
}