import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../app/constants.dart';
import '../../resources/assets_manager.dart';

Widget roundedPic(
    {required String url,
    required double size,
    Color? color,
    bool addPath = true}) {
  return SizedBox(
      height: size.sp,
      width: size.sp,
      child: ClipOval(
          child: cachedNetworkModel(url: url, color: color, addPath: addPath)));
}

Widget radiusPic(
    {required String url,
    Color? color,
    required int border,
    double? width,
    double? height,
    bool addPath = true}) {
  return SizedBox(
    width: width ?? double.infinity,
    height: height,
    child: ClipRRect(
        borderRadius: BorderRadius.circular(border.sp),
        child: cachedNetworkModel(url: url, color: color, addPath: addPath)),
  );
}

Widget cachedNetworkModel(
    {required String url, Color? color, bool addPath = true}) {
  var allPathUrl = addPath ? Constants.imageUrl(url) : url;
  return CachedNetworkImage(
      imageUrl: allPathUrl,
      fit: BoxFit.cover,
      progressIndicatorBuilder: (context, url, downloadProgress) =>
          SvgPicture.asset(
            LogoAssets.svgLogo,
            fit: BoxFit.contain,
            height: 20.sp,
          ).paddingAll(40.sp),
      errorWidget: (context, url, error) {
        return SvgPicture.asset(
          LogoAssets.svgLogo,
          fit: BoxFit.contain,
        );
      });
}
