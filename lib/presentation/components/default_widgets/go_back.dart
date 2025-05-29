import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils.dart';

Widget goBack({Alignment alignment = Alignment.centerLeft}) {
  return Align(
    alignment: alignment,
    child: IconButton(
      onPressed: () => Get.back(),
      icon: iconCircle(size: 15),
      style: IconButton.styleFrom(elevation: 0, padding: EdgeInsets.zero),
    ),
  );
  return Align(
      alignment: Alignment.centerLeft,
      child: InkWell(onTap: () => Get.back(), child: iconCircle()));
}
