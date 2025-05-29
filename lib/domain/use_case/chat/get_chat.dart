import 'package:dartz/dartz.dart';
import 'package:quick_way/domain/repositories/chat_repository.dart';

import '../../../data/network/error_handler.dart';
import '../../entities/chat/chat.dart';
import '../../entities/user/account.dart';
import '../base_usecase.dart';

class GetChatsUseCase implements BaseUseCaseNoParams<List<Chat>> {
  final ChatRepository _repository;

  GetChatsUseCase(this._repository);

  @override
  Future<Either<Failure, List<Chat>>> execute() async {
    return await _repository.getChats();
  }
}
