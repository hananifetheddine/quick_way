import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_way/presentation/controllers/location/location.dart';
import 'package:sizer/sizer.dart';

import '../../../resources/strings_manager.dart';
import '../../../resources/styles_manager.dart';
import '../../../resources/theme_manager.dart';
import '../components/prediction.dart';

class HistoryWidget extends GetView<LocationController> {
  const HistoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Visibility(
        visible: controller.historySearch.isNotEmpty,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 1.h),
              width: double.infinity,
              color: ThemeManager.softShadowColor,
              child: Center(
                child: Text("Historique",
                    style: getMediumStyle(
                        color: ThemeManager.secondaryColor, fontSize: 10.sp)),
              ),
            ),
            SizedBox(height: 1.h),
            GetBuilder(
                init: controller,
                id: "history",
                builder: (context) {
                  return Expanded(
                    child: ListView.builder(
                      itemBuilder: (_, index) =>
                          predictionComponent(controller.historySearch[index]),
                      itemCount: controller.historySearch.length,
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
