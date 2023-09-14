import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:paysen/components/index.dart';
import 'package:paysen/config/app_assets.dart';
import 'package:paysen/config/app_colors.dart';
import 'package:paysen/config/app_routes.dart';

import 'components/onboard_bottom_view.dart';
import 'controller/onboard_controller.dart';

class OnBoardScreen extends StatelessWidget {

  OnBoardScreen({super.key});

  final onboardController = Get.put(OnboardController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [

          CustomPageViewBuilder(
            itemCount: 3, 
            pageController: onboardController.pageController,
            onPageValueChange: onboardController.onPageChanged,
            builder: (_, index) => Image.asset(
              index == 0
              ? AppAssets.onboardingFirstIMG
              : index == 1
              ? AppAssets.onboardingSecondIMG
              : AppAssets.onboardingThirdIMG,
              height: 1.sh,
            )
          ),

          Positioned(
            bottom: 0.0,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(0.05.sh)),
                color: AppColors.whiteColor,
                shape: BoxShape.rectangle
              ),
              height: 0.4.sh,
              width: 1.sw,
              padding: EdgeInsets.symmetric(vertical: 0.05.sh),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [

                  Flexible(
                    child: CustomPageViewBuilder(
                      itemCount: 3,
                      scrollPhysics: const NeverScrollableScrollPhysics(),
                      pageController: onboardController.pageController,
                      builder: (context, index) => Obx(() => OnboardBottomView(
                        index: index, 
                        selectedIndex: onboardController.index.value
                      )),
                    ),
                  ),

                  SizedBox(
                    height: 0.06.sh,
                    width: 0.9.sw,
                    child: CustomElevatedButton(
                      btnLabel: 'get_started',
                      onBtnPressed: () => Navigator.pushNamed(context, AppRoutes.loginRoute),
                    ),
                  )

                ],
              ),
            ),
          )

        ],
      ),
    );
  }
}