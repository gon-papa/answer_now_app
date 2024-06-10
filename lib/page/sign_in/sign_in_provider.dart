import 'package:answer_now_app/importer.dart';
import 'package:answer_now_app/repository/auth_repository.dart';

part 'sign_in_provider.g.dart';

@riverpod
class Email extends _$Email {
  @override
  String? build() => "";

  void reset() => state = "";

  void update(String value) => state = value;

  bool get isValid => state?.isNotEmpty ?? false;
}

@riverpod
class Password extends _$Password {
  @override
  String? build() => "";

  void reset() => state = "";

  void update(String value) => state = value;

  bool get isValid => state?.isNotEmpty ?? false;
}

@riverpod
Future<Result> signIn(SignInRef ref) async {
  final email = ref.watch(emailProvider);
  final password = ref.watch(passwordProvider);

  try {
    final data = await ref.read(authRepositoryProvider).signIn(
          email!,
          password!,
        );

    if (data.isSuccess && data.data != null) {
      // ログイン成功時の処理
      final secureRepository = ref.read(secure_token_provider);
      secureRepository.saveToken(data.data!.accessToken);
      secureRepository.saveRefreshToken(data.data!.refreshToken);
      return data;
    } else {
      throw ApiException('予期せぬエラーが発生しました。');
    }
  } catch (e) {
    rethrow;
  }
}

@Riverpod(keepAlive: true)
GlobalKey<FormState> signInFormKey(SignInFormKeyRef ref) {
  return GlobalKey<FormState>();
}
