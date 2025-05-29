import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_way/presentation/controllers/chat/chats.dart';
import 'package:quick_way/presentation/pages/base_view/fetch_data.dart';
import 'package:sizer/sizer.dart';

import '../components/chat.dart';

class ChatsChats extends GetView<ChatsController> {
  const ChatsChats({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Obx(
        () => BaseViewGetData(
          downloading: controller.fetching.value,
          failure: controller.failure.value,
          data: controller.chats,
          refreshing: controller.refreshing.value,
          noDataMessage: "Vous n'avez pas des conversations",
          child: RefreshIndicator(
            onRefresh: controller.refreshData,
            child: ListView.separated(
              physics: const AlwaysScrollableScrollPhysics(),
              itemBuilder: (_, index) =>
                  ChatChatsComponent(chat: controller.chats[index]),
              separatorBuilder: (_, __) => SizedBox(height: 2.h),
              itemCount: controller.chats.length,
              padding: EdgeInsets.symmetric(horizontal: 4.w),
            ),
          ),
        ),
      ),
    );
  }
}
