import 'package:answer_now_app/importer.dart';
import 'package:answer_now_app/repository/base_repository.dart';

class ChatRepository extends BaseRepository {
  ChatRepository();

  Future<Result<ChatIndexResponse>> getChats(
    int? cursor,
    String? keyword,
  ) async {
    final result = runApi.run(
      onSuccess: () async {
        final token = await ref.read(secure_token_provider).getToken();
        final api = getClient(token).chat;
        final response = await api.getChats(
          cursor: cursor,
          keyword: keyword,
        );

        return response;
      },
    );

    return result;
  }

  Future<Result<ChatShowResponse>> getChatDetail(String uuid) async {
    final result = runApi.run(
      onSuccess: () async {
        final token = await ref.read(secure_token_provider).getToken();
        final api = getClient(token).chat;
        final response = await api.getChatDetail(
          uuid: uuid,
          limit: 100,
        );

        return response;
      },
    );

    return result;
  }

  Future<Result<JsonResponse>> postChatMessage(
    String chatUuid,
    String corporationUuid,
    String body,
  ) async {
    final result = runApi.run(
      onSuccess: () async {
        final token = await ref.read(secure_token_provider).getToken();
        final api = getClient(token).chat;
        final response = await api.saveChatMessage(
          body: ChatSaveMessageRequest(
            chatUuid: chatUuid,
            corporationUuid: corporationUuid,
            body: body,
          ),
        );

        return response;
      },
    );

    return result;
  }

  Future<Result<JsonResponse>> postReadChat(
    String chatUuid,
  ) async {
    final result = runApi.run(
      onSuccess: () async {
        final token = await ref.read(secure_token_provider).getToken();
        final api = getClient(token).chat;
        final response = await api.readChatMessage(
          body: ChatReadRequest(chatUuid: chatUuid),
        );

        return response;
      },
    );

    return result;
  }
}

final chatRepositoryProvider = Provider.autoDispose<ChatRepository>(
  (ref) => ChatRepository(),
);
