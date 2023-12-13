import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../components/index.dart';
import '../../components/common_profile_components.dart';
import '../../controller/account_controller.dart';

class ChangePasscode extends StatelessWidget {

  const ChangePasscode({super.key});

  @override
  Widget build(BuildContext context) {
    final AccountController accountController = Get.find();
    return CommonProfileComponents(
      appbarTitle: 'change_passcode',
      subChildren: [
        
        CustomTextField(
          editingController: accountController.currentPasscode,
          header: 'current_passcode',
          inputFieldHint: '****',
          capitalization: TextCapitalization.none,
          containerHeight: 78.h,
          inputAction: TextInputAction.next,
          textInputType: TextInputType.visiblePassword,
          applyGap: false,
          applyBottomMargin: false,
        ),

        SizedBox(height: 24.h,),

        CustomTextField(
          editingController: accountController.addNewPasscode,
          header: 'add_new_passcode',
          inputFieldHint: '****',
          capitalization: TextCapitalization.none,
          containerHeight: 78.h,
          inputAction: TextInputAction.next,
          textInputType: TextInputType.visiblePassword,
          applyGap: false,
          applyBottomMargin: false,
        ),

        SizedBox(height: 24.h,),

        CustomTextField(
          editingController: accountController.confirmPasscode,
          header: 'confirm_passcode',
          inputFieldHint: '****',
          capitalization: TextCapitalization.none,
          containerHeight: 78.h,
          inputAction: TextInputAction.done,
          textInputType: TextInputType.visiblePassword,
          applyGap: false,
          applyBottomMargin: false,
        ),

        SizedBox(height: 40.h,),

        SizedBox(
          height: 0.07.sh,
          width: 1.sw,
          child: CustomElevatedButton(
            btnLabel: 'save',
            onBtnPressed: () => accountController.onChangePasscodeSave(context),
          ),
        ),

      ],
    );
  }
}