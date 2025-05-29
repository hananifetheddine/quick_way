import '../../../presentation/utils/enums.dart';

class Message {
  final int id;
  final DateTime date;
  final MessageChatSender sender;
  final String content;

  Message({
    required this.id,
    required this.date,
    required this.sender,
    required this.content,
  });

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      id: json["id"],
      date: DateTime.parse(json['date']),
      sender: json['sender'] == 'courier' ? MessageChatSender.courier : MessageChatSender.client,
      content: json['content'],
    );
  }
}
