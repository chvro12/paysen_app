import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'index.dart';

class CustomHeader extends StatelessWidget {

  final bool showBackButton;
  final String? headerLabel;
  final Widget? childBeforeTitle;
  final double? headerFontSize;
  final List<Widget> actionButton;
  final double? headerHeight;

  const CustomHeader({
    super.key, 
    this.headerLabel,
    this.showBackButton = false,
    this.childBeforeTitle,
    this.headerFontSize,
    this.actionButton = const [],
    this.headerHeight
  });
  
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: Get.mediaQuery.padding,
      height: headerHeight ?? 0.08.sh,
      alignment: Alignment.bottomCenter,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          Flexible(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [

                if (showBackButton)
                  Flexible(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          padding: EdgeInsets.only(bottom: 0.01.sh),
                          child: IconButton(
                            onPressed: () => Navigator.pop(context),
                            icon: const Icon(Icons.arrow_back_rounded),
                            padding: EdgeInsets.zero,
                            visualDensity: VisualDensity.adaptivePlatformDensity,
                          ),
                        ),
                    
                        SizedBox(width: 0.04.sw,),
                      ],
                    ),
                  ),
                
                if (childBeforeTitle != null)
                  Flexible(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        childBeforeTitle ?? const SizedBox.shrink(),
                        SizedBox(width: 0.04.sw,),
                      ],
                    ),
                  ),
                
                if (headerLabel != null)
                  Flexible(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        
                        if (!showBackButton && childBeforeTitle == null)
                          SizedBox(width: 0.04.sw,),

                        CustomText(
                          label: headerLabel!,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w500,
                          textSize: headerFontSize ?? 30.sp,
                        )
                      ],
                    ),
                  ),
              ],
            ),
          ),
    
          if (actionButton.isNotEmpty)
            Padding(
              padding: EdgeInsets.only(right: 0.04.sw),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: actionButton,
              ),
            )
    
        ],
      ),
    );
  }
}