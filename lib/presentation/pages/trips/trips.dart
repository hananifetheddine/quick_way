import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_way/presentation/pages/trips/widgets/trips.dart';
import 'package:sizer/sizer.dart';

import '../../controllers/trips/trips.dart';

class TripsView extends GetView<TripsController> {
  const TripsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 2.h),
        Text("Trips"),
        SizedBox(height: 1.h),
        Expanded(child: TripsTrips()),
      ],
    );
  }
}
