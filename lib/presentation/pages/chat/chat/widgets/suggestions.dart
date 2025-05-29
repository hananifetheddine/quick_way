import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_way/presentation/controllers/chat/chat.dart';
import 'package:sizer/sizer.dart';

import '../components/suggestion.dart';

class ChatSuggestions extends GetView<ChatController> {
  const ChatSuggestions({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 9.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
        itemBuilder: (_, index) {
          String suggest = messagesSuggestions[index];
          return InkWell(
              onTap: () => controller.suggest(suggest),
              child: messageSuggestion(suggest));
        },
        separatorBuilder: (_, __) => SizedBox(width: 4.w),
        itemCount: messagesSuggestions.length,
      ),
    );
  }
}

List<String> messagesSuggestions = <String>[
  "Bonjour",
  "Bonsoir",
  "J'ai un colis",
  "On peut retarder"
];
