import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../components/index.dart';
import '../../../config/app_assets.dart';
import '../../../config/app_colors.dart';

class CreditCardView extends StatelessWidget {

  final String cardNo;
  final String cardHolderName;
  final String validThru;
  final FontWeight cardHolderNameFontWeight;
  final double cardHolderNameFontSize;
  final String cardTypeLabel;
  final bool visibleCardBrandType;

  const CreditCardView({
    super.key,
    required this.cardNo,
    required this.cardHolderName,
    required this.validThru,
    this.cardHolderNameFontSize = 18,
    this.cardHolderNameFontWeight = FontWeight.w500,
    this.cardTypeLabel = 'credit_card',
    this.visibleCardBrandType = false
  });

  @override
  Widget build(BuildContext context) {
    List<String> cardNumbers = [];
    int value = (cardNo.length / 4).round();
    for (int i = 0; i < value; i++) {
      int temp = i * 4;
      cardNumbers.add(cardNo.substring(temp, temp + 4));
    }
    return Container(
      height: 0.26.sh,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 0.04.sw),
      child: Stack(
        children: [
          
          Image.asset(
            AppAssets.creditCardBG, 
            width: double.infinity, 
            height: double.infinity, 
            fit: BoxFit.fill,
          ),

          Positioned(
            top: 0.02.sh,
            left: 0.05.sw,
            child: CustomText(
              label: cardTypeLabel.tr,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w500,
              textColor: AppColors.whiteColor,
              textSize: 20.sp,
            ),
          ),

          Positioned(
            top: 0.02.sh,
            right: 0.05.sw,
            child: Image.asset(AppAssets.creditCardPaysenLogo),
          ),

          Positioned(
            top: 0.072.sh,
            left: 0.05.sw,
            child: Image.asset(AppAssets.creditCardChip),
          ),

          Positioned(
            top: 0.134.sh,
            left: 0.05.sw,
            right: 0.05.sw,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: cardNumbers.map((e) {
                return CustomText(
                  label: e,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w500,
                  textColor: AppColors.whiteColor,
                  textSize: 22.sp,
                  textLetterSpacing: 2.0,
                );
              }).toList(),
            ),
          ),

          // Positioned(
          //   top: 0.164.sh,
          //   left: 0.05.sw,
          //   child: CustomText(
          //     label: '0123',
          //     fontStyle: FontStyle.normal,
          //     fontWeight: FontWeight.w500,
          //     textColor: AppColors.whiteColor,
          //     textSize: 12.sp,
          //     textLetterSpacing: 2.0,
          //   ),
          // ),

          Positioned(
            bottom: 0.02.sh,
            left: 0.05.sw,
            child: CustomText(
              label: cardHolderName,
              fontStyle: FontStyle.normal,
              fontWeight: cardHolderNameFontWeight,
              textColor: AppColors.whiteColor,
              textSize: cardHolderNameFontSize.sp,
            ),
          ),

          if (validThru.trim().isNotEmpty)
            Positioned(
              top: 0.18.sh,
              right: 0.05.sw,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomText(
                    label: 'VALID\nTHRU',
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w500,
                    textColor: AppColors.whiteColor,
                    textSize: 8.sp,
                  ),
                  const SizedBox(width: 2.0,),
                  Image.asset(AppAssets.creditCardMisc),
                  const SizedBox(width: 4.0,),
                  CustomText(
                    label: validThru,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w500,
                    textColor: AppColors.whiteColor,
                    textSize: 16.sp,
                    textLetterSpacing: 2.0,
                  ),
                ],
              ),
            ),

          if (visibleCardBrandType) 
            Positioned(
              bottom: 0.02.sh,
              right: 0.05.sw,
              child: Image.asset(
                AppAssets.cardTypeVisaIMG,
                width: 50.w,
                height: 16.h,
              ),
            ),
        ],
      ),
    );
  }
}