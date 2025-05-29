import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/network/error_handler.dart';
import '../../../data/repositories/chat_socket_repository.dart';
import '../../../domain/entities/chat/message.dart';
import '../../components/default_widgets/snack_bar.dart';
import '../../utils/enums.dart';
import 'chats.dart';

class ChatController extends GetxController {
  final ChatSocketRepository _socketController;
  final ChatsController _chatsController;
  ChatController(this._socketController, this._chatsController);

  RxList<Message> messages = <Message>[].obs;

  @override
  onInit() {
    super.onInit();
    _listenNode();
    initSocket();
  }

  initSocket() {
    startSwitching();
    _socketController.connect();
    _socketController.messageController.stream.listen(_newMessage);
    _socketController.chatController.stream.listen(_chat);
  }

  Future<void> sendMessage() async {
    var content = messageController.text;
    messageController.clear();
    var date = DateTime.now();
    var newMessage = Message(
        id: -1, date: date, sender: MessageChatSender.client, content: content);
    messages.insert(0, newMessage);
    animatedToEnd();
    var res = await _socketController.sendMessage(newMessage.content);
    res.fold((fai) {
      messages.removeWhere((item) => item.date == date);
      snackBarDetailsModel(snack: SnackCase.error, subTitle: fai.message);
    }, (r) => null);
    _chatsController.getChats();
  }

  _chat(List<Message> messages) {
    this.messages.clear();
    this.messages.addAll(messages);
    stopSwitching();
  }

  _newMessage(Message message) {
    messages.insert(0, message);
    _chatsController.getChats();
    animatedToEnd();
  }

  //UI
  TextEditingController messageController = TextEditingController();
  final ScrollController scrollController = ScrollController();
  Rx<Failure> failure = Failure.noFailure.obs;

  RxBool fetching = false.obs;

  startSwitching() => fetching.value = true;

  stopSwitching() => fetching.value = false;
  FocusNode node = FocusNode();
  RxBool showNoMessages = true.obs;

  _listenNode() {
    node.addListener(() =>
        Future.delayed(Duration(milliseconds: node.hasFocus ? 0 : 200), () {
          showNoMessages.value = !node.hasFocus;
        }));
  }

  animatedToEnd() {
    if (messages.isNotEmpty && scrollController.positions.isNotEmpty) {
      Future.delayed(const Duration(milliseconds: 100), () {
        try {
          scrollController.animateTo(
            0,
            duration: const Duration(milliseconds: 300),
            curve: Curves.fastOutSlowIn,
          );
        } on Exception catch (e) {
          // TODO
        }
      });
    }
  }

  suggest(String suggest) => messageController.text = suggest;
}
