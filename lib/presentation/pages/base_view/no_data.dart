import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

import '../../resources/assets_manager.dart';
import '../../resources/styles_manager.dart';

class NoDataWidget extends StatelessWidget {
  const NoDataWidget({super.key, required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Lottie.asset(AnimationAssets.noDataAnimation, height: 150.sp),
          SizedBox(height: 2.h),
          Text(
            message,
            style: getSemiBoldStyle(subTitle: true),
          )
        ],
      ),
    );
  }
}
