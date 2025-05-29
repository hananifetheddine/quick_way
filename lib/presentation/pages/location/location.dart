import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_way/presentation/components/default_widgets/app_bar.dart';
import 'package:quick_way/presentation/components/text_fields/default_text_field.dart';
import 'package:quick_way/presentation/pages/location/widgets/history.dart';
import 'package:quick_way/presentation/pages/location/widgets/predictions.dart';
import 'package:quick_way/presentation/resources/theme_manager.dart';
import 'package:sizer/sizer.dart';

import '../../controllers/location/location.dart';
import '../../resources/assets_manager.dart';
import '../../utils/enums.dart';

class LocationView extends GetView<LocationController> {
  const LocationView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: appBarModel(title: "Localisation"),
        body: Column(
          children: [
            SizedBox(height: 1.h),
            DefaultInput(
              hintText: "Recherche",
              controller: controller.searchController,
              change: controller.onChangeInputLocations,
              icon: IconAssets.targetIcon,
              autoFocus: true,
            ).paddingSymmetric(horizontal: 4.w),
            SizedBox(height: 2.h),
            Obx(
              () => Visibility(
                visible: controller.fetching.value,
                replacement: SizedBox(height: 0.6.h),
                child: LinearProgressIndicator(
                  minHeight: 0.6.h,
                  color: ThemeManager.primaryColor,
                  backgroundColor: Colors.transparent,
                ),
              ),
            ),
            Obx(
              () => controller.currentSource.value == PredictionSource.api
                  ? const PredictionsWidget() // in search
                  : const HistoryWidget(), // before searching
            ),
          ],
        ),
      ),
    );
  }
}
