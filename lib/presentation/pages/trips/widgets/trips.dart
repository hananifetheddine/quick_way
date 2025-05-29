import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_way/presentation/controllers/home/home.dart';
import 'package:quick_way/presentation/controllers/trips/trips.dart';
import 'package:quick_way/presentation/pages/base_view/fetch_data.dart';
import 'package:quick_way/presentation/pages/home/components/package.dart';
import 'package:sizer/sizer.dart';

class TripsTrips extends GetView<TripsController> {
  const TripsTrips({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => BaseViewGetData(
        downloading: controller.fetching.value,
        failure: controller.failure.value,
        data: controller.trips,
        noDataMessage: "You have no trips",
        child: SizedBox(),
      ),
    );
  }
}
