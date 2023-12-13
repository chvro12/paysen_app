import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../components/index.dart';
import '../../../../config/app_colors.dart';
import '../../components/common_profile_components.dart';
import '../../controller/account_controller.dart';

class ProfileDetailScreen extends StatelessWidget {

  const ProfileDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AccountController accountController = Get.find();
    return CommonProfileComponents(
      appbarTitle: 'profile_details',
      subChildren: [
        
        CustomTextField(
          editingController: accountController.firstnameController,
          header: 'first_name',
          inputFieldHint: '',
          capitalization: TextCapitalization.words,
          containerHeight: 78.h,
          inputAction: TextInputAction.next,
          textInputType: TextInputType.name,
          applyGap: false,
          applyBottomMargin: false,
        ),

        SizedBox(height: 24.h,),

        CustomTextField(
          editingController: accountController.lastnameController,
          header: 'last_name',
          inputFieldHint: '',
          capitalization: TextCapitalization.words,
          containerHeight: 78.h,
          inputAction: TextInputAction.next,
          textInputType: TextInputType.name,
          applyGap: false,
          applyBottomMargin: false,
        ),

        SizedBox(height: 24.h,),

        CustomTextField(
          editingController: accountController.companyNameController,
          header: 'company_name',
          inputFieldHint: '',
          capitalization: TextCapitalization.words,
          containerHeight: 78.h,
          inputAction: TextInputAction.next,
          textInputType: TextInputType.name,
          applyGap: false,
          applyBottomMargin: false,
        ),

        SizedBox(height: 24.h,),

        Obx(() => Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            CustomTextField(
              editingController: accountController.emailController,
              header: 'email',
              inputFieldHint: '',
              capitalization: TextCapitalization.none,
              containerHeight: 78.h,
              inputAction: TextInputAction.done,
              textInputType: TextInputType.emailAddress,
              applyGap: false,
              applyBottomMargin: false,
              containerBorderColor: accountController.profileDetails.value != null
              ? accountController.profileDetails.value!.userModels.emailVerifiedAt.trim().isEmpty
              ? AppColors.red
              : AppColors.borderColor
              : AppColors.transparent,
            ),

            if (accountController.profileDetails.value != null && accountController.profileDetails.value!.userModels.emailVerifiedAt.trim().isEmpty) ... [
              SizedBox(height: 8.h,),

              Align(
                alignment: Alignment.centerRight,
                child: CustomText(
                  label: 'send_verification_code',
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w300,
                  textColor: AppColors.primaryColor,
                  textDecoration: TextDecoration.underline,
                  textDecorationStyle: TextDecorationStyle.solid,
                  textSize: 16.sp,
                  textDecorationColor: AppColors.primaryColor,
                ),
              ),
            ],
          ],
        )),

        SizedBox(height: 40.h,),

        SizedBox(
          height: 0.07.sh,
          width: 1.sw,
          child: CustomElevatedButton(
            btnLabel: 'update',
            onBtnPressed: () => accountController.sendUpdateProfile(),
          ),
        ),

      ],
    );
  }
}