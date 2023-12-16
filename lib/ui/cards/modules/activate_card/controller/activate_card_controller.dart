import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../config/app_routes.dart';
import '../../../../../config/app_utils.dart';
import '../../../../../main.dart';
import '../../../../../models/dropdown_models.dart';

class ActivateCardController extends GetxController with ProgressHUDMixin {

  /// FIRST STEPPER
  void onActivateCardPressed() {
    _resetActivateCardToDefault();
    cardsNavigatorKey.currentState?.pushNamed(AppRoutes.activateCard, arguments: true);
  }

  /// SECOND STEPPER
  final firstnameController = TextEditingController();
  String get firstname => firstnameController.text.trim();

  final lastnameController = TextEditingController();
  String get lastname => lastnameController.text.trim();

  final emailController = TextEditingController();
  String get email => emailController.text.trim();

  final phonenoController = TextEditingController();
  String get phoneno => phonenoController.text.trim();

  final dateOfBirthController = TextEditingController();
  String get dateOfBirth => dateOfBirthController.text.trim();

  final addressController = TextEditingController();
  String get address => addressController.text.trim();

  final housenoController = TextEditingController();
  String get houseno => housenoController.text.trim();

  final postalCodeController = TextEditingController();
  String get postalcode => postalCodeController.text.trim();

  final nationalIdNoController = TextEditingController();
  String get nationalId => nationalIdNoController.text.trim();

  final nationalIds = <CommonModels>[
    CommonModels(1, 'SENEGAL_NATIONAL_ID'),
    CommonModels(2, 'SENEGAL_ECOWAS_ID')
  ];

  final Rxn<CommonModels> selectedNationalIds = Rxn<CommonModels>();

  void onNationalIdsSelect(CommonModels? val) {
    selectedNationalIds.value = val;
  }

  void _resetActivateCardToDefault() {
    firstnameController.clear();
    lastnameController.clear();
    phonenoController.clear();
    dateOfBirthController.clear();
    addressController.clear();
    housenoController.clear();
    postalCodeController.clear();
    nationalIdNoController.clear();
    selectedNationalIds.value = null;
  }

  void onContinuePressed() {
    if (firstname.isEmpty) {
      ToastUtils.showToast('first_name_empty_message');
      return;
    }

    if (lastname.isEmpty) {
      ToastUtils.showToast('last_name_empty_message');
      return;
    }

    if (email.isEmpty) {
      ToastUtils.showToast('email_empty_message');
      return;
    }

    if (phoneno.isEmpty) {
      ToastUtils.showToast('mobile_no_empty_message');
      return;
    }

    if (dateOfBirth.isEmpty) {
      ToastUtils.showToast('date_of_birth_empty_message');
      return;
    }

    if (selectedNationalIds.value == null) {
      ToastUtils.showToast('national_id_empty_message');
      return;
    }

    if (nationalId.isEmpty) {
      ToastUtils.showToast('national_id_card_empty_message');
      return;
    }

    _resetActivateCardThirdStepperDefaultValues();
    cardsNavigatorKey.currentState?.pushNamed(AppRoutes.cardActivateDocUpload);
  }

  /// THIRD STEPPER
  RxMap<String, File?> uploadDocType = {
    'id_image': File(''),
    'back_id_image': File(''),
    'selfie_image': File('')
  }.obs;

  String? selectedDocUploadType;

  void _resetActivateCardThirdStepperDefaultValues() {
    uploadDocType.forEach((key, value) { value = null; });
    selectedDocUploadType = null;
  }

  void onSelectUploadDocType(String val) {
    selectedDocUploadType = val;
  }

  Future<void> onSubmitActivateCard() async {

  }

  void onIMGPreviewPressed(String val) {
    onSelectUploadDocType(val);
    cardsNavigatorKey.currentState?.pushNamed(AppRoutes.cardActivateDocPreview);
  }
  
  @override
  void onClose() {
    firstnameController.dispose();
    lastnameController.dispose();
    emailController.dispose();
    phonenoController.dispose();
    dateOfBirthController.dispose();
    addressController.dispose();
    housenoController.dispose();
    postalCodeController.dispose();
    super.onClose();
  }
}