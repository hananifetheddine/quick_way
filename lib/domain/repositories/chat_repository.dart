import 'package:dartz/dartz.dart';

import '../../data/network/error_handler.dart';
import '../entities/chat/chat.dart';

abstract class ChatRepository {
  Future<Either<Failure, List<Chat>>> getChats();
}
