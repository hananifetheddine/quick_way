import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_way/presentation/components/default_widgets/app_bar.dart';
import 'package:quick_way/presentation/controllers/chat/chat.dart';
import 'package:quick_way/presentation/pages/chat/chat/widgets/messages.dart';
import 'package:quick_way/presentation/pages/chat/chat/widgets/suggestions.dart';
import 'package:sizer/sizer.dart';

import '../../../components/text_fields/text_field_chat.dart';
import '../../../resources/strings_manager.dart';
import '../../base_view/no_data.dart';
import 'components/message.dart';

class ChatView extends GetView<ChatController> {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: appBarModel(title: "Conversation"),
      body: Column(
        children: [
          const MessagesChat(),
          const ChatSuggestions(),
          InputChat(
            textEditingController: controller.messageController,
            function: controller.sendMessage,
            focusNode: controller.node,
          ).paddingSymmetric(vertical: 2.h, horizontal: 3.w),
        ],
      ),
    ));
  }
}
