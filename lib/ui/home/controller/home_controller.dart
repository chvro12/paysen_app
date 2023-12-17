import 'package:get/get.dart';

import '../../../config/app_enums.dart';
import '../../../config/app_logger.dart';
import '../../../config/app_utils.dart';
import '../../dashboard/controller/dashboard_controller.dart';
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
    final DashboardController dashboardController = Get.find();
    if (dashboardController.profileModels.value != null && dashboardController.profileModels.value!.userModels.cardDetail != null) {
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
}