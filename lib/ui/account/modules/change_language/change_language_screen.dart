import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../components/index.dart';
import '../../../../config/app_colors.dart';
import '../../controller/account_controller.dart';
import '../../models/language_models.dart';
import 'components/change_language_item_view.dart';

class ChangeLanguageScreen extends StatelessWidget {

  const ChangeLanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AccountController accountController = Get.find();
    return Container(
      color: AppColors.whiteColor,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [

          const CustomHeader(
            headerLabel: 'select_lanuguage',
            showBackButton: true,
          ),

          Obx(() => accountController.mainLanguageModels.value == null || accountController.mainLanguageModels.value!.data.isEmpty
          ? const SizedBox.shrink()
          : Flexible(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [

                Expanded(
                  child: CustomListviewBuilder<LanguageModels>(
                    listOfItems: accountController.mainLanguageModels.value!.data,
                    padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 24.h),
                    customListItemBuilder: (context, index, val) {
                      return Obx(() => ChangeLanguageItemView(
                        isSelected: accountController.selectedLanguageModels.value != null && accountController.selectedLanguageModels.value == val,
                        languageModels: val,
                        onLanguageChanged: () => accountController.onLanguageChanged(val),
                      ));
                    },
                  ),
                ),

                Container(
                  height: 0.07.sh,
                  width: 1.sw,
                  margin: EdgeInsets.symmetric(horizontal: 12.w),
                  child: CustomElevatedButton(
                    btnLabel: 'subscribe',
                    onBtnPressed: accountController.sendChangeLanguage,
                  ),
                ),

                SizedBox(height: 120.h,),

              ],
            ),
          )),

        ],
      ),
    );
  }
}