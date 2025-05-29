import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../buttons/simple_button.dart';
import 'bottom_sheet.dart';

Widget pickDate(DateTime date) {
  DateTime dateTime = date;
  return BottomSheetDecoration(
    height: 70.h,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(height: 1.h),
        Expanded(
          child: CupertinoDatePicker(
            initialDateTime: date,
            minimumDate: DateTime.now(),
            maximumDate: DateTime.now().add(Duration(days: 365)),
            use24hFormat: true,
            mode: CupertinoDatePickerMode.dateAndTime,
            onDateTimeChanged: (newDate) => dateTime = newDate,
          ),
        ),
        Padding(
            padding: EdgeInsets.symmetric(vertical: 1.h),
            child: button(
              title: 'Save',
              onTap: () => Get.back(result: dateTime),
            )),
      ],
    ),
  );
}
