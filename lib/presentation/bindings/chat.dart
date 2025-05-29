import 'package:get/get.dart';

import '../../data/network/network_info.dart';
import '../../data/repositories/chat_socket_repository.dart';
import '../controllers/chat/chat.dart';
import '../controllers/chat/chats.dart';

class ChatBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ChatSocketRepository(Get.find<NetworkInfoImpl>()));
    Get.put(ChatController(Get.find(), Get.find()));
  }
}
