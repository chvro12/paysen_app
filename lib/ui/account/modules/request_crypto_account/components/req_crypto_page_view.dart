import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReqCryptoPageView extends StatelessWidget {

  final bool isSelected;
  final String item;

  const ReqCryptoPageView({
    super.key, 
    required this.isSelected, 
    required this.item
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        SizedBox(height: 32.h,),
        Image.asset(item),
        SizedBox(height: 32.h,),
      ],
    );
  }
}