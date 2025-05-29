import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../resources/styles_manager.dart';
import '../../resources/theme_manager.dart';
import '../default_widgets/svg.dart';

class DefaultInput extends StatelessWidget {
  final String hintText;
  final String? label;
  final TextEditingController? controller;
  final String? Function(String?)? validate;
  final Function()? tap;
  final Function(String)? change;
  final int maxLines;
  final bool readOnly;
  final bool labelShow;
  final String icon;
  final FocusNode? focusNode;
  final bool autoFocus;

  const DefaultInput(
      {super.key,
      this.focusNode,
      this.autoFocus = false,
      this.tap,
      this.label,
      this.change,
      this.labelShow = true,
      this.controller,
      required this.hintText,
      this.validate,
      this.maxLines = 1,
      this.readOnly = false,
      this.icon = ""});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: autoFocus,
      onTap: tap,
      readOnly: readOnly,
      maxLines: maxLines,
      focusNode: focusNode,
      onChanged: (String? value) => change?.call(value?.trim() ?? ""),
      validator: (String? value) => validate?.call(value?.trim() ?? ""),
      controller: controller,
      style: getRegularStyle(),
      decoration: InputDecoration(
        suffixIcon: icon.isNotEmpty
            ? Row(mainAxisSize: MainAxisSize.min, children: [
                SizedBox(width: 7.w),
                svgPicture(
                  icon,
                  oppositeColor: false,
                  color: ThemeManager.secondaryColor,
                ),
                SizedBox(width: 6.w),
              ])
            : null,
        prefixIconConstraints: BoxConstraints(maxHeight: 24.h, maxWidth: 70.w),
        hintText: hintText,
        labelText: label,
      ),
    );
  }
}
