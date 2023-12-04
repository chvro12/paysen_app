import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../models/dropdown_models.dart';
import '../../../../auth/models/city_models.dart';
import '../../../../auth/repository/auth_repo.dart';

class GetDeliveredController extends GetxController {

  final AuthRepo _authRepo = AuthRepo();
  
  final fullnameController = TextEditingController();
  final emailController = TextEditingController();
  final streetController = TextEditingController();

  var cityModels = Rx<CityModels?>(null);
  var selectedCityDropDownModels = Rx<DropdownModels?>(null);

  @override
  void onInit() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      cityModels.value = await _authRepo.cities();
      update();
    });
    super.onInit();
  }

  void onCountrySelected(DropdownModels? value) {

  }

  void onCitySelected(DropdownModels? value) {
    selectedCityDropDownModels.value = value;
    update();
  }

}