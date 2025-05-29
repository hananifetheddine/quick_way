import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../resources/assets_manager.dart';
import '../../resources/styles_manager.dart';
import '../default_widgets/svg.dart';

class InputDropDown<T> extends StatelessWidget {
  const InputDropDown(
      {super.key,
      required this.values,
      required this.onChanged,
      required this.hint,
      required this.value});

  final List<T> values;
  final Rx<T> value;
  final String hint;
  final void Function(T? value) onChanged;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => DropdownButtonFormField<T>(
        decoration: InputDecoration(
          labelStyle: getMediumStyle(),
          labelText: hint,
          contentPadding:
              EdgeInsets.only(top: 2.2.h, bottom: 2.2.h, left: 7.w, right: 6.w),
        ),
        icon: svgPicture(
          IconAssets.arrowDropDownIcon,
          height: 5.sp,
        ),
        padding: EdgeInsets.zero,
        value: value.value,
        items: values
            .map((item) => DropdownMenuItem<T>(
                value: item, child: Text(item.toString().tr)))
            .toList(),
        onChanged: onChanged,
        isExpanded: true,
      ),
    );
  }
}
