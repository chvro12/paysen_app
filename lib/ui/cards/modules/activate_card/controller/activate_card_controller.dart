import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paysen/config/app_enums.dart';
import 'package:paysen/ui/dashboard/controller/dashboard_controller.dart';

import '../../../../../config/app_logger.dart';
import '../../../../../config/app_routes.dart';
import '../../../../../config/app_utils.dart';
import '../../../../../main.dart';
import '../../../../../models/dropdown_models.dart';
import '../../../repository/card_repo.dart';

class ActivateCardController extends GetxController with ProgressHUDMixin {

  /// FIRST STEPPER
  void onActivateCardPressed() {
    _resetActivateCardToDefault();
    cardsNavigatorKey.currentState?.pushNamed(AppRoutes.activateCard, arguments: true);
  }

  /// SECOND STEPPER
  final firstnameController = TextEditingController();
  String get _firstname => firstnameController.text.trim();

  final lastnameController = TextEditingController();
  String get _lastname => lastnameController.text.trim();

  final emailController = TextEditingController();
  String get _email => emailController.text.trim();

  final phonenoController = TextEditingController();
  String get _phoneno => phonenoController.text.trim();

  final dateOfBirthController = TextEditingController();
  String get _dateOfBirth => dateOfBirthController.text.trim();

  final addressController = TextEditingController();
  String get _address => addressController.text.trim();

  final housenoController = TextEditingController();
  String get _houseno => housenoController.text.trim();

  final postalCodeController = TextEditingController();
  String get _postalcode => postalCodeController.text.trim();

  final nationalIdNoController = TextEditingController();
  String get _nationalId => nationalIdNoController.text.trim();

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
    if (_firstname.isEmpty) {
      ToastUtils.showToast('first_name_empty_message');
      return;
    }

    if (_lastname.isEmpty) {
      ToastUtils.showToast('last_name_empty_message');
      return;
    }

    if (_email.isEmpty) {
      ToastUtils.showToast('email_empty_message');
      return;
    }

    if (_phoneno.isEmpty) {
      ToastUtils.showToast('phone_no_empty_message');
      return;
    }

    if (_dateOfBirth.isEmpty) {
      ToastUtils.showToast('date_of_birth_empty_message');
      return;
    }

    if (_address.isEmpty) {
      ToastUtils.showToast('address_empty_message');
      return;
    }

    if (_houseno.isEmpty) {
      ToastUtils.showToast('houseno_empty_message');
      return;
    }

    if (_postalcode.isEmpty) {
      ToastUtils.showToast('postalcode_empty_message');
      return;
    }

    if (selectedNationalIds.value == null) {
      ToastUtils.showToast('national_id_empty_message');
      return;
    }

    if (_nationalId.isEmpty) {
      ToastUtils.showToast('national_id_card_no_empty_message');
      return;
    }

    _resetActivateCardThirdStepperDefaultValues();
    cardsNavigatorKey.currentState?.pushNamed(AppRoutes.cardActivateDocUpload);
  }

  Future<void> dateOfBirthPick(BuildContext context) async {
    final datetime = await showDatePicker(
      context: context, 
      firstDate: DateTime(1900), 
      lastDate: DateTime(DateTime.now().year + 100),
    );

    if (datetime != null) {
      dateOfBirthController.text = datetime.humanReadableFormat('dd/MM/yyyy');
    }
  }

  /// THIRD STEPPER
  RxMap<String, File?> uploadDocType = {
    'id_image': File(''),
    'back_id_image': File(''),
    'selfie_image': File('')
  }.obs;

  String? selectedDocUploadType;

  void _resetActivateCardThirdStepperDefaultValues() {
    uploadDocType.forEach((key, value) { uploadDocType[key] = File(''); });
    selectedDocUploadType = null;
    update();
  }

  void onSelectUploadDocType(String val) {
    selectedDocUploadType = val;
  }

  Future<void> onSubmitActivateCard() async {
    if (_firstname.isEmpty) {
      ToastUtils.showToast('first_name_empty_message');
      return;
    }

    if (_lastname.isEmpty) {
      ToastUtils.showToast('last_name_empty_message');
      return;
    }

    if (_email.isEmpty) {
      ToastUtils.showToast('email_empty_message');
      return;
    }

    if (_phoneno.isEmpty) {
      ToastUtils.showToast('phone_no_empty_message');
      return;
    }

    if (_dateOfBirth.isEmpty) {
      ToastUtils.showToast('date_of_birth_empty_message');
      return;
    }

    if (_address.isEmpty) {
      ToastUtils.showToast('address_empty_message');
      return;
    }

    if (_houseno.isEmpty) {
      ToastUtils.showToast('houseno_empty_message');
      return;
    }

    if (_postalcode.isEmpty) {
      ToastUtils.showToast('postalcode_empty_message');
      return;
    }

    if (selectedNationalIds.value == null) {
      ToastUtils.showToast('national_id_empty_message');
      return;
    }

    if (_nationalId.isEmpty) {
      ToastUtils.showToast('national_id_card_no_empty_message');
      return;
    }

    bool isLoopBreak = false;
    final keyList = uploadDocType.keys.toList();
    for (final key in keyList) {
      String toastMsg = 'id_card_back_not_selected';
      if (key == keyList.first) {
        toastMsg = 'id_card_front_not_selected';
      } else if (key == keyList.last) {
        toastMsg = 'selfie_not_captured';
      }
      File value = uploadDocType[key]!;
      if (!value.existsSync()) {
        ToastUtils.showToast(toastMsg);
        isLoopBreak = true;
        break;
      }
    }

    String? dob = _dateOfBirth.parseWithDateFormat('dd/MM/yyyy','yyyy/MM/dd');
    if (dob == null) {
      return;
    }

    if (!isLoopBreak) {

      show(Get.context!);

      try {

        final CardRepo cardRepo = CardRepo();

        File nationalIdFrontIMG = uploadDocType[keyList.first]!;
        File selfieIMG = uploadDocType[keyList.last]!;
        File nationalIdBackIMG = uploadDocType[keyList[1]]!;

        final profileModels = await cardRepo.newIssueVirtualCard(_address, _postalcode, _houseno, selectedNationalIds.value!.name, _nationalId, dob, <File>[nationalIdFrontIMG, selfieIMG, nationalIdBackIMG]);
        if (profileModels != null) {
          ToastUtils.showToast(profileModels.message);
          if (profileModels.isSuccess) {
            cardsNavigatorKey.currentState?.popUntil((route) => route.isFirst);
            final DashboardController dashboardController = Get.find();
            dashboardController.fetchUserProfileDetails();
          }
        }

      } catch (e) {
        AppLogger.e('exception: $e', e, className: 'ActivateCardController', methodName: 'onSubmitActivateCard()');
      } finally {
        dismiss(Get.context!);
      }
    }
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