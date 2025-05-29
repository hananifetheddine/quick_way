import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_way/presentation/components/default_widgets/svg.dart';
import 'package:quick_way/presentation/resources/assets_manager.dart';
import 'package:sizer/sizer.dart';

import '../../../domain/entities/map/place/place.dart';
import '../../resources/styles_manager.dart';
import '../../resources/theme_manager.dart';
import '../../utils/enums.dart';

itineraryPoint(Color color, {int size = 9}) {
  return Container(
    height: size.sp,
    width: size.sp,
    decoration: BoxDecoration(
        color: ThemeManager.backgroundColor,
        shape: BoxShape.circle,
        border: Border.all(
          color: color,
          width: 1.8.sp,
        )),
    /* child: Center(
      child: Container(
        margin: EdgeInsets.all(2.sp),
        height: (size - 5).sp,
        width: (size - 5).sp,
        decoration: BoxDecoration(shape: BoxShape.circle, color: color),
      ),
    ),*/
  );
}

Widget itineraryIcons(LocationType itineraryLocation, Place place,
    {double? titleSize,
    double? formattedAddressSize,
    VisualDensity? visualDensity,
    bool listTile = true,
    bool showIcons = false}) {
  return Visibility(
    visible: listTile,
    replacement: Row(
      children: [
        itineraryLocation == LocationType.to
            ? svgPicture(IconAssets.placeIcon, height: 13.sp)
            : Container(
                height: 10.sp,
                width: 10.sp,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: ThemeManager.backgroundColor,
                  border: Border.all(
                      width: 2.5.sp,
                      color: itineraryLocation == LocationType.to
                          ? ThemeManager.secondaryColor
                          : ThemeManager.primaryColor),
                ),
              ),
        SizedBox(width: 4.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              place.name,
              style: getSemiBoldStyle(fontSize: titleSize ?? 11.sp),
            ),
            Text(
              place.formattedAddress,
              style: getLightStyle(
                  fontSize: formattedAddressSize ?? 8.sp, subTitle: true),
            ),
          ],
        )
      ],
    ).paddingSymmetric(horizontal: 5.w),
    child: ListTile(
      contentPadding: EdgeInsets.zero,
      visualDensity: visualDensity,
      leading: showIcons
          ? Container(
              height: 10.sp,
              width: 10.sp,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: ThemeManager.backgroundColor,
                border: Border.all(
                    width: 2.5.sp,
                    color: itineraryLocation == LocationType.to
                        ? ThemeManager.secondaryColor
                        : ThemeManager.primaryColor),
              ),
            )
          : null,
      title: Text(
        place.name,
        style: getSemiBoldStyle(fontSize: titleSize ?? 11.sp),
      ),
      subtitle: Text(
        place.formattedAddress,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: getLightStyle(
            fontSize: formattedAddressSize ?? 8.sp, subTitle: true),
      ),
    ),
  );
  return Row(
    children: [
      Container(
        height: 10.sp,
        width: 10.sp,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: ThemeManager.backgroundColor,
          border: Border.all(
              width: 2.5.sp,
              color: itineraryLocation == LocationType.to
                  ? ThemeManager.secondaryColor
                  : ThemeManager.primaryColor),
        ),
      ),
      SizedBox(width: 4.w),
      Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            place.name,
            style: getSemiBoldStyle(fontSize: 10.sp),
          ),
          Text(
            place.formattedAddress,
            style: getMediumStyle(fontSize: 8.sp, subTitle: true),
          ),
        ],
      )
    ],
  );
}
