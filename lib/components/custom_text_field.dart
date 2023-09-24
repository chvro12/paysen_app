import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:paysen/components/index.dart';

import '../config/app_colors.dart';

class CustomTextField extends StatelessWidget {

  final String header;
  final TextEditingController editingController;
  final TextInputType? textInputType;
  final int? maximumLength;
  final int? maximumLines;
  final int? minimumLines;
  final ValueChanged<String>? onTextChanged;
  final ValueChanged<String>? onFieldSubmitted;
  final VoidCallback? onFieldTapped;
  final TextCapitalization capitalization;
  final TextInputAction? inputAction;
  final String inputFieldHint;
  final bool applyBottomMargin;

  const CustomTextField({
    super.key,
    required this.header,
    required this.editingController,
    this.textInputType,
    this.maximumLength,
    this.maximumLines = 1,
    this.minimumLines,
    this.onTextChanged,
    this.onFieldSubmitted,
    this.onFieldTapped,
    this.capitalization = TextCapitalization.none,
    this.inputAction,
    required this.inputFieldHint,
    this.applyBottomMargin = true
  });

  @override
  Widget build(BuildContext context) {
    List<TextInputFormatter> inputFormatterList = [];
    if (textInputType == TextInputType.number) {
      inputFormatterList.add(FilteringTextInputFormatter.digitsOnly);
    }

    const noneInputBorder = InputBorder.none;

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.borderColor),
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(12.0)
      ),
      alignment: Alignment.center,
      padding: EdgeInsets.all(0.04.sw),
      margin: applyBottomMargin 
      ? EdgeInsets.only(bottom: 0.03.sh) 
      : EdgeInsets.zero,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          CustomText(
            label: header,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w300,
            textColor: AppColors.blackColor.withOpacity(0.7),
            textSize: 16.sp,
          ),

          SizedBox(height: 0.01.sh,),

          Flexible(
            child: TextField(
              autocorrect: true,
              controller: editingController,
              decoration: InputDecoration(
                alignLabelWithHint: true,
                border: noneInputBorder,
                contentPadding: EdgeInsets.zero,
                counterText: '',
                disabledBorder: noneInputBorder,
                enabledBorder: noneInputBorder,
                enabled: true,
                errorBorder: noneInputBorder,
                focusedBorder: noneInputBorder,
                focusedErrorBorder: noneInputBorder,
                hintText: inputFieldHint.tr,
                hintStyle: TextStyle(
                  color: AppColors.blackColor.withOpacity(0.5),
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w300,
                  fontStyle: FontStyle.normal
                ),
                isCollapsed: true,
                isDense: true,
              ),
              enableSuggestions: true,
              enableIMEPersonalizedLearning: true,
              enableInteractiveSelection: true,
              inputFormatters: inputFormatterList,
              keyboardType: textInputType,
              maxLength: maximumLength,
              maxLines: maximumLines,
              minLines: minimumLines,
              onChanged: onTextChanged,
              onSubmitted: onFieldSubmitted,
              onTap: onFieldTapped,
              style: TextStyle(
                color: AppColors.blackColor,
                fontSize: 16.sp,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w300,
              ),
              textAlign: TextAlign.start,
              textCapitalization: capitalization,
              textInputAction: inputAction,
            ),
          )

        ],                        
      ),
    );
  }
}