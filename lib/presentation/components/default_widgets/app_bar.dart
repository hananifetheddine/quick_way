import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

appBarModel({required String title, List<Widget>? actions}) => AppBar(
      leading: InkWell(
          onTap: () => Get.back(),
          child: Icon(
            Icons.arrow_back_rounded,
            size: 15.sp,
          )),
      title: Text(
        title,
        style: TextStyle(fontSize: 13.sp),
      ),
      actions: [
        ...actions ?? [],
        SizedBox(
          width: 4.w,
        )
      ],
    );
