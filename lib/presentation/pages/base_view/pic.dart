import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../components/default_widgets/add_document.dart';

import 'package:photo_view/photo_view.dart';

import '../../resources/strings_manager.dart';
import '../../resources/styles_manager.dart';

class PicViewWidget extends StatelessWidget {
  const PicViewWidget(
      {required this.path,
      required this.tapNoPic,
      super.key,
      required this.tapDeletePic});

  final VoidCallbackRxString tapNoPic;
  final VoidCallbackRxString tapDeletePic;
  final RxString path;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Stack(
        children: [
          PhotoView(
            imageProvider: FileImage(
              File(path.value),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              //margin: EdgeInsets.symmetric(vertical: 2.h),
              padding: EdgeInsets.symmetric(vertical: 2.h),
              width: 100.w,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5.sp)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(width: 7.w),
                  Expanded(
                    child: ListTile(
                      onTap: () {
                        tapNoPic(path);
                      },
                      leading: const Icon(Icons.change_circle_outlined),
                      title: Text(AppStrings.replace),
                    ),
                  ),
                  Expanded(
                    child: ListTile(
                      onTap: () {
                        tapDeletePic(path);
                      },
                      leading: const Icon(
                        Icons.delete_outline_rounded,
                        color: Colors.red,
                      ),
                      title: Text(AppStrings.delete,
                          style: getMediumStyle(
                            color: Colors.red,
                          )),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }
}
