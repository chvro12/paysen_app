import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../components/index.dart';
import '../../../../config/app_colors.dart';
import '../../models/language_models.dart';
import 'components/change_language_item_view.dart';
import 'controller/change_language_controller.dart';

class ChangeLanguageScreen extends StatelessWidget {

  const ChangeLanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final changeLanguageController = Get.put(ChangeLanguageControler());
    return Container(
      color: AppColors.whiteColor,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [

          const CustomHeader(
            headerLabel: 'select_lanuguage',
            showBackButton: true,
          ),

          Obx(() => changeLanguageController.mainLanguageModels.value == null || changeLanguageController.mainLanguageModels.value!.data.isEmpty
          ? const SizedBox.shrink()
          : Flexible(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [

                Expanded(
                  child: CustomListviewBuilder<LanguageModels>(
                    listOfItems: changeLanguageController.mainLanguageModels.value!.data,
                    padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 24.h),
                    customListItemBuilder: (context, index, val) {
                      return Obx(() => ChangeLanguageItemView(
                        isSelected: changeLanguageController.selectedLanguageModels.value != null && changeLanguageController.selectedLanguageModels.value == val,
                        languageModels: val,
                        onLanguageChanged: () => changeLanguageController.onLanguageChanged(val),
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
                    onBtnPressed: changeLanguageController.sendChangeLanguage,
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