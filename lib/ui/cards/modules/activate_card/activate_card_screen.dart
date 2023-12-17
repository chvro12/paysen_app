import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:paysen/config/app_enums.dart';

import '../../../../components/index.dart';
import '../../../../config/app_colors.dart';
import '../../../dashboard/controller/dashboard_controller.dart';
import '../../components/credit_card_view.dart';
import 'components/activate_card_first_stepper.dart';
import 'components/active_card_second_stepper.dart';
import 'controller/activate_card_controller.dart';

class ActivateCardScreen extends StatelessWidget {

  final bool isSecondStepper;

  const ActivateCardScreen({
    super.key,
    this.isSecondStepper = false
  });

  @override
  Widget build(BuildContext context) {
    final ActivateCardController activateCardController = Get.put(ActivateCardController());
    final DashboardController dashboardController = Get.find();
    return Container(
      color: AppColors.whiteColor,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [

          const CustomHeader(
            showBackButton: true,
            headerLabel: 'activate_card',
          ),
          
          Flexible(
            child: Stack(
              children: [
                
                Positioned(
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 380.h,
                    color: AppColors.cultured,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        
                        SizedBox(height: 32.h,),

                        Obx(() {
                          String? cardNo, cardHolderName, validThru;
                          if (dashboardController.profileModels.value?.userModels.cardDetail != null) {
                            final dateTime = DateTime(int.parse(dashboardController.profileModels.value!.userModels.cardDetail!.expYear));
                            cardNo = dashboardController.profileModels.value!.userModels.cardDetail!.cardNumber;
                            cardHolderName = '${dashboardController.profileModels.value!.userModels.firstName} ${dashboardController.profileModels.value!.userModels.lastName}';
                            validThru = '${dashboardController.profileModels.value!.userModels.cardDetail!.expMonth}/${dateTime.humanReadableFormat('yy')}';
                          }
                          return CreditCardView(
                            cardNo: cardNo ?? '****************',
                            cardHolderName: cardHolderName ?? 'BALANCE',
                            validThru: validThru ?? '',
                            cardHolderNameFontSize: 16,
                            cardHolderNameFontWeight: FontWeight.w300,
                            cardTypeLabel: 'physical_card',
                            visibleCardBrandType: true,
                          );
                        }),

                        SizedBox(height: 32.h,),

                      ],
                    ),
                  ),
                ),

                Container(
                  margin: EdgeInsets.only(top: 240.h),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(40)
                    ),
                    color: AppColors.whiteColor,
                    shape: BoxShape.rectangle,
                  ),
                  width: Get.width,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    padding: EdgeInsets.only(left: 24.w, right: 24.w, top: 18.h, bottom: 108.h),
                    child: isSecondStepper
                    ? ActiveCardSecondStepper(
                      onContinuePressed: activateCardController.onContinuePressed,
                    )
                    : ActivateCardFirstStepper(
                      onActivateCardPressed: activateCardController.onActivateCardPressed,
                    ),
                  ),
                ),
      
              ],
            ),
          )
        ],
      ),
    );
  }
}