import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../components/index.dart';
import '../../../../config/app_assets.dart';
import '../../../../config/app_colors.dart';
import '../../controller/account_controller.dart';

class InviteFriendScreen extends StatelessWidget {

  const InviteFriendScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AccountController accountController = Get.find();
    return Container(
      color: AppColors.whiteColor,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [

          const CustomHeader(
            headerLabel: 'invite_friends',
            showBackButton: true,
          ),

          Flexible(
            child: Container(
              padding: EdgeInsets.only(bottom: 92.h),
              child: CustomScrollView(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                slivers: [
              
                  SliverToBoxAdapter(
                    child: SizedBox(height: 24.h,),
                  ),
              
                  SliverToBoxAdapter(
                    child: Image.asset(
                      AppAssets.inviteFriendsIMG,
                      height: 200,
                    )
                  ),
              
                  SliverToBoxAdapter(
                    child: SizedBox(height: 32.h,),
                  ),
              
                  SliverToBoxAdapter(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 12.w),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                      
                          CustomText(
                            label: 'invite_friends_description',
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w500,
                            textColor: AppColors.blackColor,
                            textSize: 20.sp,
                            textAlignment: TextAlign.center,
                          ),
              
                          SizedBox(height: 24.h,),
              
                          CustomTextField(
                            editingController: accountController.inviteFriendsCodeController,
                            header: 'invite_code',
                            inputFieldHint: '****',
                            capitalization: TextCapitalization.none,
                            containerHeight: 78.h,
                            inputAction: TextInputAction.done,
                            textInputType: TextInputType.text,
                            applyGap: false,
                            applyBottomMargin: false,
                            disbaledInputField: true,
                            customSuffix: Container(
                              height: 78.h,
                              width: 60.w,
                              decoration: const BoxDecoration(
                                shape: BoxShape.rectangle,
                                color: AppColors.primaryColor,
                                borderRadius: BorderRadius.horizontal(
                                  right: Radius.circular(11)
                                )
                              ),
                              alignment: Alignment.center,
                              child: Image.asset(
                                AppAssets.clipboardTextCopyIcon,
                                color: AppColors.whiteColor,
                              ),
                            ),
                          ),
              
                          SizedBox(height: 32.h,),
              
                          SizedBox(
                            height: 0.07.sh,
                            width: 1.sw,
                            child: CustomElevatedButton(
                              btnLabel: 'save',
                              onBtnPressed: () {},
                            ),
                          ),
              
                          SizedBox(height: 24.h,),
              
                          CustomText(
                            label: 'total_invited_users',
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w500,
                            textColor: AppColors.blackColor,
                            textSize: 16.sp,
                            textAlignment: TextAlign.center,
                          ),
                          
                        ],
                      ),
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