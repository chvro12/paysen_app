import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paysen/config/app_assets.dart';
import 'package:paysen/ui/splash/controller/splash_controller.dart';

class SplashScreen extends StatelessWidget {
  
  SplashScreen({super.key});

  final splashController = Get.put(SplashController());
  @override
  Widget build(BuildContext context) {
    return Image.asset(AppAssets.splashBackgroundIMG);
  }
}