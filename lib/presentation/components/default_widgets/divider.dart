import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../resources/color_manager.dart';

Widget dividerModel() {
  return Divider(
    height: 0,
    indent: 5.w,
    endIndent: 5.w,
    color: Colors.grey.withOpacity(0.3),
  );
}
