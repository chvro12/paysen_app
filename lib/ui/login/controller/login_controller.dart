import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {

  final mobileNoController = TextEditingController();

  final RxBool shouldDisableBtn = RxBool(true);

  @override
  void onInit() {
    super.onInit();
    mobileNoController.addListener(_onTextChangeListener);
  }

  @override
  void onClose() {
    super.onClose();
    mobileNoController.removeListener(_onTextChangeListener);
    mobileNoController.dispose();
  }

  void _onTextChangeListener() {
    shouldDisableBtn.value = mobileNoController.text.length < 9;
    update();
  }

  Future<void> onLoginPressed() async {
    
  }
}