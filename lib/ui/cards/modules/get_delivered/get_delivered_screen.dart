import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:paysen/config/app_assets.dart';

import '../../../../components/index.dart';
import '../../../../config/app_colors.dart';
import 'controller/get_delivered_controller.dart';

class GetDeliveredScreen extends StatelessWidget {

  GetDeliveredScreen({super.key});

  final GetDeliveredController getDeliveredController = Get.put(GetDeliveredController());

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.whiteColor,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
    
          const CustomHeader(
            headerLabel: 'get_delivered',
            showBackButton: true,
          ),
    
          SizedBox(height: 24.h,),
    
          Flexible(
            child: SingleChildScrollView(
              padding: EdgeInsets.only(left: 12.w, right: 12.w, bottom: 90.h),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
    
                  CustomText(
                    label: 'get_delivered_description',
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w300,
                    textColor: AppColors.blackColor,
                    textSize: 18.sp,
                    textAlignment: TextAlign.center,
                  ),
    
                  SizedBox(height: 0.04.sh,),
    
                  GroupInputField(
                    groupLabel: 'signup_group1',
                    multipleFields: [
            
                      CustomTextField(
                        header: 'full_name',
                        editingController: getDeliveredController.fullnameController,
                        inputFieldHint: '',
                        capitalization: TextCapitalization.words,
                        inputAction: TextInputAction.next,
                        textInputType: TextInputType.name,
                      ),
            
                      CustomTextField(
                        header: 'email',
                        editingController: getDeliveredController.emailController,
                        inputFieldHint: 'email_example',
                        inputAction: TextInputAction.next,
                        textInputType: TextInputType.emailAddress,
                        applyBottomMargin: false,
                      )
            
                    ]
                  ),

                  SizedBox(height: 0.04.sh,),

                  GroupInputField(
                    groupLabel: 'signup_group3',
                    multipleFields: [

                      CustomDropDown(
                        header: 'country',
                        selectedValue: null,
                        items: const [],
                        onDropDownValueChanged: getDeliveredController.onCountrySelected,
                        applyBottomMargin: true,
                        dropDownHint: 'select_country',
                      ),

                      Obx(() => CustomDropDown(
                        header: 'city_town',
                        selectedValue: getDeliveredController.selectedCityDropDownModels.value,
                        items: getDeliveredController.cityModels.value?.cityList ?? [],
                        onDropDownValueChanged: getDeliveredController.onCitySelected,
                        applyBottomMargin: true,
                        dropDownHint: 'select_city',
                      )),

                      CustomTextField(
                        header: 'street',
                        editingController: getDeliveredController.streetController,
                        inputFieldHint: 'street_number',
                        capitalization: TextCapitalization.words,
                        inputAction: TextInputAction.next,
                        textInputType: TextInputType.name,
                        applyBottomMargin: false,
                      ),
                      
                    ],
                  ),

                  SizedBox(height: 0.04.sh,),

                  GroupInputField(
                    groupLabel: 'paysen_physical_card',
                    multipleFields: [

                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.h),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                        
                            Expanded(
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                        
                                  Image.asset(
                                    AppAssets.paySenPhysicalCard,
                                    fit: BoxFit.fill,
                                  ),

                                  SizedBox(width: 12.w,),

                                  CustomText(
                                    label: 'debit_card_fee',
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w300,
                                    textColor: AppColors.blackColor,
                                    textSize: 14.sp,
                                  )
                        
                                ],
                              ),
                            ),

                            CustomText(
                              label: '6000 CFA',
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w500,
                              textColor: AppColors.blackColor,
                              textSize: 18.sp,
                            )
                        
                          ],
                        ),
                      ),

                    ],
                  ),

                  SizedBox(height: 0.04.sh,),

                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [

                      Container(
                        height: 32.h,
                        width: 32.w,
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.blackColor.withOpacity(0.5)),
                          borderRadius: BorderRadius.circular(4.0)
                        ),
                        child: const SizedBox(),
                      ),

                      SizedBox(width: 12.w,),

                      Flexible(
                        child: Text.rich(
                          TextSpan(
                            text: 'get_delivered_terms_and_conditions_initial'.tr,
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: AppColors.blackColor,
                              fontWeight: FontWeight.w300
                            ),
                            children: [
                              TextSpan(
                                text: 'get_delivered_terms_and_conditions_mid'.tr,
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: AppColors.primaryColor,
                                  fontWeight: FontWeight.w300,
                                  decoration: TextDecoration.underline,
                                  decorationColor: AppColors.primaryColor
                                ),
                              ),

                              TextSpan(
                                text: 'get_delivered_terms_and_conditions_end'.tr,
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: AppColors.blackColor,
                                  fontWeight: FontWeight.w300,
                                ),
                              )
                            ]
                          )
                        ),
                      )

                    ],
                  ),

                  SizedBox(height: 0.04.sh,),

                  SizedBox(
                    height: 0.07.sh,
                    width: double.infinity,
                    child: CustomElevatedButton(
                      btnLabel: 'order_now',
                      onBtnPressed: () {},
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