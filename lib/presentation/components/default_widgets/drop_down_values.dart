import 'package:flutter/material.dart';

Widget dropDownMinutes(value, onChanged) {
  return DropdownButtonHideUnderline(
    child: DropdownButton<int>(
      padding: EdgeInsets.zero,
      icon: Icon(Icons.keyboard_arrow_down_rounded),
      value: value,
      items: [5, 10, 15, 20, 30, 45, 60].map((int value) {
        return DropdownMenuItem<int>(
          value: value,
          child: Text("$value min"),
        );
      }).toList(),
      onChanged: onChanged,
    ),
  );
}
