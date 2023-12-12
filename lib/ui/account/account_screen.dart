import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../components/index.dart';
import '../../config/app_assets.dart';
import '../../config/app_colors.dart';
import 'components/other_modules_view.dart';
import 'controller/account_controller.dart';

class AccountScreen extends StatelessWidget {

  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final accountController = Get.put(AccountController());
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        const CustomHeader(
          headerLabel: 'account',
        ),

        SizedBox(height: 24.h,),

        Obx(() => CircleAvatarWithDetails(
          profilePic: accountController.profileDetails.value?.userModels.avatar,
          countryCode: accountController.profileDetails.value?.userModels.countryCode,
          mobileNo: accountController.profileDetails.value?.userModels.phone,
          name: '${accountController.profileDetails.value?.userModels.firstName} ${accountController.profileDetails.value?.userModels.lastName}',
        ),),

        SizedBox(height: 24.h,),

        Flexible(
          child: Container(
            decoration: const BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.vertical(top: Radius.circular(40.0))
            ),
            height: Get.height,
            width: Get.width,
            padding: EdgeInsets.symmetric(horizontal: 18.w),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              padding: EdgeInsets.only(bottom: 98.h, top: 12.h),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  // CustomText(
                  //   label: 'RENEWAL DATE: 13-09-2023 AT 10:50',
                  //   fontStyle: FontStyle.normal,
                  //   fontWeight: FontWeight.w500,
                  //   textColor: AppColors.quartz,
                  //   textSize: 12.sp,
                  // ),

                  Obx(() => CustomAccountUserFilterView(
                    accountUserType: accountController.accountUserType,
                    onAccountUserTypeChanged: accountController.onAccountUserTypeChanged,
                    selectedUserType: accountController.selectedUserType.value,
                  )),

                  SizedBox(height: 24.h,),

                  Flexible(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: accountController.otherModulesList.map((e) {
                        String assetIMG;
                        if (e == 'profile_details') {
                          assetIMG = AppAssets.profileDetailsIcon;
                        } else if (e == 'change_plan') {
                          assetIMG = AppAssets.changePlanIcon;
                        } else if (e == 'select_language') {
                          assetIMG = AppAssets.selectLanguageIcon;
                        } else if (e == 'change_passcode') {
                          assetIMG = AppAssets.changePasscodeIcon;
                        } else if (e == 'invite_friends') {
                          assetIMG = AppAssets.inviteFriendsIcon;
                        } else if (e == 'verification_status') {
                          assetIMG = AppAssets.verificationStatusIcon;
                        } else if (e == 'merchant_details') {
                          assetIMG = AppAssets.merchantDetailsIcon;
                        } else if (e == 'request_crypto_account') {
                          assetIMG = AppAssets.requestCryptoAccountIcon;
                        } else if (e == 'terms_and_conditions') {
                          assetIMG = AppAssets.termsAndConditionsIcon;
                        } else {
                          assetIMG = AppAssets.logoutIcon;
                        }
                        return OtherModulesView(
                          assetIMG: assetIMG, 
                          label: e,
                          onPressed: () => accountController.onOtherModuleSelect(e),
                        );
                      }).toList(),
                    ),
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