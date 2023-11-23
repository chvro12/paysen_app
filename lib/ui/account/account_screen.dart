import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../components/index.dart';
import '../../config/app_assets.dart';
import '../../config/app_colors.dart';
import '../../config/app_routes.dart';
import '../../services/shared_pref_service.dart';
import 'components/other_modules_view.dart';
import 'controller/account_controller.dart';

class AccountScreen extends StatelessWidget {

  AccountScreen({super.key});

  final accountController = Get.put(AccountController());

  @override
  Widget build(BuildContext context) {
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
            padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 24.h),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              padding: EdgeInsets.only(bottom: 80.h),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  CustomText(
                    label: 'RENEWAL DATE: 13-09-2023 AT 10:50',
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w500,
                    textColor: AppColors.quartz,
                    textSize: 12.sp,
                  ),

                  SizedBox(height: 12.h,),

                  Obx(() => CustomAccountUserFilterView(
                    accountUserType: accountController.accountUserType,
                    onAccountUserTypeChanged: accountController.onAccountUserTypeChanged,
                    selectedUserType: accountController.selectedUserType.value,
                  )),

                  SizedBox(height: 24.h,),

                  Flexible(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [

                        OtherModulesView(
                          assetIMG: AppAssets.profileDetailsIcon, 
                          label: 'profile_details',
                          onPressed: () {},
                        ),

                        SizedBox(height: 12.h,),

                        OtherModulesView(
                          assetIMG: AppAssets.changePlanIcon, 
                          label: 'change_plan',
                          onPressed: () {},
                        ),

                        SizedBox(height: 12.h,),

                        OtherModulesView(
                          assetIMG: AppAssets.selectLanguageIcon, 
                          label: 'select_language',
                          onPressed: () {},
                        ),

                        SizedBox(height: 12.h,),

                        OtherModulesView(
                          assetIMG: AppAssets.changePasscodeIcon, 
                          label: 'change_passcode',
                          onPressed: () {},
                        ),

                        SizedBox(height: 12.h,),

                        OtherModulesView(
                          assetIMG: AppAssets.inviteFriendsIcon, 
                          label: 'invite_friends',
                          onPressed: () {},
                        ),

                        SizedBox(height: 12.h,),

                        OtherModulesView(
                          assetIMG: AppAssets.verificationStatusIcon, 
                          label: 'verification_status',
                          onPressed: () {},
                        ),

                        SizedBox(height: 12.h,),

                        OtherModulesView(
                          assetIMG: AppAssets.merchantDetailsIcon, 
                          label: 'merchant_details',
                          onPressed: () {},
                        ),

                        SizedBox(height: 12.h,),

                        OtherModulesView(
                          assetIMG: AppAssets.requestCryptoAccountIcon, 
                          label: 'request_crypto_account',
                          onPressed: () {},
                        ),

                        SizedBox(height: 12.h,),

                        OtherModulesView(
                          assetIMG: AppAssets.termsAndConditionsIcon, 
                          label: 'terms_and_conditions',
                          onPressed: () {},
                        ),

                        SizedBox(height: 12.h,),

                        OtherModulesView(
                          assetIMG: AppAssets.logoutIcon, 
                          label: 'logout',
                          onPressed: () async {
                            await SharedPrefService.clearSharedPrefs();
                            Get.offAllNamed(AppRoutes.loginRoute);
                          },
                        ),

                      ],
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