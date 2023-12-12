import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../config/app_logger.dart';
import '../../../../../config/app_utils.dart';
import '../../../../../main.dart';
import '../../../controller/account_controller.dart';
import '../../../models/language_models.dart';
import '../../../repository/account_repo.dart';

class ChangeLanguageControler extends GetxController with ProgressHUDMixin {

  final AccountRepo _accountRepo = AccountRepo();
  final Rxn<MainLanguageModels> mainLanguageModels = Rxn();
  final Rxn<LanguageModels> selectedLanguageModels = Rxn();
  
  @override
  void onInit() {
    super.onInit();
    _initialize();
  }

  void onLanguageChanged(LanguageModels val) {
    selectedLanguageModels.value = val;
  }

  Future<void> sendChangeLanguage() async {

    if (selectedLanguageModels.value == null) return; 

    show(Get.context!);

    try {

      String langCode = selectedLanguageModels.value!.code;

      final profileModels = await _accountRepo.postSelectLanguage(langCode);
      if (profileModels != null) {
        if (profileModels.isSuccess) {
          await _initialize();
          Get.updateLocale(Locale(langCode));
          ToastUtils.showToast(profileModels.message);
          accountNavigatorKey.currentState?.pop();
          Get.delete<ChangeLanguageControler>();
        }
      }

    } catch (e) {
      AppLogger.e('exception: $e', e, className: 'ChangeLanguageControler', methodName: 'sendChangeLanguage()');
    } finally {
      dismiss(Get.context!);
    }
  }

  Future<void> _initialize() async {

    show(Get.context!);

    try {
      mainLanguageModels.value = await _accountRepo.fetchLanguageList();
      if (mainLanguageModels.value != null) {
        if (mainLanguageModels.value!.isSuccess) {

          final AccountController accountController = Get.find();
          if (accountController.profileDetails.value != null) {
            final index = mainLanguageModels.value!.data.indexWhere((element) {
              return element.code.toLowerCase() == accountController.profileDetails.value!.userModels.lang;
            });

            if (index != -1) {
              selectedLanguageModels.value = mainLanguageModels.value!.data[index];
            }
          }
        }
      }
    } catch (e) {
      AppLogger.e('exception: $e', e, className: 'ChangeLanguageControler', methodName: '_initialize()');
    } finally {
      dismiss(Get.context!);
    }
  }
}