import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:overlay_progress_indicator/overlay_progress_indicator.dart';

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