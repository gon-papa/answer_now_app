import 'package:answer_now_app/importer.dart';
import 'package:answer_now_app/repository/auth_repository.dart';

part 'user_provider.g.dart';

@Riverpod(keepAlive: true)
class User extends _$User {
  @override
  UserResponseItem? build() => null;

  Future<void> getMe() async {
    try {
      final result = await ref.read(authRepositoryProvider).getMe();

      if (result.isSuccess && result.data != null) {
        state = result.data!.data;
      } else {
        throw ApiException('予期せぬエラーが発生しました。');
      }
    } catch (e) {
      rethrow;
    }
  }
}
