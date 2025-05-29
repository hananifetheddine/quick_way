import 'package:get/get.dart';
import 'package:quick_way/presentation/controllers/chat/chat.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../resources/strings_manager.dart';
import '../../../base_view/no_data.dart';
import '../components/message.dart';

class MessagesChat extends GetView<ChatController> {
  const MessagesChat({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Obx(
        () => controller.fetching.isTrue
            ? const Center(child: CircularProgressIndicator())
            : controller.messages.isEmpty
                ? Obx(() => Visibility(
                    visible: controller.showNoMessages.isTrue,
                    child: NoDataWidget(message: AppStrings.noMessage)))
                : Align(
                    alignment: Alignment.topCenter,
                    child: ListView.separated(
                      shrinkWrap: true,
                      reverse: true,
                      controller: controller.scrollController,
                      padding:
                          EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
                      itemBuilder: (context, index) =>
                          messageComponent(controller.messages[index]),
                      separatorBuilder: (BuildContext context, int index) =>
                          SizedBox(height: 1.h),
                      itemCount: controller.messages.length,
                    ),
                  ),
      ),
    );
  }
}
