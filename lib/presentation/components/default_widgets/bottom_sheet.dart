import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class BottomSheetDecoration extends StatelessWidget {
  const BottomSheetDecoration(
      {required this.child, this.height, this.padding = false, super.key});

  final Widget child;
  final double? height;
  final bool padding;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: double.infinity,
      child: Card(
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12.sp),
                topRight: Radius.circular(12.sp))),
        child: Padding(
            padding: padding
                ? EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h)
                : EdgeInsets.zero,
            child: child),
      ),
    );
  }
}
