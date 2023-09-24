import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../components/index.dart';
import '../../config/app_assets.dart';
import '../../config/app_colors.dart';
import 'controller/signup_controller.dart';

class SignupScreen extends StatelessWidget {

  final String mobileNoWithCountryCode;

  SignupScreen({
    super.key,
    required this.mobileNoWithCountryCode
  });

  final signupController = Get.put(SignupController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: 1.sh,
        width: 1.sw,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [

            const CustomHeader(headerLabel: 'signup',),

            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40.0),
                  shape: BoxShape.rectangle,
                  color: Colors.white
                ),
                width: 1.sw,
                height: 0.814.sh,
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(vertical: 0.06.sh, horizontal: 0.06.sw),
                  scrollDirection: Axis.vertical,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                              
                      Flexible(
                        child: Container(
                          height: 0.16.sh,
                          decoration: const BoxDecoration(
                            border: Border(bottom: BorderSide(color: AppColors.borderColor))
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                                      
                              CustomText(
                                label: 'signup_header',
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w500,
                                textColor: AppColors.blackColor,
                                textSize: 22.sp,
                              ),
                                      
                              SizedBox(height: 0.03.sh,),
                                      
                              CustomText(
                                label: 'signup_description',
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w300,
                                textColor: AppColors.blackColor,
                                textSize: 18.sp,
                                textAlignment: TextAlign.center,
                              ),
                                      
                            ],
                          ),
                        ),
                      ),
                
                      SizedBox(height: 0.04.sh,),
                
                      SizedBox(
                        height: 0.08.sh,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.0),
                                shape: BoxShape.rectangle,
                                color: AppColors.primaryColor
                              ),
                              height: 0.08.sh,
                              width: 0.08.sh,
                              child: Image.asset(AppAssets.signupProfileIMG),
                            ),
                
                            SizedBox(width: 0.034.sw,),
                
                            Flexible(
                              child: CustomText(
                                label: 'signup_profile_description',
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w300,
                                textColor: AppColors.blackColor,
                                textSize: 16.sp,
                                textAlignment: TextAlign.center,
                              ),
                            )
                
                          ],
                        ),
                      ),
                
                      SizedBox(height: 0.04.sh,),
                
                      GroupInputField(
                        groupLabel: 'signup_group1',
                        multipleFields: [
                
                          CustomTextField(
                            header: 'first_name',
                            editingController: signupController.firstnameController,
                            inputFieldHint: 'first_name_as_your_id',
                            capitalization: TextCapitalization.words,
                            inputAction: TextInputAction.next,
                            textInputType: TextInputType.name,
                          ),
                
                          CustomTextField(
                            header: 'last_name',
                            editingController: signupController.lastnameController,
                            inputFieldHint: 'last_name_as_your_id',
                            capitalization: TextCapitalization.words,
                            inputAction: TextInputAction.next,
                            textInputType: TextInputType.name,
                          ),
                
                          CustomTextField(
                            header: 'email',
                            editingController: signupController.emailController,
                            inputFieldHint: 'email_example',
                            inputAction: TextInputAction.next,
                            textInputType: TextInputType.emailAddress,
                            applyBottomMargin: false,
                          )
                
                        ]
                      ),

                      SizedBox(height: 0.04.sh,),

                      GroupInputField(
                        groupLabel: 'signup_group2',
                        multipleFields: [

                          CustomTextField(
                            header: 'activity',
                            editingController: signupController.activityController,
                            inputFieldHint: 'activity_as_your_id',
                            capitalization: TextCapitalization.words,
                            inputAction: TextInputAction.next,
                            textInputType: TextInputType.name,
                          ),
                          
                        ],
                      ),

                      SizedBox(height: 0.06.sh,),

                      SizedBox(
                        height: 0.07.sh,
                        width: 1.sw,
                        child: CustomElevatedButton(
                          btnLabel: 'register',
                          btnBorderRadius: 60.0,
                          onBtnPressed: () {},
                        ),
                      )
                              
                    ],
                  ),
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}