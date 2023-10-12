import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../components/index.dart';
import '../../config/app_assets.dart';
import '../../config/app_colors.dart';
import 'controller/card_view.dart';
import 'controller/cards_controller.dart';

class CardsScreen extends StatelessWidget {

  CardsScreen({super.key});

  final cardsController = Get.put(CardsController());

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [

        CustomHeader(
          headerLabel: 'cards',
          actionButton: [

            CircularIconButton(
              assetIMG: AppAssets.upDownArrowIcon,
              onCircularBtnPressed: () {},
            ),

            SizedBox(width: 0.04.sw,),

            CircularIconButton(
              assetIMG: AppAssets.addCircleIcon,
              onCircularBtnPressed: () {},
            ),

          ],
        ),

        Flexible(
          child: Container(
            decoration: const BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.vertical(top: Radius.circular(40.0))
            ),
            height: Get.height,
            padding: EdgeInsets.symmetric(horizontal: 0.04.sw, vertical: 0.08.sh),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
            
                  CardView(
                    linearGradientColor: const [
                      AppColors.darkCerulean,
                      AppColors.celestialBlue
                    ],
                    assetIMG: AppAssets.createVirtualCardIcon,
                    label: 'create_a_virtual_card',
                    onPressed: () {},
                  ),
            
                  SizedBox(height: 0.04.sh,),
            
                  CardView(
                    linearGradientColor: const [
                      AppColors.turkishRose,
                      AppColors.pastelPink
                    ],
                    assetIMG: AppAssets.createPhysicalCardIcon,
                    label: 'create_activate_physical_card',
                    onPressed: () {},
                  )
            
                ],
              ),
            ),
          ),
        )
        
      ],
    );
  }
}

class GradientXDTransform extends GradientTransform {
  final double angle1;
  final double angle2;

  const GradientXDTransform(this.angle1, this.angle2);

  @override
  Matrix4 transform(Rect bounds, {TextDirection? textDirection}) {
    final matrix = Matrix4.identity();
    matrix.rotateZ((angle1 - angle2) * (3.1415926535897932 / 180.0));
    return matrix;
  }
}