import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sizer/sizer.dart';

import '../../resources/theme_manager.dart';

Widget loadingIndicator({bool splash = false}) {
  return SizedBox(
      height: 35.sp,
      width: 35.sp,
      child: const CircularProgressIndicator(
          color: Colors.white, backgroundColor: Colors.black12));
  return SpinKitFadingCube(
    itemBuilder: (BuildContext context, int index) {
      return DecoratedBox(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: index.isEven
              ? splash
                  ? Colors.white
                  : ThemeManager.primaryColor
              : Colors.red,
        ),
      );
    },
  );
}
