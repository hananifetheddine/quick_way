import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../resources/styles_manager.dart';
import '../../resources/theme_manager.dart';

class InputChat extends StatelessWidget {
  final TextEditingController textEditingController;
  final VoidCallback function;
  final FocusNode focusNode;
  const InputChat(
      {super.key,
      required this.textEditingController,
      required this.function,
      required this.focusNode});

  @override
  Widget build(BuildContext context) {
    return TextField(
      focusNode: focusNode,
      controller: textEditingController,
      style: getRegularStyle(),
      decoration: InputDecoration(
        suffixIcon: InkWell(
            onTap: function,
            child: Icon(Icons.send, color: ThemeManager.primaryColor)),
        contentPadding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 2.h),
        hintText: "Message",
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent, width: 1.sp)),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent, width: 1.sp)),
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent, width: 0.5.sp)),
        focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent, width: 0.5.sp)),
        fillColor: ThemeManager.softShadowColor,
        filled: true,
      ),
    );
  }
}
