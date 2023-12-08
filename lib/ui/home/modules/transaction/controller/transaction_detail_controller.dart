import 'dart:io';
import 'dart:typed_data';

import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';

import '../../../../../config/app_logger.dart';
import '../../../../../config/app_utils.dart';
import '../../../models/transaction_models.dart';
import '../../../repository/transaction_repo.dart';

class TransactionDetailController extends GetxController with ProgressHUDMixin {

  final String _clientTransactionReference;

  TransactionDetailController(this._clientTransactionReference);

  final TransactionRepo _transactionRepo = TransactionRepo();

  ScreenshotController screenshotController = ScreenshotController();
  Rxn<TransactionModel> transactionModel = Rxn(null);
  
  @override
  void onInit() {
    super.onInit();
    AppLogger.d('Args from previous screen (client_transaction_reference): $_clientTransactionReference');
    _initialize();
  }

  Future<void> shareTransactionScreenshot() async {
    
    show(Get.context!);

    await screenshotController.capture(delay: const Duration(milliseconds: 10))
    .then((Uint8List? image) async {
      if (image != null) {
        final directory = await getApplicationDocumentsDirectory();
        final imagePath = await File('${directory.path}/${DateTime.now().millisecond}.png').create();
        await imagePath.writeAsBytes(image);

        /// Share Plugin
        await Share.shareXFiles([XFile(imagePath.path)]);
      }
    }).whenComplete(() => dismiss(Get.context!));
  }

  Future<void> _initialize() async {
    show(Get.context!);
    
    try {
      transactionModel.value = await _transactionRepo.fetchTransactionDetails(_clientTransactionReference);
    } catch (e) {
      AppLogger.e('exception (_initialize): $e', e, className: 'TransactionDetailController', methodName: '_initialize()');
    } finally {
      dismiss(Get.context!);
    }
  }
}