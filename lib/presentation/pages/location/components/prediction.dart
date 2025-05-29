import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_way/presentation/controllers/location/location.dart';
import 'package:sizer/sizer.dart';

import '../../../../../domain/entities/map/place/place.dart';
import '../../../components/default_widgets/svg.dart';
import '../../../resources/assets_manager.dart';
import '../../../resources/styles_manager.dart';

Widget predictionComponent(Place place) {
  final controller = Get.find<LocationController>();
  return ListTile(
    onTap: () => controller.selectPlace(place),
    contentPadding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 0),
    visualDensity: const VisualDensity(vertical: -4),
    leading: svgPicture(
      IconAssets.locationIcon,
      height: 13.sp,
    ),
    title: Text(
      place.name,
      style: getRegularStyle(fontSize: 11.sp),
    ),
    subtitle: Text(
      place.formattedAddress,
      maxLines: 1,
      style: getRegularStyle(subTitle: true, fontSize: 10.sp),
    ),
    dense: true,
  );
}
