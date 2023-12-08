import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:paysen/config/app_enums.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../components/index.dart';
import '../../../config/app_assets.dart';
import '../../../config/app_colors.dart';
import '../../../config/app_routes.dart';
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

  Future<void> _onCapturedWithCamera() async {
    final value = await ImagePickerUtils.captureFromCamera();
    if (value != null) {
      profileIMG.value = File(value.path);
    } else {
      profileIMG.value = null;
    }
    update();
  }

  Future<void> _onPickedFromGallery() async {
    final value = await ImagePickerUtils.pickFromGallery();
    if (value != null) {
      profileIMG.value = File(value.path);
    } else {
      profileIMG.value = null;
    }
    update();
  }

  Future<void> _onMediaOptionBottomSheet(BuildContext context) async {
    final iMGSize = Size(24.w, 24.h);
    showModalBottomSheet(
      context: context, 
      backgroundColor: Colors.transparent,
      builder: (ctx) {
        return TwoOptionsBottomSheet(
          header: 'image_option', 
          bottomSheetHeight: 240.h,
          iMGColor1: AppColors.primaryColor,
          iMGColor2: AppColors.primaryColor,
          assetIMG1: AppAssets.cameraIcon, 
          assetIMG2: AppAssets.galleryIcon, 
          label1: 'capture_from_camera', 
          label2: 'pick_from_gallery', 
          iMGSize1: iMGSize,
          iMGSize2: iMGSize,
          onPressed1: () => _onCapturedWithCamera(),
          onPressed2: () => _onPickedFromGallery(),
          onCloseBottomSheet: () {
            Navigator.pop(ctx);
          },
        );
      },
    );
  }

  Future onPermissionReq(BuildContext context) async {
    PermissionUtils permissionUtils;
    
    final androidDeviceInfo = await DeviceInfoUtils.androidDeviceInfo();
    
    if (androidDeviceInfo.version.sdkInt < 33) {
      permissionUtils = PermissionUtils([Permission.storage]);
    } else {
      permissionUtils = PermissionUtils([Permission.photos]);
    }

    final status = await permissionUtils.validatePermissionStatus();
    Widget? alertDialogWidget = PermissionDialog(
      description: 'permission_error_description', 
      title: 'permission_error_title',
      visibleSettingBtn: status == null,
    );
    
    
    if (status == true) {
      alertDialogWidget = null;
    }
    if (alertDialogWidget != null) {
      Get.dialog(alertDialogWidget);
      return;
    }
    // ignore: use_build_context_synchronously
    _onMediaOptionBottomSheet(context);
  }

  Future onRegisterPressed(BuildContext context, LoginModels loginModels) async {
    String firstName = firstnameController.text.trim();
    if (firstName.isEmpty) {
      ToastUtils.showToast('first_name_empty_message');
      return;
    }

    String lastName = lastnameController.text.trim();
    if (lastName.isEmpty) {
      ToastUtils.showToast('last_name_empty_message');
      return;
    }

    String email = emailController.text.trim();
    if (email.isEmpty) {
      ToastUtils.showToast('email_empty_message');
      return;
    }
    
    String activity = activityController.text.trim();
    if (activity.isEmpty) {
      ToastUtils.showToast('activity_empty_message');
      return;
    }

    if (selectedGenderDropDownModels.value == null) {
      ToastUtils.showToast('gender_not_selected');
      return;
    }

    if (selectedCityDropDownModels.value == null) {
      ToastUtils.showToast('last_name_empty_message');
      return;
    }

    if (profileIMG.value == null) {
      ToastUtils.showToast('last_name_empty_message');
      return;
    }

    show(Get.context!);

    UserModels userModels = loginModels.userModels!.copyWith(
      firstName: firstName,
      lastName: lastName,
      email: email,
      activity: activity,
      gender: selectedGenderDropDownModels.value!.name.stringToGender,
    );
    
    List<File> avatarFiles = [];
    if (profileIMG.value != null) {
      avatarFiles.add(profileIMG.value!);
    }

    final registerModels = await _authRepo.register(userModels.toJson(selectedGenderDropDownModels.value!), avatarFiles);
    ToastUtils.showToast(registerModels.message);
    if (!registerModels.isSuccess) return;
    Get.offAllNamed(AppRoutes.loginRoute);
    dismiss(Get.context!);
  }
}