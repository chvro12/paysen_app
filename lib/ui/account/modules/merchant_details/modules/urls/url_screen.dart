import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../../components/index.dart';
import '../../../../components/common_profile_components.dart';
import '../../../../controller/account_controller.dart';

class UrlScreen extends StatelessWidget {
  const UrlScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AccountController accountController = Get.find();
    return CommonProfileComponents(
      appbarTitle: 'urls',
      subChildren: [
        
        CustomTextField(
          editingController: accountController.checkOrderURLController,
          header: 'check_order_url',
          inputFieldHint: 'type_here',
          capitalization: TextCapitalization.none,
          containerHeight: 78.h,
          inputAction: TextInputAction.next,
          textInputType: TextInputType.url,
          applyGap: false,
          applyBottomMargin: false,
        ),

        SizedBox(height: 24.h,),

        CustomTextField(
          editingController: accountController.notifyURLController,
          header: 'notify_url',
          inputFieldHint: 'type_here',
          capitalization: TextCapitalization.none,
          containerHeight: 78.h,
          inputAction: TextInputAction.next,
          textInputType: TextInputType.url,
          applyGap: false,
          applyBottomMargin: false,
        ),

        SizedBox(height: 24.h,),

        CustomTextField(
          editingController: accountController.successURLController,
          header: 'success_url',
          inputFieldHint: 'type_here',
          capitalization: TextCapitalization.none,
          containerHeight: 78.h,
          inputAction: TextInputAction.next,
          textInputType: TextInputType.url,
          applyGap: false,
          applyBottomMargin: false,
        ),

        SizedBox(height: 24.h,),

        CustomTextField(
          editingController: accountController.failURLController,
          header: 'fail_url',
          inputFieldHint: 'type_here',
          capitalization: TextCapitalization.none,
          containerHeight: 78.h,
          inputAction: TextInputAction.next,
          textInputType: TextInputType.url,
          applyGap: false,
          applyBottomMargin: false,
        ),

        SizedBox(height: 24.h,),

        CustomTextField(
          editingController: accountController.linkURLController,
          header: 'link_url',
          inputFieldHint: 'type_here',
          capitalization: TextCapitalization.none,
          containerHeight: 78.h,
          inputAction: TextInputAction.next,
          textInputType: TextInputType.url,
          applyGap: false,
          applyBottomMargin: false,
        ),

        SizedBox(height: 40.h,),

        SizedBox(
          height: 0.07.sh,
          width: 1.sw,
          child: CustomElevatedButton(
            btnLabel: 'save',
            onBtnPressed: () {},
          ),
        ),

        SizedBox(height: 108.h,),
        
      ],
    );
  }
}