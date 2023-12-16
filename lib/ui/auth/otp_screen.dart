import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

import '../../components/index.dart';
import '../../config/app_colors.dart';
import 'controller/otp_controller.dart';

class OtpScreen extends StatelessWidget {

  OtpScreen({ super.key });

  final otpController = Get.put(OtpController());
  @override
  Widget build(BuildContext context) {
    final pinTheme = PinTheme(
      constraints: BoxConstraints(
        minWidth: 0.14.sw, 
        maxWidth: 0.14.sw, 
        minHeight: 0.08.sh, 
        maxHeight: 0.08.sh
      ),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.primaryColor),
        borderRadius: BorderRadius.circular(12.0),
        shape: BoxShape.rectangle,
        color: Colors.white
      ),
      textStyle: TextStyle(
        color: AppColors.blackColor,
        fontSize: 28.sp,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w300
      )
    );

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        color: AppColors.whiteColor,
        height: 1.sh,
        width: 1.sw,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [

            const CustomHeader(
              showBackButton: true,
            ),

            SizedBox(height: 0.06.sh,),

            Flexible(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
              
                    CustomText(
                      label: 'otp_header',
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w500,
                      textSize: 28.sp,
                      textAlignment: TextAlign.center,
                    ),

                    SizedBox(height: 0.03.sh,),

                    Text.rich(
                      TextSpan(
                        text: 'otp_description'.tr,
                        children: [
                          TextSpan(
                            text: otpController.mobileNoWithCountryCode,
                            style: TextStyle(
                              color: AppColors.tertiaryColor,
                              fontSize: 18.sp,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w300
                            ),
                          )
                        ]
                      ),
                      style: TextStyle(
                        color: AppColors.blackColor,
                        fontSize: 18.sp,
                         fontStyle: FontStyle.normal,
                         fontWeight: FontWeight.w300
                      ),
                      textAlign: TextAlign.center,
                    ),
              
                  ],
                ),
              ),
            ),

            SizedBox(height: 0.08.sh,),

            Container(
              padding: EdgeInsets.symmetric(horizontal: 0.04.sw),
              child: Pinput(
                autofocus: true,
                errorPinTheme: pinTheme.copyBorderWith(border: Border.all(color: AppColors.errorColor)),
                pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                validator: otpController.onOtpValidate,
                closeKeyboardWhenCompleted: true,
                focusedPinTheme: pinTheme,
                controller: otpController.otpController,
                inputFormatters: [ FilteringTextInputFormatter.digitsOnly ],
                followingPinTheme: pinTheme.copyBorderWith(border: Border.all(color: AppColors.borderColor)),
                keyboardType: TextInputType.number,
                length: 6,
                submittedPinTheme: pinTheme.copyBorderWith(border: Border.all(color: AppColors.borderColor)),
                // onClipboardFound: (value) => onOtpSubmitted(serverOtp, value),
                onCompleted: (value) => otpController.onOtpSubmitted(value),
                pinAnimationType: PinAnimationType.fade,
                textInputAction: TextInputAction.done,
              ),
            ),

            SizedBox(height: 0.04.sh,),

            Text.rich(
              TextSpan(
                text: "didn't_you_receive_the_code".tr,
                children: [
                  TextSpan(
                    text: 'resend'.tr ,
                    recognizer: TapGestureRecognizer()..onTap = () {
                      otpController.onOtpResend(context);
                    },
                    style: TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: 16.sp,
                      decoration: TextDecoration.underline,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w300
                    ),
                  )
                ]
              ),
              style: TextStyle(
                color: AppColors.blackColor,
                fontSize: 16.sp,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w300
              ),
              textAlign: TextAlign.center,
            )

          ],
        ),
      ),
    );
  }
}