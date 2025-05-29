import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../resources/assets_manager.dart';

class InputPhoneNumberAuth extends StatelessWidget {
  final TextEditingController? textEditingController;
  final bool readOnly;
  final Function(String?)? change;
  final Function()? tap;
  final FocusNode? focusNode;

  const InputPhoneNumberAuth({
    super.key,
    this.readOnly = false,
    this.textEditingController,
    this.change,
    this.tap,
    this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      elevation: 0,
      child: TextField(
        onTap: tap,
        onChanged: change,
        focusNode: focusNode,
        cursorColor: Colors.green,
        controller: textEditingController,
        keyboardType: TextInputType.number,
        readOnly: readOnly,
        autofocus: false,
        decoration: InputDecoration(
          prefixIconConstraints:
              BoxConstraints(maxHeight: 24.h, maxWidth: 70.w),
          suffixIconConstraints: BoxConstraints(
            maxHeight: 12.sp,
            maxWidth: 50.w,
          ),
          prefixIcon: Row(mainAxisSize: MainAxisSize.min, children: [
            SizedBox(width: 5.5.w),
            Text("+33", style: TextStyle(fontSize: 12.sp)),
            SizedBox(width: 3.w),
          ]),
          suffixIcon: Row(mainAxisSize: MainAxisSize.min, children: [
            SvgPicture.asset(
              IconAssets.flagIcon,
              height: 15.sp,
            ),
            SizedBox(width: 3.w),
          ]),
          hintText: "Numéro de téléphone",
        ),
      ),
    );
  }
}

/*focusedBorder: OutlineInputBorder(
borderSide:
BorderSide(color: Colors.black.withOpacity(0.3), width: 1.3.sp),
borderRadius: BorderRadius.circular(5.sp),
),
errorBorder: OutlineInputBorder(
borderSide: BorderSide(color: Colors.red),
borderRadius: BorderRadius.circular(5.sp),
),
focusedErrorBorder: OutlineInputBorder(
borderSide: const BorderSide(color: Colors.red),
borderRadius: BorderRadius.circular(5.sp),
),
enabledBorder: OutlineInputBorder(
borderSide: BorderSide(color: Colors.black.withOpacity(0.3)),
borderRadius: BorderRadius.circular(5.sp),
),*/
