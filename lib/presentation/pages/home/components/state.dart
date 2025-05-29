import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_way/presentation/components/decoration/card.dart';
import 'package:quick_way/presentation/resources/styles_manager.dart';
import 'package:quick_way/presentation/utils/enums.dart';
import 'package:sizer/sizer.dart';

Widget matchStateComponent(String number, MatchState state) {
  return SizedBox(
    child: radiusCard(
      radius: 5,
      color: state.color,
      child: Row(
        children: [
          Icon(
            state.icon,
            color: Colors.white,
          ),
          SizedBox(width: 3.w),
          Text(
            number,
            style: getSemiBoldStyle(color: Colors.white),
          )
        ],
      ).paddingSymmetric(horizontal: 3.w, vertical: 0.7.h),
    ),
  );
}
