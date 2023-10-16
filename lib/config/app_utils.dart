import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:overlay_progress_indicator/overlay_progress_indicator.dart';
import 'package:permission_handler/permission_handler.dart';

import '../components/index.dart';

typedef CustomListItemBuilder<T> = Widget Function(BuildContext context, int index, T value);

mixin ProgressHUDMixin {

  void show(BuildContext context) {
    OverlayProgressIndicator.show(
      context: context,
      backgroundColor: Colors.black45,
      child: Container(
        height: 0.15.sh,
        width: 0.15.sh,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),
        ),
        alignment: Alignment.center,
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CircularProgressIndicator(),
            CustomText(label: 'please_wait'),
          ],
        ),
      ),
    );
  }

  void dismiss() {
    OverlayProgressIndicator.hide();
  }
}

class ToastUtils {
  static void showToast(String msg) {
    Fluttertoast.showToast(msg: msg.tr, toastLength: Toast.LENGTH_LONG, gravity: ToastGravity.BOTTOM, fontSize: 14.sp,);
  }
}

class DeviceInfoUtils {

  DeviceInfoUtils._();

  static Future<AndroidDeviceInfo> androidDeviceInfo() async {
    final androidDeviceInformation = await DeviceInfoPlugin().androidInfo;
    return androidDeviceInformation;
  }

  static Future<IosDeviceInfo> iosDeviceInfo() async {
    final iosDeviceInformation = await DeviceInfoPlugin().iosInfo;
    return iosDeviceInformation;
  }
}

class ImagePickerUtils {

  ImagePickerUtils._();

  static final _imagePicker = ImagePicker();

  static Future<XFile?> pickFromGallery() async {
    final fromGallery = await _imagePicker.pickImage(source: ImageSource.gallery);
    return fromGallery;
  }

  static Future<XFile?> captureFromCamera() async {
    final fromCamera = await _imagePicker.pickImage(source: ImageSource.camera);
    return fromCamera;
  }
}

class PermissionUtils {

  final List<Permission> requestedPermission;

  PermissionUtils(this.requestedPermission);

  Future<bool?> validatePermissionStatus() async {
    
    Map<Permission, PermissionStatus> sendForPermissionReq = await requestedPermission.request();

    bool? validatePermission;

    final status = sendForPermissionReq.keys.toList();
    for (int i = 0; i < status.length; i++) {
      if (sendForPermissionReq[status[i]] == PermissionStatus.denied) {
        validatePermission = false;
        break;
      } else if (sendForPermissionReq[status[i]] == PermissionStatus.permanentlyDenied) {
        validatePermission = null;
        break;
      } else if (sendForPermissionReq[status[i]] == PermissionStatus.granted) {
        validatePermission = true;
      }
    }
    return validatePermission;
  }

}