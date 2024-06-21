import 'dart:convert';
import 'dart:math';

import 'package:answer_now_app/importer.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;

part 'chat_detail_provider.g.dart';

@riverpod
class ChatDetail extends _$ChatDetail {
  @override
  List<ChatShowResponseItem?> build(String uuid) => [];

  bool loading = false;
  int? cursor;

  List<types.Message> messages(types.User me) {
    final messages = state.map((e) {
      return types.TextMessage(
          author: createChatUser(e?.user, me),
          id: e?.uuid ?? '',
          text: e?.body ?? '',
          createdAt:
              e?.sendAt.add(const Duration(hours: 9)).millisecondsSinceEpoch ??
                  0,
          updatedAt:
              e?.sendAt.add(const Duration(hours: 9)).millisecondsSinceEpoch);
    }).toList();

    return messages;
  }

  types.User createChatUser(
    UserResponseItem? user,
    types.User author,
  ) {
    if (user != null) {
      if (user.uuid == author.id) return author;
      return types.User(
        id: user.uuid,
        firstName: user.accountName,
      );
    }
    return types.User(
      id: randomString(),
      firstName: "問い合わせUser",
    );
  }

  String randomString() {
    final random = Random.secure();
    final values = List<int>.generate(16, (i) => random.nextInt(255));
    return base64UrlEncode(values);
  }

  void update(value) {
    state = [...state, ...value]
      ..sort((a, b) => b!.sendAt.compareTo(a!.sendAt));
  }

  Future<Result<ChatShowResponse?>> getChatDetail() async {
    try {
      if (!loading) {
        loading = true;
        final data = await ref.read(chatRepositoryProvider).getChatDetail(uuid);
        if (data.isSuccess && data.data != null) {
          cursor = data.data!.cursor;
          state = data.data!.data!;

          return data;
        } else {
          throw ApiException('予期せぬエラーが発生しました。');
        }
      }
      return Result();
    } catch (e) {
      rethrow;
    } finally {
      loading = false;
    }
  }

  Future<Result<JsonResponse>> postChatMessage(
    String corporationUuid,
    String chatUuid,
    String body,
  ) async {
    try {
      final data = await ref
          .read(chatRepositoryProvider)
          .postChatMessage(chatUuid, corporationUuid, body);
      if (data.isSuccess) {
        return data;
      } else {
        throw ApiException('予期せぬエラーが発生しました。');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<Result<JsonResponse>> postReadChat() async {
    try {
      final data = await ref.read(chatRepositoryProvider).postReadChat(uuid);
      if (data.isSuccess) {
        return data;
      } else {
        throw ApiException('予期せぬエラーが発生しました。');
      }
    } catch (e) {
      rethrow;
    }
  }
}
