import 'package:dartz/dartz.dart';

import 'package:quick_way/data/network/error_handler.dart';

import '../../domain/entities/chat/chat.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../domain/repositories/chat_repository.dart';
import '../network/api_provider.dart';
import '../network/api_request.dart';
import '../network/network_info.dart';
import '../network/paths.dart';

class ChatRepositoryImpl implements ChatRepository {
  final NetworkInfo _networkInfo;

  ChatRepositoryImpl(this._networkInfo);

  @override
  Future<Either<Failure, List<Chat>>> getChats() async {
    if (await _networkInfo.isConnected) {
      try {
        APIRequestRepresentable apiRequest = APIRequestRepresentable(
          url: AppPaths.chats,
          method: HTTPMethod.get,
        );
        var res =
            await APIProvider.instance.request(apiRequest, requestHttp: false);
        List<Chat> chats =
            res["chats"].map<Chat>((e) => Chat.fromJson(e)).toList();
        return Right(chats);
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return const Left(Failure.noInternet);
    }
  }
}
