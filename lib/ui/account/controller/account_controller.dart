import 'package:get/get.dart';

class AccountController extends GetxController {

  final List<String> accountUserType = [
    'premium'.tr,
    'active'.tr
  ];

  final selectedUserType = 'premium'.obs;

  void onAccountUserTypeChanged(String value) {
    selectedUserType.value = value;
    update();
  }
}