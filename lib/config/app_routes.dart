import 'package:flutter/material.dart';

import '../ui/login/login_screen.dart';
import '../ui/onboarding/onboard_screen.dart';
import '../ui/one_time_password/otp_screen.dart';
import '../ui/splash/splash_screen.dart';


class AppRoutes {

  static const String initialRoute = '/';
  static const String onboardRoute = '/onboarding';
  static const String loginRoute = '/login';
  static const String otpRoute = '/otp';

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
      route = OtpScreen(mobileNoWithCountryCode: args as String);
    } else {
      throw Exception('Unknown route defined.');
    }

    return MaterialPageRoute(builder: (_) => route, settings: settings);
  }
}