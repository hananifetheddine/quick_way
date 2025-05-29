import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_way/presentation/controllers/matches/matches.dart';
import 'package:quick_way/presentation/pages/base_view/fetch_data.dart';
import 'package:quick_way/presentation/pages/matches/widgets/matches.dart';
import 'package:sizer/sizer.dart';

import '../../components/default_widgets/bottom_sheet.dart';
import '../../components/default_widgets/bottom_sheet_line.dart';

class MatchesView extends StatelessWidget {
  const MatchesView({required this.packageId, super.key});

  final String packageId;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(
        MatchesController(packageId, Get.find(), Get.find(), Get.find()));
    return BottomSheetDecoration(
      height: 90.h,
      child: Column(
        children: [
          SizedBox(height: 2.h),
          bottomSheetLine(),
          SizedBox(height: 2.h),
          const MatchesTrips()
        ],
      ),
    );
  }
}
