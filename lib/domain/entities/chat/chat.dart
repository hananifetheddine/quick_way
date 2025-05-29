import '../user/courier.dart';
import 'message.dart';

class Chat {
  Courier courier;
  Message lastMessage;

  Chat({required this.courier, required this.lastMessage});

  factory Chat.fromJson(Map<String, dynamic> data) {
    return Chat(
        courier: Courier.fromJson(data["Courier"]),
        lastMessage: Message.fromJson(data["lastMessage"]));
  }
}
