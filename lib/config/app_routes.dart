import 'package:flutter/material.dart';
import 'package:paysen/ui/onboarding/onboard_screen.dart';
import 'package:paysen/ui/splash/splash_screen.dart';

class AppRoutes {

  static const String initialRoute = '/';
  static const String onboardRoute = '/onboarding';
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    Widget route;
    // Object? args = settings.arguments;

    if (settings.name == initialRoute) {
      route = SplashScreen();
    } else if (settings.name!.toLowerCase() == onboardRoute) {
      route = OnBoardScreen();
    } else {
      throw Exception('Unknown route defined.');
    }

    return MaterialPageRoute(builder: (_) => route, settings: settings);
  }
}