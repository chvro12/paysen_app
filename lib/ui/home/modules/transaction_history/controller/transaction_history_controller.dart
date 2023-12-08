import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../config/app_enums.dart';
import '../../../../../config/app_logger.dart';
import '../../../../../config/app_routes.dart';
import '../../../../../config/app_utils.dart';
import '../../../models/transaction_models.dart';
import '../../../repository/transaction_repo.dart';
import '../../transaction_details/controller/transaction_detail_controller.dart';

class TransactionHistoryController extends GetxController with GetSingleTickerProviderStateMixin, ProgressHUDMixin {

  final ScrollController scrollController = ScrollController();

  final TransactionRepo _transactionRepo = TransactionRepo();
  
  late TabController transactionTabController;

  List<String> transactionHistoryTab = [ 'All', 'Out', 'In' ];
  
  List<TransactionFilter> transactionHistoryFilter = [
    TransactionFilter.today, 
    TransactionFilter.yesterday, 
    TransactionFilter.thisMonth, 
    TransactionFilter.custom
  ];

  Rxn<MainTransactionModel> mainTransactionModel = Rxn(null);
  MainTransactionModel? _mainTransactionModel;

  bool showPaginationLoader = true;
  final RxBool _fetchingNewData = false.obs;

  RxInt selectedTab = RxInt(0);
  int get limit => 20;
  int page = 1;
  Rx<TransactionFilter> selectedTransactionHistoryFilter = Rx(TransactionFilter.today);
  RxString fromDate = RxString('');
  RxString toDate = RxString('');

  String get _currentScreenDateFormat => 'MMMM dd, yyyy';

  @override
  void onInit() {
    transactionTabController = TabController(length: 3, vsync: this);
    fromDate.value = DateTime.now().humanReadableFormat(_currentScreenDateFormat);
    toDate.value = fromDate.value;
    scrollController.addListener(_onScrollListener);
    _initialize();
    super.onInit();
  }

  @override
  void onClose() {
    transactionTabController.dispose();
    scrollController.removeListener(_onScrollListener);
    scrollController.dispose();
    super.onClose();
  }

  void onTransactionSelect(TransactionModel value, BuildContext context) {
    Get.delete<TransactionDetailController>();
    Navigator.pushNamed(context, AppRoutes.transactionDetail, arguments: value.clientTransactionReference);
  }

  void _onScrollListener() {
    if (!showPaginationLoader) return;
    final maxOffset = scrollController.position.maxScrollExtent;
    final currentOffset = scrollController.offset;
    if (currentOffset >= maxOffset) {
      if (!_fetchingNewData.value) {
        _initialize(showOverlayLoader: false);
      }
    }
  }

  void onTabChanged(int value) {
    selectedTab.value = value;
    transactionTabController.animateTo(value);
    if (mainTransactionModel.value != null && _mainTransactionModel != null) {
      final val = _mainTransactionModel!.copyWith(
        userTransactionList: _mainTransactionModel!.userTransactionList.where((element) {
          if (selectedTab.value == 1) {
            return element.cardTransactionType == TransactionType.debit;
          } else if (selectedTab.value == 2) {
            return element.cardTransactionType == TransactionType.credit;
          }
          return true;
        }).toList()
      );
      mainTransactionModel.value = val;
    }
  }

  void onChangedTransactionHistoryFilter(TransactionFilter value) {
    selectedTransactionHistoryFilter.value = value;
    mainTransactionModel.value = null;
    _mainTransactionModel = null;
    _initialize();
  }

  Future<void> onFromDateSelect(BuildContext context) async {
    final dateTime = await _datePicker(context);
    if (dateTime != null) {
      fromDate.value = dateTime.humanReadableFormat(_currentScreenDateFormat);
      final tempToDate = toDate.value.tryParseWithDateFormat('MMMM dd, yyyy');
      if (tempToDate != null && tempToDate.isAfter(dateTime)) {
        mainTransactionModel.value = null;
        _mainTransactionModel = null;
        _initialize();
      }
    }
  }

  Future<void> onToDateSelect(BuildContext context) async {
    final dateTime = await _datePicker(context);
    if (dateTime != null) {
      toDate.value = dateTime.humanReadableFormat(_currentScreenDateFormat);
      final tempFromDate = fromDate.value.tryParseWithDateFormat('MMMM dd, yyyy');
      if (tempFromDate != null && tempFromDate.isBefore(dateTime)) {
        mainTransactionModel.value = null;
        _mainTransactionModel = null;
        _initialize();
      }
    }
  }

  Future<DateTime?> _datePicker(BuildContext context) async {
    return await showDatePicker(
      context: context, 
      initialDate: DateTime.now(), 
      firstDate: DateTime(1900), 
      lastDate: DateTime(DateTime.now().year + 1, DateTime.now().month + 1)
    );
  }

  Future<void> _initialize({bool showOverlayLoader = true}) async {
    if (showOverlayLoader) {
      show(Get.context!);
    }
    
    try {

      _fetchingNewData.value = true;
      _fetchingNewData.refresh();

      String? tempFromDate = fromDate.value.parseWithDateFormat('MMMM dd, yyyy', 'yyyy-MM-dd HH:mm:ss'),
              tempToDate = toDate.value.parseWithDateFormat('MMMM dd, yyyy', 'yyyy-MM-dd HH:mm:ss');
      
      if (selectedTransactionHistoryFilter.value != TransactionFilter.custom) {
        tempFromDate = null;
        tempToDate = null;
      }

      final value = await _transactionRepo.fetchCardTransaction(selectedTransactionHistoryFilter.value.serverKeyFromFilter, page.toString(), endDate: tempToDate, startDate: tempFromDate);

      if (value != null) {

        showPaginationLoader = value.userTransactionList.length >= limit;
        
        if (mainTransactionModel.value != null && _mainTransactionModel != null) {
          mainTransactionModel.value!.userTransactionList.addAll(value.userTransactionList);
        }

        if (mainTransactionModel.value == null && _mainTransactionModel == null) {
          mainTransactionModel.value = value;
        }
        mainTransactionModel.refresh();
        _mainTransactionModel = mainTransactionModel.value;
        page++;
      }

    } catch (e) {
      AppLogger.e('exception (_initialize): $e', e, className: 'HomeController', methodName: '_initialize()');
    } finally {
      if (showOverlayLoader) {
        dismiss(Get.context!);
      }
      _fetchingNewData.value = false;
      _fetchingNewData.refresh();
    }
  }
}