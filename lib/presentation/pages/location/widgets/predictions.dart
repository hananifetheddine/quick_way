import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_way/presentation/controllers/location/location.dart';
import 'package:sizer/sizer.dart';

import '../../../resources/strings_manager.dart';
import '../../../resources/styles_manager.dart';
import '../../../resources/theme_manager.dart';
import '../components/prediction.dart';


class PredictionsWidget extends GetView<LocationController> {
  const PredictionsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 1.h),
            width: double.infinity,
            color: ThemeManager.softShadowColor,
            child: Center(
              child: Text(AppStrings.resultSearch,
                  style: getSemiBoldStyle(
                      color: ThemeManager.secondaryColor, fontSize: 10.sp)),
            ),
          ),
          SizedBox(height: 1.h),
          GetBuilder(
              init: controller,
              id: "predictions",
              builder: (context) {
                return Expanded(
                  child: ListView.builder(
                    itemBuilder: (_, index) =>
                        predictionComponent(controller.predictions[index]),
                    itemCount: controller.predictions.length,
                  ),
                );
              }),
        ],
      ),
    );
  }
}
