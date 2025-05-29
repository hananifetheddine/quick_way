import 'package:flutter/material.dart';
import 'package:quick_way/presentation/utils/date.dart';
import 'package:sizer/sizer.dart';

import '../../../../../domain/entities/chat/message.dart';
import '../../../../resources/theme_manager.dart';
import '../../../../utils/enums.dart';

Widget messageComponent(Message message) {
  String date = message.date.toStringHM();
  bool showDate = false;
  bool isClient = message.sender == MessageChatSender.client;
  return Align(
    alignment: isClient ? Alignment.topRight : Alignment.topLeft,
    child: StatefulBuilder(builder: (context, StateSetter setState) {
      return SizedBox(
        width: 70.w,
        child: Column(
          crossAxisAlignment:
              isClient ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                setState(() => showDate = !showDate);
              },
              child: Card(
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.sp),
                    side: BorderSide(
                        color: isClient
                            ? Colors.transparent
                            : ThemeManager.oppositeColor)),
                margin: EdgeInsets.zero,
                color:
                    isClient ? ThemeManager.primaryColor : Colors.transparent,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
                  child: Text(
                    message.content,
                    style: TextStyle(
                        color: isClient
                            ? Colors.white
                            : ThemeManager.oppositeColor),
                  ),
                ),
              ),
            ),
            AnimatedCrossFade(
              duration: const Duration(milliseconds: 200),
              firstChild: Text(date),
              secondChild: const SizedBox(),
              crossFadeState: showDate
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
            ),
          ],
        ),
      );
    }),
  );
}
