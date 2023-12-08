import 'package:get/get.dart';
import 'package:paysen/config/app_enums.dart';
import 'package:paysen/config/app_logger.dart';

import '../../../config/app_utils.dart';
import '../models/transaction_models.dart';
import '../repository/transaction_repo.dart';

class HomeController extends GetxController with ProgressHUDMixin {

  final TransactionRepo _transactionRepo = TransactionRepo();

  Rxn<MainTransactionModel> mainTransactionModel = Rxn(null);

  @override
  void onInit() {
    super.onInit();
    _initialize();
  }

  Future<void> _initialize() async {
    show(Get.context!);

    try {
      mainTransactionModel.value = await _transactionRepo.fetchCardTransaction(TransactionFilter.thisMonth.serverKeyFromFilter, '1');
    } catch (e) {
      AppLogger.e('exception (_initialize): $e', e, className: 'HomeController', methodName: '_initialize()');
    } finally {
      dismiss(Get.context!);
    }
  }
}