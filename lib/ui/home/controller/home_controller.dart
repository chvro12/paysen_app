import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../config/app_enums.dart';
import '../../../config/app_logger.dart';
import '../../../config/app_routes.dart';
import '../../../config/app_utils.dart';
import '../../dashboard/controller/dashboard_controller.dart';
import '../../dashboard/models/card_models.dart';
import '../../dashboard/repository/dashboard_repo.dart';
import '../models/transaction_models.dart';
import '../repository/transaction_repo.dart';

class HomeController extends GetxController with ProgressHUDMixin {

  Rxn<MainTransactionModel> mainTransactionModel = Rxn(null);
  Rxn<CardModels> cardModels = Rxn();

  void onTransactionSelect(TransactionModel value, BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.transactionDetail, arguments: value.clientTransactionReference);
  }

  Future<void> fetchUserTransaction() async {
    _initialize();
  }

  Future<void> _initialize() async {
    final TransactionRepo transactionRepo = TransactionRepo();
    final DashboardController dashboardController = Get.find();
    if (dashboardController.profileModels.value != null && dashboardController.profileModels.value!.userModels.cardDetail != null) {
      show(Get.context!);

      try {
        mainTransactionModel.value = await transactionRepo.fetchCardTransaction(TransactionFilter.thisMonth.serverKeyFromFilter, '1');
        await _fetchCardBalance();
      } catch (e) {
        AppLogger.e('exception (_initialize): $e', e, className: 'HomeController', methodName: '_initialize()');
      } finally {
        dismiss(Get.context!);
      }
    }
  }

  Future<void> _fetchCardBalance() async {

    show(Get.context!);

    try {

      final DashboardRepo dashboardRepo = DashboardRepo();

      final mainCardModels = await dashboardRepo.cardBalance();
      if (mainCardModels != null) {
        if (mainCardModels.isSuccess) {
          cardModels.value = mainCardModels.cardModels;
        }
      }

    } catch (e) {
      AppLogger.e('exception: $e', e, className: 'DashboardController', methodName: '_fetchCardBalance(');
    } finally {
      dismiss(Get.context!);
    }
  }
}