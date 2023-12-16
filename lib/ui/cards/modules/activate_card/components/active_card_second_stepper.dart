import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../components/index.dart';
import '../controller/activate_card_controller.dart';

class ActiveCardSecondStepper extends StatelessWidget {

  final VoidCallback onContinuePressed;

  const ActiveCardSecondStepper({
    super.key,
    required this.onContinuePressed
  });

  @override
  Widget build(BuildContext context) {
    final ActivateCardController activateCardController = Get.find();
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        
        GroupInputField(
          groupLabel: 'personal_info',
          multipleFields: [
  
            CustomTextField(
              header: 'first_name',
              editingController: activateCardController.firstnameController,
              inputFieldHint: 'type_first_name_placeholder',
              capitalization: TextCapitalization.words,
              inputAction: TextInputAction.next,
              textInputType: TextInputType.name,
            ),
  
            CustomTextField(
              header: 'last_name',
              editingController: activateCardController.lastnameController,
              inputFieldHint: 'type_last_name_placeholder',
              capitalization: TextCapitalization.words,
              inputAction: TextInputAction.next,
              textInputType: TextInputType.name,
            ),
  
            CustomTextField(
              header: 'email',
              editingController: activateCardController.emailController,
              inputFieldHint: 'type_email_placeholder',
              inputAction: TextInputAction.next,
              textInputType: TextInputType.emailAddress,
            ),

            CustomTextField(
              header: 'phone_number',
              editingController: activateCardController.phonenoController,
              inputFieldHint: 'type_phone_number_placeholder',
              inputAction: TextInputAction.next,
              textInputType: TextInputType.number,
              capitalization: TextCapitalization.none,
            ),

            CustomTextField(
              header: 'birth_date',
              editingController: activateCardController.dateOfBirthController,
              inputFieldHint: 'type_birth_date_placeholder',
              inputAction: TextInputAction.next,
              textInputType: TextInputType.datetime,
              capitalization: TextCapitalization.none,
              isReadable: true,
              applyBottomMargin: false,
              onFieldTapped: () {},
            )
  
          ]
        ),

        SizedBox(height: 24.h,),

        GroupInputField(
          groupLabel: 'identity_document',
          multipleFields: [

            Obx(() => CustomDropDown(
              header: 'city',
              selectedValue: activateCardController.selectedNationalIds.value,
              items: activateCardController.nationalIds,
              onDropDownValueChanged: activateCardController.onNationalIdsSelect,
              applyBottomMargin: true,
              dropDownHint: 'id_type',
            )),
  
            CustomTextField(
              header: 'id_card',
              editingController: activateCardController.nationalIdNoController,
              inputFieldHint: 'type_id_card_placeholder',
              capitalization: TextCapitalization.none,
              inputAction: TextInputAction.done,
              textInputType: TextInputType.number,
            ),
  
          ]
        ),

        SizedBox(height: 24.h,),

        SizedBox(
          height: 0.07.sh,
          width: 1.sw,
          child: CustomElevatedButton(
            btnLabel: 'continue',
            onBtnPressed: onContinuePressed,
          ),
        ),
      ],
    );
  }
}