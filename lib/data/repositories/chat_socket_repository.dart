import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;
import 'package:socket_io_client/socket_io_client.dart';

import '../../app/local.dart';
import '../../domain/entities/chat/message.dart';
import '../../main.dart';
import '../../presentation/components/default_widgets/snack_bar.dart';
import '../network/error_handler.dart';
import '../network/network_info.dart';
import '../network/paths.dart';

class ChatSocketRepository extends GetxController {
  final NetworkInfo _networkInfo;

  ChatSocketRepository(this._networkInfo);

  late String courierId;
  late int chatId;
  late io.Socket socket;

  @override
  void onInit() {
    super.onInit();
    courierId = Get.arguments?["courierId"];
  }

  StreamController<Message> messageController = StreamController<Message>();
  StreamController<List<Message>> chatController =
      StreamController<List<Message>>();

  initSocket() {
    socket = io.io(
        AppPaths.ioChat,
        OptionBuilder()
            .setTransports(['websocket']) // for Flutter or Dart VM
            .disableAutoConnect() // disable auto-connection
            .disableReconnection()
            .setExtraHeaders({'authorization': LocalService.accessToken})
            .build());
  }

  connect() {
    initSocket();
    socket.connect();
    trackSocket();
    socket.onConnect(getMessages);
    socket.onConnectError((data) {
      logger.e(data);
    });
    socket.onDisconnect((data) {
      logger.e("disconnect");
      logger.d(data);
    });
    newMessage();

    failure();
  }

  void getMessages(_) async {
    failed() {
      Get.back();
      snackBarDetailsModel(snack: SnackCase.error);
    }

    if (await _networkInfo.isConnected) {
      try {
        socket.emitWithAck("chat-client", {"courierId": courierId},
            ack: (data) {
          logger.i(data);
          if (data["success"]) {
            List<Message> messages = (data["messages"] as List)
                .map((element) => Message.fromJson(element))
                .toList();
            chatId = data["chatId"];
            chatController.add(messages);
          } else {
            failed();
          }
        });
      } on Exception catch (e) {
        failed();
      }
    } else {
      failed();
    }
  }

  void newMessage() {
    socket.on("new-message", (data) {
      var message = Message.fromJson(data["message"]);
      messageController.add(message);
    });
  }

  Future<Either<Failure, bool>> sendMessage(String content) async {
    if (socket.connected && await _networkInfo.isConnected) {
      Completer<bool> completer = Completer();
      socket.emitWithAck("send-message-client", {
        "content": content,
        "id": chatId,
      }, ack: (data) {
        completer.complete(data["success"]);
      });
      return await completer.future
          ? const Right(true)
          : const Left(Failure.defaultError);
    } else {
      return const Left(Failure.noInternet);
    }
  }

  Timer? timer;

  trackSocket() {
    timer?.cancel();
    timer = Timer.periodic(const Duration(seconds: 3), (timer) async {
      if (socket.disconnected && await _networkInfo.isConnected) {
        socket.connect();
      }
    });
  }

  void failure() {}
}
