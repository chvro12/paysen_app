import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paysen/config/app_enums.dart';

import '../../../config/app_utils.dart';
import '../../../models/dropdown_models.dart';
import '../../../models/user_models.dart';
import '../models/city_models.dart';
import '../models/login_models.dart';
import '../repository/auth_repo.dart';

class SignupController extends GetxController with ProgressHUDMixin {

  final AuthRepo _authRepo = AuthRepo();

  final firstnameController = TextEditingController();
  final lastnameController = TextEditingController();
  final emailController = TextEditingController();
  final activityController = TextEditingController();

  final List<DropdownModels> genderList = [
    DropdownModels(1, 'Male'),
    DropdownModels(2, 'Female')
  ];

  var cityModels = Rx<CityModels?>(null);
  var selectedCityDropDownModels = Rx<DropdownModels?>(null);
  var selectedGenderDropDownModels = Rx<DropdownModels?>(null);

  final profileIMG = Rx<File?>(null);

  @override
  void onInit() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      cityModels.value = await _authRepo.cities();
      update();
    });
    super.onInit();
  }
  
  @override
  void onClose() {
    firstnameController.dispose();
    lastnameController.dispose();
    emailController.dispose();
    activityController.dispose();
    super.onClose();
  }

  void onCitySelected(DropdownModels? value) {
    selectedCityDropDownModels.value = value;
    update();
  }

  void onGenderSelected(DropdownModels? value) {
    selectedGenderDropDownModels.value = value;
    update();
  }

  Future onRegisterPressed(BuildContext context, LoginModels loginModels) async {
    String firstName = firstnameController.text;
    if (firstName.trim().isEmpty) {
      return;
    }

    String lastName = lastnameController.text;
    if (firstName.trim().isEmpty) {
      return;
    }

    String email = emailController.text;
    if (firstName.trim().isEmpty) {
      return;
    }
    
    String activity = activityController.text;
    if (firstName.trim().isEmpty) {
      return;
    }

    if (selectedGenderDropDownModels.value == null) {
      return;
    }

    if (selectedCityDropDownModels.value == null) {
      return;
    }

    if (profileIMG.value == null) {
      return;
    }

    show(context);

    UserModels userModels = loginModels.userModels!.copyWith(
      firstName: firstName,
      lastName: lastName,
      email: email,
      activity: activity,
      gender: selectedGenderDropDownModels.value!.name.stringToGender
    );
    
    await _authRepo.register(userModels.toJson(selectedGenderDropDownModels.value!), [profileIMG.value!]);
    dismiss();
  }
}