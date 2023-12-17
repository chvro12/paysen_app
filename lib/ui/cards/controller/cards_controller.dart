import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/index.dart';
import '../../../config/app_routes.dart';

class CardsController extends GetxController {

  void createOractivatePhysicalCardPressed() {
    Get.dialog(const EndpointReqFailDialog(
      description: 'service_unavailable_description', 
      title: 'service_unavailable_title'
    ));
  }

  void createVirtualCardPressed(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.activateCard);
  }
}