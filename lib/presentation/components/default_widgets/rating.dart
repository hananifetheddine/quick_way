import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:sizer/sizer.dart';

Widget ratingBar(
    {double? initialRating,
    VoidCallback? onRatingUpdate,
    double? itemSize,
    ignoreGestures = true}) {
  return RatingBar.builder(
    minRating: 0,
    itemSize: itemSize ?? 30.sp,
    initialRating: initialRating ?? 0,
    direction: Axis.horizontal,
    ignoreGestures: ignoreGestures,
    itemCount: 5,
    unratedColor: Colors.grey.withOpacity(0.4),
    onRatingUpdate: (value) {
      onRatingUpdate?.call();
    },
    itemBuilder: (context, _) => Icon(
      Icons.star_rounded,
      color: Colors.amber,
      size: 11.sp,
    ),
  );
}
