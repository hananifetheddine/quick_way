import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:quick_way/presentation/utils/date.dart';
import 'package:sizer/sizer.dart';

import '../../resources/assets_manager.dart';
import '../../resources/theme_manager.dart';
import '../buttons/simple_button.dart';
import '../default_widgets/bottom_sheet.dart';

class InputDateComponent extends StatelessWidget {
  final TextEditingController controller;
  final String? Function(String?) validate;
  final Function(DateTime) onSelect;
  final String hintText;
  final DateTime lastDate;
  final DateTime firstDate;
  final DateTime initialDate;
  final CupertinoDatePickerMode? mode;

  const InputDateComponent(
      {super.key,
      required this.initialDate,
      required this.firstDate,
      required this.hintText,
      required this.lastDate,
      required this.controller,
      required this.onSelect,
      required this.validate,
      this.mode});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validate,
      onTap: () async {
        DateTime dateTime = initialDate;
        DateTime? res = await Get.bottomSheet(BottomSheetDecoration(
          height: 70.h,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 1.h),
              Expanded(
                child: CupertinoDatePicker(
                  initialDateTime: initialDate,
                  minimumDate: firstDate,
                  maximumDate: lastDate,
                  use24hFormat: true,
                  mode: mode ?? CupertinoDatePickerMode.dateAndTime,
                  onDateTimeChanged: (newDate) => dateTime = newDate,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 1.h),
                child: button(
                  title: 'Save',
                  onTap: () => Get.back(result: dateTime),
                ),
              ),
            ],
          ),
        ));
        if (res != null) {
          onSelect(dateTime);
        }
      },
      readOnly: true,
      decoration: InputDecoration(
          labelText: hintText,
          suffixIcon: SizedBox(
            width: 15.w,
            child: Center(
              child: SvgPicture.asset(IconAssets.calenderIcon,
                  color: ThemeManager.secondaryColor),
            ),
          )),
    );
  }
}
