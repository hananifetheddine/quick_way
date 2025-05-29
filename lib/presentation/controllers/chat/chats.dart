import 'package:get/get.dart';
import 'package:quick_way/domain/use_case/chat/get_chat.dart';

import '../../../data/network/error_handler.dart';
import '../../../domain/entities/chat/chat.dart';

class ChatsController extends GetxController {
  final GetChatsUseCase _getChatsUseCase;

  ChatsController(this._getChatsUseCase);

  List<Chat> chats = <Chat>[];

  @override
  onInit() {
    super.onInit();
    getChats();
  }

  Future<void> getChats() async {
    switchState();
    await _getData();
    switchState();
  }

  Future<void> refreshData() async {
    switchStateRefreshing();
    await _getData();
    switchStateRefreshing();
  }

  _getData() async {
    chats.clear();
    final result = await _getChatsUseCase.execute();
    result.fold(
      (failure) {
        this.failure.value = failure;
      },
      (chats) {
        this.chats.addAll(chats);
      },
    );
  }

  //UI
  final Rx<Failure> failure = Failure.noFailure.obs;
  RxBool fetching = false.obs;
  RxBool refreshing = false.obs;

  switchState() => fetching.toggle();

  switchStateRefreshing() => refreshing.toggle();
}
