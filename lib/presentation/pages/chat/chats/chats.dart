import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_way/presentation/controllers/chat/chats.dart';
import 'package:quick_way/presentation/pages/chat/chats/widgets/chats.dart';
import 'package:quick_way/presentation/resources/styles_manager.dart';
import 'package:sizer/sizer.dart';

class ChatsView extends GetView<ChatsController> {
  const ChatsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 2.h),
        Text("Conversation", style: getSemiBoldStyle()),
        SizedBox(height: 2.h),
        const ChatsChats(),
      ],
    );
  }
}
