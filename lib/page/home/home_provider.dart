import 'package:answer_now_app/importer.dart';
import 'package:answer_now_app/repository/chat_repository.dart';

part 'home_provider.g.dart';

@riverpod
class Keyword extends _$Keyword {
  @override
  String? build() => null;

  void update(String value) {
    state = value;
  }
}

@Riverpod(keepAlive: true)
class Chats extends _$Chats {
  @override
  List<ChatIndexResponseItem?> build() => [];

  bool loading = false;
  int? cursor;

  void update(value) {
    state = [...state, ...value]
      ..sort((a, b) => b!.latestSendAt.compareTo(a!.latestSendAt));
  }

  Future<Result<ChatIndexResponse?>> getChats() async {
    try {
      if (!loading) {
        loading = true;
        final keyword = ref.read(keywordProvider);
        final data = await ref.read(chatRepositoryProvider).getChats(
              cursor = null,
              keyword,
            );
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

  Future<Result<ChatIndexResponse?>> addGetChats() async {
    try {
      if (!loading) {
        loading = true;
        if (cursor == null) {
          return Result();
        }
        final keyword = ref.read(keywordProvider);
        final data = await ref.read(chatRepositoryProvider).getChats(
              cursor,
              keyword,
            );
        if (data.isSuccess && data.data != null) {
          cursor = data.data!.cursor;
          update(data.data!.data!.toList());

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
}

@riverpod
ScrollController homeScroll(HomeScrollRef ref) {
  return ScrollController();
}
