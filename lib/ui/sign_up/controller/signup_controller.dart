import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {

  final firstnameController = TextEditingController();
  final lastnameController = TextEditingController();
  final emailController = TextEditingController();
  final activityController = TextEditingController();

  @override
  void onClose() {
    firstnameController.dispose();
    lastnameController.dispose();
    emailController.dispose();
    activityController.dispose();
    super.onClose();
  }
}