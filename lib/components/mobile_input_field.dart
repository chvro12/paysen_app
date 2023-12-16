import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../config/app_assets.dart';
import '../config/app_colors.dart';
import 'custom_text.dart';

class MobileInputField extends StatelessWidget {

  final TextEditingController mobileNoController;
  final ValueChanged<String>? onFieldSubmitted;
  final double cursorHeight;
  final EdgeInsetsGeometry? fieldPadding;

  const MobileInputField({
    super.key,
    required this.mobileNoController,
    this.onFieldSubmitted,
    this.cursorHeight = 18,
    this.fieldPadding
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 0.08.sh,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(color: AppColors.borderColor)
      ),
      padding: EdgeInsets.symmetric(horizontal: 0.04.sw),
      width: 1.sw,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [

          SizedBox(
            width: 0.2.sw,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Padding(
                  padding: const EdgeInsets.only(top: 6),
                  child: CustomText(
                    label: 'SN',
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w300,
                    textColor: AppColors.blackColor,
                    textSize: 16.sp,
                  ),
                ),

                Image.asset(AppAssets.senegalFlagIMG)

              ],
            ),
          ),

          Container(
            width: 1,
            margin: EdgeInsets.symmetric(horizontal: 0.06.sw, vertical: 0.02.sh),
            color: AppColors.borderColor,
            height: double.infinity,
          ),

          Flexible(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                
                CustomText(
                  label: '+221',
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w500,
                  textColor: AppColors.blackColor,
                  textSize: 20.sp,
                ),

                Flexible(
                  child: TextField(
                    canRequestFocus: true,
                    autofocus: true,
                    controller: mobileNoController,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    keyboardType: TextInputType.number,
                    maxLength: 9,
                    textInputAction: TextInputAction.done,
                    autocorrect: true,
                    cursorColor: AppColors.primaryColor,
                    style: TextStyle(
                      color: AppColors.blackColor,
                      fontSize: 20.sp,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w500
                    ),
                    onSubmitted: onFieldSubmitted,
                    cursorHeight: cursorHeight,
                    decoration: InputDecoration(
                      alignLabelWithHint: true,
                      isDense: true,
                      isCollapsed: true,
                      border: InputBorder.none,
                      contentPadding: fieldPadding ?? EdgeInsets.zero,
                      counterText: '',
                      disabledBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      focusedErrorBorder: InputBorder.none,
                    ),
                  ),
                )

              ],
            ),
          )

        ],
      ),
    );
  }
}