import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_way/presentation/components/default_widgets/cashed_network.dart';
import 'package:quick_way/presentation/controllers/chat/chats.dart';
import 'package:quick_way/presentation/resources/styles_manager.dart';
import 'package:sizer/sizer.dart';
import 'package:timeago/timeago.dart';
import '../../../../../domain/entities/chat/chat.dart';
import '../../../../resources/routes_manager.dart';

class ChatChatsComponent extends GetView<ChatsController> {
  const ChatChatsComponent({required this.chat, super.key});

  final Chat chat;

  @override
  Widget build(BuildContext context) {
    final difference = format(chat.lastMessage.date, locale: 'fr');
    return Card(
      elevation: 0,
      color: Colors.grey.withOpacity(0.2),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6.sp),
      ),
      child: ListTile(
        onTap: () => Get.toNamed(Routes.chatRoute,
            arguments: {"courierId": chat.courier.uid}),
        leading: roundedPic(url: chat.courier.profilePicture, size: 25),
        title: Text(
          chat.courier.fullName,
          style: getSemiBoldStyle(fontSize: 11.sp),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Row(
          children: [
            Flexible(
              child: Text(
                chat.lastMessage.content,
                style: getMediumStyle(fontSize: 10.sp),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Text(
              "  - $difference",
              style: getMediumStyle(fontSize: 9.sp, subTitle: true),
            ),
          ],
        ),
      ),
    );
  }
}
