import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../../../../components/index.dart';
import '../../../../config/app_assets.dart';
import '../../../../config/app_colors.dart';
import '../../../../config/app_utils.dart';

class DistributorWithdrawalScreen extends StatefulWidget {

  const DistributorWithdrawalScreen({super.key});

  @override
  State<DistributorWithdrawalScreen> createState() => _DistributorWithdrawalScreenState();
}

class _DistributorWithdrawalScreenState extends State<DistributorWithdrawalScreen> with WidgetsBindingObserver {

  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  bool? _cameraPermissionStatus;

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  void dispose() {
    controller?.dispose();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _initialize();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.inactive || state == AppLifecycleState.paused) {
      controller?.pauseCamera();
    } else if (state == AppLifecycleState.resumed) {
      controller?.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.whiteColor,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [

          const CustomHeader(
            headerLabel: 'retailer_withdrawal',
            showBackButton: true,
          ),

          SizedBox(height: 24.h,),

          Image.asset(AppAssets.retailerWithdrawalIcon),

          SizedBox(height: 24.h,),

          Container(
            width: 182.w,
            height: 152.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: _cameraPermissionStatus == null || _cameraPermissionStatus == false 
              ? AppColors.blackColor.withOpacity(0.8)
              : null,
              shape: BoxShape.rectangle
            ),
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              alignment: Alignment.center,
              children: [

                if (_cameraPermissionStatus != null && _cameraPermissionStatus == true)
                  _buildQrView(context),

                Positioned.fill(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      AppAssets.scanQREdges,
                      fit: BoxFit.fill,
                    ),
                  ),
                )
              ],
            ),
          ),

          SizedBox(height: 48.h,),

          Flexible(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 12.w),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
            
                  CustomText(
                    label: 'scan_qr_code',
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w500,
                    textColor: AppColors.blackColor,
                    textSize: 32.sp,
                  ),
            
                  SizedBox(height: 12.h,),
            
                  CustomText(
                    label: 'scan_qr_code_description',
                    fontStyle: FontStyle.normal,
                    textAlignment: TextAlign.center,
                    fontWeight: FontWeight.w300,
                    textColor: AppColors.blackColor,
                    textSize: 18.sp,
                  ),
                  
                ],
              ),
            ),
          ),

          SizedBox(height: 36.h,),

          Container(
            height: 0.07.sh,
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 12.w),
            child: CustomElevatedButton(
              btnLabel: 'scan',
              onBtnPressed: () {},
            ),
          )
          
        ],
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
    );    
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
    });
  }

  Future _initialize() async {
    PermissionUtils permissionUtils = PermissionUtils([Permission.camera]);
    _cameraPermissionStatus = await permissionUtils.validatePermissionStatus();
    Widget? alertDialogWidget = PermissionDialog(
      description: 'permission_error_description', 
      title: 'permission_error_title',
      visibleSettingBtn: _cameraPermissionStatus == null,
    );
    
    
    if (_cameraPermissionStatus == true) {
      alertDialogWidget = null;
    }

    if (alertDialogWidget != null) {
      if (!mounted) return;
      showDialog(context: context, builder: (context) => alertDialogWidget ?? const SizedBox.shrink(),);
    }
    if (!mounted) return;
    setState(() {});
  }
}