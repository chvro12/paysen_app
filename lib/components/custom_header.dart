import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:paysen/components/index.dart';

class CustomHeader extends StatelessWidget {

  final String? headerLabel;

  const CustomHeader({super.key, this.headerLabel});
  
  @override
  Widget build(BuildContext context) {
    return Container(
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
          
          if (headerLabel != null)
            CustomText(
              label: headerLabel!,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w500,
              textSize: 30.sp,
            )
    
        ],
      ),
    );
  }
}