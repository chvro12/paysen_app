import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/index.dart';
import '../../../config/app_logger.dart';
import '../../../config/app_routes.dart';
import '../../../config/app_utils.dart';
import '../../../main.dart';
import '../models/language_models.dart';
import '../models/profile_models.dart';
import '../models/user_plan_models.dart';
import '../repository/account_repo.dart';

class AccountController extends GetxController with ProgressHUDMixin {

  final AccountRepo _accountRepo = AccountRepo();
  Rxn<ProfileModels> profileDetails = Rxn();
  
  /// MAIN ACCOUNT DETAIL VARIABLES
  
  final List<String> otherModulesList = [
    'profile_details',
    'change_plan',
    'select_language',
    'change_passcode',
    'invite_friends',
    'verification_status',
    'merchant_details',
    'request_crypto_account',
    'terms_and_conditions',
    'logout'
  ];
  final List<String> accountUserType = [ 'premium'.tr, 'active'.tr ];

  final selectedUserType = 'premium'.obs;

  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _initialize();
    });
  }

  Future _initialize() async {
    show(Get.context!);
    try {
      profileDetails.value = await _accountRepo.getProfile();
    } catch (e) {
      AppLogger.e('exception: $e', e, className: 'AccountController', methodName: '_initialize()');
    } finally {
      dismiss(Get.context!);
    }
  }
  
  void onAccountUserTypeChanged(String value) {
    selectedUserType.value = value;
    update();
  }

  Future<void> onOtherModuleSelect(String val) async {
    if (val == 'profile_details') {
      _resetProfileDetailValues();
      _initializeDefaultValues();
      await accountNavigatorKey.currentState?.pushNamed(AppRoutes.profileDetails);
    } else if (val == 'change_plan') {
      _fetchPlanDetails();
      await accountNavigatorKey.currentState?.pushNamed(AppRoutes.changePlan);
    } else if (val == 'select_language') {     
      _fetchLanguageList(); 
      await accountNavigatorKey.currentState?.pushNamed(AppRoutes.changeLanguage);
    } else if (val == 'change_passcode') {
      _resetChangePasscodeValues();
      await accountNavigatorKey.currentState?.pushNamed(AppRoutes.changePasscode);
    } else if (val == 'invite_friends') {
      _resetInviteFriendsCodeDefaultValue();
      _initializeInviteFriendsValues();
      await accountNavigatorKey.currentState?.pushNamed(AppRoutes.inviteFriends);
    } else if (val == 'verification_status') {
      await accountNavigatorKey.currentState?.pushNamed(AppRoutes.verificationStatus);
    } else if (val == 'merchant_details') {
      await accountNavigatorKey.currentState?.pushNamed(AppRoutes.merchantDetail);
    } else if (val == 'request_crypto_account') {

    } else if (val == 'terms_and_conditions') {

    } else {

    }
    _initialize();
  }

  /// VARIABLES CONNECTED WITH CHANGE PLAN SCREEN
  final Rxn<MainUserPlanModels> userPlanModels = Rxn();
  final Rxn<UserPlanModels> selectedUserPlanModels = Rxn();

  void onUserPlanChanged(UserPlanModels val) {
    selectedUserPlanModels.value = val;
  }

  Future<void> sendChangePlan() async {

    if (selectedUserPlanModels.value == null) return; 

    show(Get.context!);

    try {

      String planId = selectedUserPlanModels.value!.id.toString();

      final profileModels = await _accountRepo.postChangePlan(planId);
      if (profileModels != null) {
        if (profileModels.isSuccess) {
          ToastUtils.showToast(profileModels.message);
          accountNavigatorKey.currentState?.pop();
        }
      }

    } catch (e) {
      AppLogger.e('exception: $e', e, className: 'AccountController', methodName: 'sendChangePlan()');
    } finally {
      dismiss(Get.context!);
    }
  }

  Future<void> _fetchPlanDetails() async {

    show(Get.context!);

    try {
      userPlanModels.value = await _accountRepo.fetchPlanList();
      if (userPlanModels.value != null) {
        if (userPlanModels.value!.isSuccess && userPlanModels.value!.data.isNotEmpty) {
          selectedUserPlanModels.value = userPlanModels.value!.data.first;
        }
      }
    } catch (e) {
      AppLogger.e('exception: $e', e, className: 'AccountController', methodName: '_fetchPlanDetails()');
    } finally {
      dismiss(Get.context!);
    }
  }

  /// VARIABLES CONNECTED WITH CHANGE LANGUAGE SCREEN
  final Rxn<MainLanguageModels> mainLanguageModels = Rxn();
  final Rxn<LanguageModels> selectedLanguageModels = Rxn();

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
          Get.updateLocale(Locale(langCode));
          ToastUtils.showToast(profileModels.message);
          accountNavigatorKey.currentState?.pop();
        }
      }

    } catch (e) {
      AppLogger.e('exception: $e', e, className: 'AccountController', methodName: 'sendChangeLanguage()');
    } finally {
      dismiss(Get.context!);
    }
  }

  Future<void> _fetchLanguageList() async {

    show(Get.context!);

    try {

      mainLanguageModels.value = await _accountRepo.fetchLanguageList();
      if (mainLanguageModels.value != null) {
        if (mainLanguageModels.value!.isSuccess) {

          if (profileDetails.value != null) {
            final index = mainLanguageModels.value!.data.indexWhere((element) {
              return element.code.toLowerCase() == profileDetails.value!.userModels.lang;
            });

            if (index != -1) {
              selectedLanguageModels.value = mainLanguageModels.value!.data[index];
            }
          }
        }
      }
    } catch (e) {
      AppLogger.e('exception: $e', e, className: 'AccountController', methodName: 'fetchLanguageList()');
    } finally {
      dismiss(Get.context!);
    }
  }

  /// VARIABLES CONNECTED WITH PROFILE DETAIL SCREEN
  final firstnameController = TextEditingController();
  final lastnameController = TextEditingController();
  final companyNameController = TextEditingController();
  final emailController = TextEditingController();

  void _initializeDefaultValues() {
    if (profileDetails.value == null) return;

    firstnameController.text = profileDetails.value!.userModels.firstName;
    lastnameController.text = profileDetails.value!.userModels.lastName;
    companyNameController.text = 'paysen'.tr;
    emailController.text = profileDetails.value!.userModels.email;
  }
  
  void _resetProfileDetailValues() {
    firstnameController.clear();
    lastnameController.clear();
    companyNameController.clear();
    emailController.clear();
  }

  Future<void> sendUpdateProfile() async {

    if (profileDetails.value == null) return;

    String firstName = firstnameController.text.trim();
    String lastName = lastnameController.text.trim();
    String companyName = companyNameController.text.trim();
    String email = emailController.text.trim();

    if (firstName.isEmpty) {
      ToastUtils.showToast('first_name_empty_message');
      return;
    }

    if (lastName.isEmpty) {
      ToastUtils.showToast('last_name_empty_message');
      return;
    }

    if (companyName.isEmpty) {
      ToastUtils.showToast('company_name_empty_message');
      return;
    }

    if (email.isEmpty) {
      ToastUtils.showToast('email_empty_message');
      return;
    }

    show(Get.context!);

    try {

      final profileModels = await _accountRepo.postUpdateProfile(firstName, lastName, email, companyName);
      if (profileModels != null) {
        ToastUtils.showToast(profileModels.message);
        if (profileModels.isSuccess) {
          _resetProfileDetailValues();
          accountNavigatorKey.currentState?.pop();
        }
      }

    } catch (e) {
      AppLogger.e('exception: $e', e, className: 'AccountController', methodName: 'sendChangeLanguage()');
    } finally {
      dismiss(Get.context!);
    }
  }

  /// VARIABLES CONNECTED WITH PROFILE DETAIL SCREEN
  final currentPasscode = TextEditingController();
  final addNewPasscode = TextEditingController();
  final confirmPasscode = TextEditingController();

  void _resetChangePasscodeValues() {
    currentPasscode.clear();
    addNewPasscode.clear();
    confirmPasscode.clear();
  }

  Future<void> onChangePasscodeSave(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (context) => const EndpointReqFailDialog(
        description: 'service_unavailable_description', 
        title: 'service_unavailable_title'
      )
    );
    accountNavigatorKey.currentState?.pop();
  }

  /// VARIABLES CONNECTED WITH INVITE FRIENDS SCREEN
  final inviteFriendsCodeController = TextEditingController();

  void _resetInviteFriendsCodeDefaultValue() {
    inviteFriendsCodeController.clear();
  }
  void _initializeInviteFriendsValues() {
    inviteFriendsCodeController.text = 'PSN-R-d1o0sr';
  }

  /// VARIABLES CONNECTED WITH MERCHANT DETAIL SCREEN
  final List<String> merchantDetailModuleList = [
    'id_and_key',
    'urls',
    'docs',
  ];

  void onMerchantDetailModuleSelect(String val) async {
    if (val == 'id_and_key') {
      
    } else if (val == 'urls') {
      
    } else if (val == 'docs') {     
      
    }
  }
}