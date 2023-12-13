import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../components/index.dart';
import '../../../config/app_colors.dart';
import '../controller/account_controller.dart';

class CommonProfileComponents extends StatelessWidget {

  final String appbarTitle;
  final List<Widget> subChildren;

  const CommonProfileComponents({
    super.key,
    required this.appbarTitle,
    this.subChildren = const []
  });

  @override
  Widget build(BuildContext context) {
    final AccountController accountController = Get.find();
    return Container(
      color: AppColors.whiteColor,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          CustomHeader(
            headerLabel: appbarTitle,
            showBackButton: true,
          ),

          Expanded(
            child: Container(
              color: AppColors.cultured,
              child: SingleChildScrollView(
                padding: EdgeInsets.zero,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    
                    Flexible(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      
                          SizedBox(height: 12.h,),
                      
                          SizedBox(
                            width: Get.width,
                            child: CircleAvatarWithDetails(
                              profilePic: accountController.profileDetails.value?.userModels.avatar,
                              countryCode: accountController.profileDetails.value?.userModels.countryCode,
                              mobileNo: accountController.profileDetails.value?.userModels.phone,
                              name: '${accountController.profileDetails.value?.userModels.firstName} ${accountController.profileDetails.value?.userModels.lastName}',
                            ),
                          ),
                      
                          SizedBox(height: 12.h,),
                      
                        ],
                      ),
                    ),
                
                    Flexible(
                      child: Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: AppColors.whiteColor,
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(40)
                          )
                        ),
                        padding: EdgeInsets.only(top: 24.h, left: 12.w, right: 12.w),
                        width: Get.width,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Obx(() => CustomAccountUserFilterView(
                              accountUserType: accountController.accountUserType,
                              onAccountUserTypeChanged: accountController.onAccountUserTypeChanged,
                              selectedUserType: accountController.selectedUserType.value,
                            )),
                        
                            SizedBox(height: 24.h,),
              
                            Flexible(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: subChildren,
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                    
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}