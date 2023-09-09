import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:paysen/config/app_colors.dart';
import 'package:paysen/config/app_routes.dart';
import 'package:paysen/config/app_translations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          enableLog: true,
          smartManagement: SmartManagement.full,
          themeMode: ThemeMode.light,
          theme: ThemeData(
            fontFamily: 'Folio-Std',
            colorScheme: const ColorScheme(
              brightness: Brightness.light,
              background: AppColors.background,
              onBackground: AppColors.onBackground,
              error: AppColors.errorColor,
              onError: AppColors.onError,
              secondary: AppColors.secondaryColor,
              onSecondary: AppColors.whiteColor,
              primary: AppColors.primaryColor,
              onPrimary: AppColors.whiteColor,
              surface: AppColors.whiteColor,
              onSurface: AppColors.blackColor,
            ),
          ),
          title: 'Paysen',
          locale: LocalizationService().locale,
          fallbackLocale: LocalizationService().fallbackLocale,
          supportedLocales: const [ LocalizationService.enLocale, LocalizationService.frLocale ],
          translations: LocalizationService(),
          onGenerateRoute: AppRoutes.onGenerateRoute,
        );
      },
    );
  }
}