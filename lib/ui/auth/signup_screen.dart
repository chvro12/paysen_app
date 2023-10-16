import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../components/index.dart';
import '../../config/app_assets.dart';
import '../../config/app_colors.dart';
import 'models/login_models.dart';
import 'controller/signup_controller.dart';

class SignupScreen extends StatelessWidget {

  final LoginModels loginModels;

  SignupScreen({
    super.key,
    required this.loginModels
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

            const CustomHeader(
              headerLabel: 'signup',
              showBackButton: true,
            ),

            SizedBox(height: 24.h,),

            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(40.0)),
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
                
                            GestureDetector(
                              onTap: () => signupController.onPermissionReq(context),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12.0),
                                  shape: BoxShape.rectangle,
                                  color: AppColors.primaryColor
                                ),
                                height: 0.08.sh,
                                width: 0.08.sh,
                                padding: const EdgeInsets.all(1.0),
                                child: Obx(() => signupController.profileIMG.value == null
                                ? Image.asset(AppAssets.signupProfileIMG)
                                : ClipRRect(
                                  borderRadius: BorderRadius.circular(12.0),
                                  child: Image.file(
                                    signupController.profileIMG.value!,
                                    fit: BoxFit.fill,
                                  ),
                                )),
                              ),
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

                          Obx(() => CustomDropDown(
                            header: 'city',
                            selectedValue: signupController.selectedCityDropDownModels.value,
                            items: signupController.cityModels.value?.cityList ?? [],
                            onDropDownValueChanged: signupController.onCitySelected,
                            applyBottomMargin: true,
                            dropDownHint: 'select_city',
                          )),

                          CustomTextField(
                            header: 'activity',
                            editingController: signupController.activityController,
                            inputFieldHint: 'activity_as_your_id',
                            capitalization: TextCapitalization.words,
                            inputAction: TextInputAction.next,
                            textInputType: TextInputType.name,
                            applyBottomMargin: true,
                          ),

                          Obx(() => CustomDropDown(
                            header: 'gender',
                            selectedValue: signupController.selectedGenderDropDownModels.value,
                            items: signupController.genderList,
                            onDropDownValueChanged: signupController.onGenderSelected,
                            dropDownHint: 'select_gender',
                          )),
                          
                        ],
                      ),

                      SizedBox(height: 0.06.sh,),

                      SizedBox(
                        height: 0.07.sh,
                        width: 1.sw,
                        child: CustomElevatedButton(
                          btnLabel: 'register',
                          btnBorderRadius: 60.0,
                          onBtnPressed: () => signupController.onRegisterPressed(context, loginModels),
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