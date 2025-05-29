import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../controllers/matches/matches.dart';
import '../../base_view/fetch_data.dart';
import '../components/trip.dart';

class MatchesTrips extends GetView<MatchesController> {
  const MatchesTrips({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Obx(
        () => BaseViewGetData(
          downloading: controller.fetching.value,
          failure: controller.failure.value,
          data: controller.trips,
          noDataMessage: "Y'a pas des voyages",
          showMessageEmpty: controller.showMessageEmpty.value,
          child: ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            itemBuilder: (_, index) =>
                TripMatchComponent(match: controller.trips[index]),
            itemCount: controller.trips.length,
            separatorBuilder: (_, __) => SizedBox(height: 2.h),
          ),
        ),
      ),
    );
  }
}
