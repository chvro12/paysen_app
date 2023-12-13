import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../../components/index.dart';
import '../../../../../../config/app_colors.dart';
import '../../../../components/common_profile_components.dart';
import '../../../../controller/account_controller.dart';

class IdKeyScreen extends StatelessWidget {

  const IdKeyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AccountController accountController = Get.find();
    return CommonProfileComponents(
      appbarTitle: 'id_key',
      subChildren: [
        
        Flexible(
          child: SizedBox(
            height: Get.height / 2,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [

                CustomTextField(
                  editingController: accountController.shopIdController,
                  header: 'shop_id',
                  inputFieldHint: 'type_id',
                  capitalization: TextCapitalization.words,
                  containerHeight: 78.h,
                  inputAction: TextInputAction.next,
                  textInputType: TextInputType.name,
                  applyGap: false,
                  applyBottomMargin: false,
                ),

                SizedBox(height: 24.h,),

                Obx(() => CustomTextField(
                  editingController: accountController.yourKeyController,
                  header: 'your_key',
                  inputFieldHint: '****',
                  capitalization: TextCapitalization.none,
                  containerHeight: 78.h,
                  inputAction: TextInputAction.done,
                  textInputType: TextInputType.visiblePassword,
                  applyGap: false,
                  obscureValue: accountController.obscureYourKey.value,
                  applyBottomMargin: false,
                  customSuffix: GestureDetector(
                    onTap: () => accountController.onObscreYourKeyChanged(),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
                      alignment: Alignment.bottomCenter,
                      width: 48.w,
                      child: Icon(
                        !accountController.obscureYourKey.value
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined
                      ),
                    ),
                  ),
                )),

                SizedBox(height: 48.h,),

                GestureDetector(
                  onTap: () => accountController.onGenerateNewKeyPressed(),
                  child: CustomText(
                    label: 'generate_new_key',
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w300,
                    textAlignment: TextAlign.center,
                    textColor: AppColors.primaryColor,
                    textDecoration: TextDecoration.underline,
                    textDecorationColor: AppColors.primaryColor,
                    textSize: 16.sp,
                  ),
                ),
              ],
            ),
          ),
        )

      ],
    );
  }
}