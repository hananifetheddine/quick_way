import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../resources/styles_manager.dart';
import '../../resources/theme_manager.dart';
import '../../resources/values_manager.dart';

class LocationInput extends StatelessWidget {
  final String hintText;
  final String? label;
  final TextEditingController? controller;
  final String? Function(String?)? validate;
  final Function()? tap;
  final Function(String)? change;
  final int maxLines;
  final bool readOnly;
  final bool labelShow;
  final String? prefixIcon;
  final String? suffixIcon;
  final FocusNode? focusNode;
  final bool autofocus;
  final Color? labelColor;
  final Color? suffixColor;
  final Color? fillColor;
  final Color? prefixColor;

  const LocationInput(
      {super.key,
      this.focusNode,
      this.autofocus = false,
      this.tap,
      this.fillColor,
      this.label,
      this.change,
      this.labelColor,
      this.labelShow = true,
      this.controller,
      required this.hintText,
      this.suffixColor,
      this.validate,
      this.prefixColor,
      this.maxLines = 1,
      this.readOnly = false,
      this.suffixIcon,
      this.prefixIcon});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.borderInput)),
      child: TextFormField(
        autofocus: autofocus,
        onTap: tap,
        readOnly: readOnly,
        onChanged: change,
        maxLines: maxLines,
        focusNode: focusNode,
        validator: validate,
        controller: controller,
        style: getRegularStyle(fontSize: 10.sp),
        decoration: InputDecoration(
          prefixIcon: prefixIcon == null
              ? null
              : SvgPicture.asset(
                  prefixIcon!,
                  color: prefixColor ?? ThemeManager.oppositeColor,
                ).paddingSymmetric(horizontal: 5.w),
          suffixIcon: suffixIcon != null
              ? suffixIcon!.isNotEmpty
                  ? SizedBox(
                      width: 10.w,
                      child: Center(
                        child: SvgPicture.asset(
                          suffixIcon!,
                          color: suffixColor ?? ThemeManager.oppositeColor,
                        ),
                      ),
                    )
                  : Icon(
                      Icons.arrow_forward_ios,
                      size: 12.sp,
                      color: Colors.white,
                    ).paddingSymmetric(horizontal: 4.w)
              : null,
          contentPadding:
              EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.5.h),
          prefixIconConstraints: BoxConstraints(maxHeight: 15.sp),
          suffixIconConstraints: BoxConstraints(maxHeight: 15.sp),
          labelText: hintText,
          fillColor: fillColor,
          labelStyle: getRegularStyle(
              fontSize: 10.sp,
              color: labelColor ?? ThemeManager.secondaryColor),
        ),
      ),
    );
  }
}
