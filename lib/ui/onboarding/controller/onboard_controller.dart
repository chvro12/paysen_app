import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardController extends GetxController {

  final pageController = PageController(viewportFraction: 1.0, initialPage: 0);
  var index = 0.obs;

  @override
  void onClose() {
    super.onClose();
    pageController.dispose();
  }

  void onPageChanged(int value) {
    index.value = value;
    update();
  }

}