import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:paysen/components/index.dart';
import 'package:paysen/config/app_colors.dart';

import 'controller/login_controller.dart';

class LoginScreen extends StatelessWidget {

  LoginScreen({super.key});

  final loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SizedBox(
        height: 1.sh,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            
            Container(
              height: 0.14.sh,
              margin: Get.mediaQuery.padding,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  
                  Container(
                    padding: EdgeInsets.only(bottom: 0.01.sh),
                    child: IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.arrow_back_rounded),
                      alignment: Alignment.center,
                      padding: EdgeInsets.zero,
                      visualDensity: VisualDensity.adaptivePlatformDensity,
                    ),
                  ),
                  
                  SizedBox(width: 0.04.sw,),
                  
                  CustomText(
                    label: 'login',
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w500,
                    textSize: 30.sp,
                  )
            
                ],
              ),
            ),

            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40.0),
                  shape: BoxShape.rectangle,
                  color: Colors.white
                ),
                width: 1.sw,
                padding: EdgeInsets.symmetric(vertical: 0.06.sh, horizontal: 0.06.sw),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
              
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [

                          Flexible(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [

                                CustomText(
                                  label: 'welcome',
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w500,
                                  textColor: AppColors.blackColor,
                                  textSize: 22.sp,
                                ),

                                SizedBox(height: 0.03.sh,),

                                CustomText(
                                  label: 'please_login_to_continue',
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w300,
                                  textColor: AppColors.blackColor,
                                  textSize: 18.sp,
                                ),

                              ],
                            ),
                          ),

                          SizedBox(height: 0.06.sh,),

                          MobileInputField(
                            mobileNoController: loginController.mobileNoController,
                            onFieldSubmitted: (value) {
                              if (!loginController.shouldDisableBtn.value) {
                                loginController.onLoginPressed();
                              }
                            },
                          )
                        
                        ],
                      ),
                    ),

                    SizedBox(
                      height: 0.07.sh,
                      width: 1.sw,
                      child: Obx(() => CustomElevatedButton(
                        btnLabel: 'login',
                        disableButton: loginController.shouldDisableBtn.value,
                        onBtnPressed: loginController.shouldDisableBtn.value
                        ? null
                        : loginController.onLoginPressed,
                      )),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}