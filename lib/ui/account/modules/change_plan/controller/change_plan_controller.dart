import 'package:get/get.dart';

import '../../../../../config/app_logger.dart';
import '../../../../../config/app_utils.dart';
import '../../../../../main.dart';
import '../../../models/user_plan_models.dart';
import '../../../repository/account_repo.dart';

class ChangePlanController extends GetxController with ProgressHUDMixin {

  final AccountRepo _accountRepo = AccountRepo();
  final Rxn<MainUserPlanModels> userPlanModels = Rxn();
  final Rxn<UserPlanModels> selectedUserPlanModels = Rxn();

  @override
  void onInit() {
    super.onInit();
    _initialize();
  }

  void onUserPlanChanged(UserPlanModels val) {
    selectedUserPlanModels.value = val;
  }

  Future<void> sendChangePlan() async {

    if (selectedUserPlanModels.value == null) return; 

    show(Get.context!);

    try {

      String planId = selectedUserPlanModels.value!.id.toString();

      final profileModels = await _accountRepo.postChangePlan(planId);
      if (profileModels != null) {
        if (profileModels.isSuccess) {
          ToastUtils.showToast(profileModels.message);
          Get.delete<ChangePlanController>();
          accountNavigatorKey.currentState?.pop();
        }
      }

    } catch (e) {
      AppLogger.e('exception: $e', e, className: 'ChangePlanController', methodName: 'sendChangePlan()');
    } finally {
      dismiss(Get.context!);
    }
  }

  Future<void> _initialize() async {

    show(Get.context!);

    try {
      userPlanModels.value = await _accountRepo.fetchPlanList();
      if (userPlanModels.value != null) {
        if (userPlanModels.value!.isSuccess && userPlanModels.value!.data.isNotEmpty) {
          selectedUserPlanModels.value = userPlanModels.value!.data.first;
        }
      }
    } catch (e) {
      AppLogger.e('exception: $e', e, className: 'ChangePlanController', methodName: '_initialize()');
    } finally {
      dismiss(Get.context!);
    }
  }
}