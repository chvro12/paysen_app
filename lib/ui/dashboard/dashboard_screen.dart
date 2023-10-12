import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/index.dart';
import 'controller/dashboard_controller.dart';

class DashboardScreen extends StatelessWidget {

  DashboardScreen({super.key});

  final dashboardController = Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: Get.height,
        child: Stack(
          clipBehavior: Clip.none,
          children: [

            Obx(() => dashboardController.bottomNavigationBarBody[dashboardController.selectedBottomNavigationBarIndex.value]),

            Positioned(
              bottom: 0.0,
              child: Obx(() => CustomBottomNavigationBar(
                bottomNavigationBarItems: dashboardController.bottomNavigationBarItems,
                onBottomNavigationBarItemChanged: dashboardController.onBottomNavigationBarItemChanged,
                selectedBottomNavigationBarItem: dashboardController.selectedBottomNavigationBarIndex.value,
              )),
            ),

          ],
        ),
      ),
    );
  }
}